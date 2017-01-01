# csvsplittr
R package to split a CSV into a number of smaller CSV files. 

Other software using CSV, such as the Linguistic Inquiry and Word Count (LIWC) program for computational text analysis, or even Google Sheets and Microsoft Excel, perform poorly or not at all with very large CSV files. This package provides a function to read a CSV file, split it into a specified number of files, and write those smaller files to the working directory.

There is one function,`split_csv()` which takes as inputs a file name for a CSV file and a specified number of files to split. It then splits the data frame output from reading the CSV file, rounding the number of rows in the data frame divided by the number of files to the ceiling, with the final split containing the rows remaining from the second to last split to the final row of the data frame output from reading the CSV File. The split files are saved to the working directory with a number appended to the original file name to indicate their position when split. The function does not return any values.
