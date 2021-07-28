# extract_notes
Extract all notes from a Stata dataset and save them in a CSV file. Useful for providing notes associated with a Stata dataset to non-Stata users. E.g. When opening a Stata dataset in R with haven::read_dta(), notes will be ignored. 

There are two ways to use this package:
  1. Download the .ado and .sthlp files, and save them in your personal ADO folder. You can find where your personal ADO folder is located by typing sysdir in Stata
  2. Installing the command within Stata
  
    To install the command type:
    do "https://raw.githubusercontent.com/james-hedley/extract_notes/main/extract_notes.do"
    
    To view the help type:
    type "https://raw.githubusercontent.com/james-hedley/extract_notes/main/extract_notes.sthlp"
