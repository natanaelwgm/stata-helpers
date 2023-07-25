# Getting variable names before reshaping in Stata 

This can be some struggle: we have created wide version of data after merging several datasets successfully (e.g., data2015, data2016, ....) but then when we want to reshape it in Stata we find it not so straightforward to detect all the variable names that will be used as input to the reshape function.

I create this .do file to share what I normally do, hope this helps!
