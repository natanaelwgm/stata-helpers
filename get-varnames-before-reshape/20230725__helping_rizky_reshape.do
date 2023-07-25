
** BIKIN DATASET FAKE

clear
foreach var in aaa bbb ccc {
	forval year = 2010/2015 {
		gen `var'`year' = .
	}
}
describe

** RUN METHOD

local varnames_without_year 
foreach var of varlist _all {
local original_varname = "`var'"
forval year = 2010/2015 {
if regexm("`original_varname'", "`year'") == 1 {
local no_year_varname = subinstr("`original_varname'", "`year'", "", .)
continue, break
}
}
if regexm("`varnames_without_year'", "`no_year_varname'") == 0 {
loc varnames_without_year `varnames_without_year' `no_year_varname'
}
}

di "`varnames_without_year'"
