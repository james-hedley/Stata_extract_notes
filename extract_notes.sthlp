{smcl}
{cmd:help extract_notes}
{hline}

{title:Title}

{p2col :{hi:extract_notes} {hline 2}}Extracts all notes from the current dataset, and exports them to a CSV file. Useful if providing data to non-Stata users. For example, the R package 'haven' will read in a Stata dataset, but ignores the notes. This command allows you to provide the notes along with the Stata dataset{p_end}


{title:Syntax}

{phang}{cmd:extract_notes} {it:filename} [, {opt r:eplace}]


{title:Description}

{phang}{cmd:extract_notes} extracts all notes attached to all variables in the current dataset, as well as to the dataset itself, and saves them as a CSV file with the specified filename


{title:Options}

{phang}{it:filename} is the name of the CSV file that will be created containing all of the notes associated with the current dataset

{phang}{opt replace} overwrites any previous file with the same filename


{title:Author}

{pstd}James Hedley{p_end}
{pstd}Murdoch Children's Research Institute{p_end}
{pstd}Melbourne, VIC, Australia{p_end}
{pstd}{browse "mailto:james.hedley@mcri.edu.au":james.hedley@mcri.edu.au}
