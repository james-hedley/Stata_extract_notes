# extract_notes
Extract all notes from a Stata dataset and save them in a CSV file. Useful for providing notes associated with a Stata dataset to non-Stata users. E.g. When opening a Stata dataset in R with haven::read_dta(), notes will be ignored. 

There are three ways to install this package:
  1. Install within Stata using -net install
  
    net install extract_notes, from("https://raw.githubusercontent.com/james-hedley/extract_notes/main/")
  
  2. Download the .ado and .sthlp files, and save them in your personal ADO folder. You can find where your personal ADO folder is located by typing -sysdir- in Stata
 
  3. Manually install within Stata (if -net install- fails). To install the command and then view the help file type:
    
    do "https://raw.githubusercontent.com/james-hedley/extract_notes/main/extract_notes.do"
    
    type "https://raw.githubusercontent.com/james-hedley/extract_notes/main/extract_notes.sthlp"
