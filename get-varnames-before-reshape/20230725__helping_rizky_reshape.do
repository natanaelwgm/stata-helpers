
** CREATE FAKE DATASET 

clear
foreach var in aaa bbb ccc {
	forval year = 2010/2015 {
		gen `var'`year' = .
	}
}
describe

** RUN METHOD

local varnames_without_year  // set up empty local to store the resulting query

foreach var of varlist _all {  // iterate over the variables 

	local original_varname = "`var'" // store the variable name as a string local

	forval year = 2010/2015 { // iterate over the years
		if regexm("`original_varname'", "`year'") == 1 { // check if the varname exists either of the years
		local no_year_varname = subinstr("`original_varname'", "`year'", "", .) // create another string local that consists of cleaned varname
		continue, break // break loop if found
		}
	}

	if regexm("`varnames_without_year'", "`no_year_varname'") == 0 { // check first if the current varname is already in the existing list of vars
		loc varnames_without_year `varnames_without_year' `no_year_varname' // add to the list if new
	}
}

di "`varnames_without_year'" //  show list of variables
