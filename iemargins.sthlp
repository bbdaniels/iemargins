{smcl}
{* 30 Jan 2018}{...}
{hline}
help for {hi:iemargins}
{hline}

{title:Title}

{phang}{cmdab:iemargins} {hline 2} Plots estimated marginal levels of outcome variables across treatment groups.

{title:Syntax}

{p 4 6 }
{cmdab:iemargins} {it:dependent_variable_list} {break}{p_end}
{p 4 6 }
  , {opth t:reatment(varname)} {break}
  [{opth c:ontrols(varlist)}] {break}
  [{opt graph:options(list_of_options)}] {break}
  [{help regress:regress_options}]

{pstd}The {bf:treatment()}  variable must be categorical,
and can have as many groups as you like. {break}
The {bf:graphoptions()} option accepts both {help twoway_options:twoway}
and {help marginsplot} styling options.{p_end}

{marker desc}
{title:Description}

{pstd}{cmdab:iemargins} This command calculates the predicted levels
of any number of outcome variables for each treatment group.
They are displayed in an array of graphs for quick visualization of
the size of differences between various treatment arms in a experiment.

{marker example}
{title:Examples}

{inp}    {stata sysuse auto , clear:sysuse auto , clear}
{inp}    {stata iemargins turn trunk , t(foreign) c(headroom):iemargins turn trunk , t(foreign) c(headroom)}

{title:Acknowledgements}

{phang}We would like to acknowledge inspiration from Emma Riley and David McKenzie.

{title:Author}

Benjamin Daniels
bbdaniels@gmail.com

{title:Contributing}

{p}{bf: iemargins} is open for development on {browse "https://bbdaniels.github.io/stata-code/iemargins/":GitHub}.
Submit bugs and feature requests {browse "https://github.com/bbdaniels/iemargins/issues":here}.
If you like {bf:iemargins}, be sure to visit my {browse "http://bbdaniels.github.io":homepage}
and {browse "https://gist.github.com/bbdaniels/a3c9f9416f1d16d6f3c6e8cf371f1d89":Stata boilerplate code}.{p_end}
