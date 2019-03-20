// Impact evaluation margins

cap prog drop iemargins
prog def iemargins

version 13.1

syntax varlist [if] [in] [aw fw pw iw], ///
  Treatment(varname)                    /// Treatment variable - must be categorical
  [Controls(varlist ts fv)]             /// Control variables - no restrictions
  [GRAPHoptions(string asis)]           /// Graph options - must use marginsplot styles in here
  [COMBine(string asis)]                /// Options for [graph combine]
  [ycom]                                /// Force y-axis to be the same for all outcomes
  [Level(real 95)]                      /// Adjust confidence level
  [*]                                   /// Regression options


// Run the regressions
local x = 1
qui foreach var in `varlist' {

  // Get the label
  local theLabel : var label `var'

  // Get an alphabetical index
  local theLetter : word `x' of `c(alpha)'

  // Check for horizontal graphs
  local y "y"
  if regexm("`graphoptions'","horiz") {
    local y "x"
  }

  // Regression and margins
  reg `var' i.`treatment' `controls' `if' `in' [`weight'`exp'], `options'
    margins `treatment' , l(`level')
    marginsplot , `y'scale(r(0)) `y'lab(0) `y'lab(#6) `y'tit(" ")  ///
      nodraw saving(`theLetter', replace) ///
      recast(bar) title("`theLabel'") `graphoptions' ///

  // Housekeeping
  local ++x
  local theGraphs "`theGraphs' `theLetter'.gph"

}

// Build the final graph
graph combine `theGraphs' , `ycom' `combine' graphregion(color(white))

// Cleanup
!rm `theGraphs'

// End
end

// Have a lovely day!
