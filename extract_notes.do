// Project: Stata command to extract notes as a separate CSV file
// Created by: James Hedley
// Date created: 26th March 2021
// Last updated: 26th March 2021


* Program
capture program drop extract_notes
program define extract_notes, rclass
	syntax anything(name=filename) [, Replace]
	
	quietly {
		* Remove quotes from input filename
		local filename `filename'

		* Create a temporary dataset to store notes
		tempname memhold
		tempfile results
		postfile `memhold' str32(variable) int(notenumber) ///
			str2000(note_part1 note_part2 note_part3 note_part4 note_part5) /// 5 separate variables to ensure notes of up to 10,000 characters are captured correctly
			using `results'
		
	
		* Progress message
		noisily display "Extracting notes..."
	
		* Loop through each variable and extract notes
		ds
		foreach var in _dta `r(varlist)' {
			** Extract note
			notes _count notecount : `var'
			if `notecount'!=0 {
				forvalues i=1/`notecount' {
					notes _fetch note`i' : `var' `i'
				
				** Split note into at most 5 parts of 2000 characters each
				local note_part1=substr("`note`i''",1,2000)
				local note_part2=substr("`note`i''",2001,4000)
				local note_part3=substr("`note`i''",4001,6000)
				local note_part4=substr("`note`i''",6001,8000)
				local note_part5=substr("`note`i''",8001,10000)
				
				** Save each note to the temporary notes dataset
					post `memhold' ("`var'") (`i') ///
						("`note_part1'") ("`note_part2'") ("`note_part3'") ///
						("`note_part4'") ("`note_part5'")  
				}
			}
		}

		* Clean and save the temporary notes dataset
		preserve
		
			** Open notes dataset
			postclose `memhold'
			use "`results'", clear

			** Clean notes dataset
			gen note=note_part1+note_part2+note_part3+note_part4+note_part5
			drop note_part1 note_part2 note_part3 note_part4 note_part5
			replace note=stritrim(note)

			** Save notes dataset
			export delimited "`filename'", `replace' delimiter(",") quote
		restore
		
		** Display message upon completion
		noisily display "Finished!"
	}

end


	
	
