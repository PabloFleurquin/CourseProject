# Explanation on naming convention used for the variables
=========================================================================

1. The features.txt has been used to read the variables name.
2. For each var name in this file some character expressions has been eliminated using gsub function:
	- Parenthesis
	- Underscore
	- Dash
	- Comma
3. All variables name are in lower-case (I couldn't do week 4, that apparently from the discussion board is where the variable name explanation is)

## Code explanation
1. Load data with read.table function. features.txt is loaded and at the same time tranformed into a vector, in order to apply gsub().
2. Apply gsub to the vector string read from features.txt. Clean names following the naming conventions (using regular expressions).
3. Give the different dataframes the appropiate variable names.
4. Merge the data first by using cbind (same number of rows), followed by rbind (same variables).
5. Create a datset with the mean for each subject for all the variables in the merged dataset.
6. Write to file both datasets.

