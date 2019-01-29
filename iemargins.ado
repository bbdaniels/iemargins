// Impact evaluation margins

cap prog drop iemargins
prog def iemargins

syntax varlist , Treatment(varname fv) [Controls(varlist ts fv)] ///
  [GRAPHoptions(string asis)] [*]

// Run the regressions
local x = 1
qui foreach var in `varlist' {

  // Get the label
  local theLabel : var label `var'

  // Get an alphabetical index
  local theLetter : word `x' of `c(alpha)'

  // Regression and margins
  reg `var' `treatment' `control' , `options'
    margins `treatment'
    marginsplot , nodraw saving(`theLetter', replace) ///
      recast(bar) title("`theLabel'") `graphoptions'

  // Housekeeping
  local ++x
  local theGraphs " `theGraphs'`theLetter'.gph  "

}

// Build the final graph
graph combine `theGraphs' , ycom

// End
end

// Have a lovely day!
