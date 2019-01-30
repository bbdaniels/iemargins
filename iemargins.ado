// Impact evaluation margins

cap prog drop iemargins
prog def iemargins

version 13.1

syntax varlist , ///
  Treatment(varname)                    /// Treatment variable - must be categorical
  [Controls(varlist ts fv)]             /// Control variables - no restrictions
  [GRAPHoptions(string asis)]           /// Graph options - must use marginsplot styles in here
  [*]                                   /// Regression options


// Run the regressions
local x = 1
qui foreach var in `varlist' {

  // Get the label
  local theLabel : var label `var'

  // Get an alphabetical index
  local theLetter : word `x' of `c(alpha)'

  // Regression and margins
  reg `var' i.`treatment' `control' , `options'
    margins `treatment'
    marginsplot , yscale(r(0)) ytit(" ")  ///
      nodraw saving(`theLetter', replace) ///
      recast(bar) title("`theLabel'") `graphoptions' ///

  // Housekeeping
  local ++x
  local theGraphs "`theGraphs' `theLetter'.gph"

}

// Build the final graph
graph combine `theGraphs' , ycom graphregion(color(white))

// Cleanup
!rm `theGraphs'

// End
end

// Have a lovely day!
