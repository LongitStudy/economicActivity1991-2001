# Employment Status 1991-2001
This syntax creates two employment status variables, one for 1991 (employ9) and one for 2001 (employ0). These variables are coded as:
- 1=employed
- 2=unemployed
- 3=Student
- 4=houseminders
- 5=Other (sick, retired, other)
	
It then combines them into a longitudinal employment status variable for 1991-2001 (empstat9101), coded as:
- 1=employed 91 & 01
- 2=employed 91, unemployed 01
- 3=employed 91, student 01
- 4=employed 91, home minder 01
- 5=employed 91, other 01
- 6=unemployed 91, employed 01
- 7=unemployed 91 & 01
- 8=unemployed 91, student 01
- 9=unemployed 91, home minder 01
- 10=unemployed 91, other 01
- 11=student 91, employed 01
- 12=student 91, unemployed 01
- 13=student 91, student 01
- 14=student 91, home minder 01
- 15=student 91, other 01
- 16=home minder 91, employed 01
- 17=home minder 91, unemployed 01
- 19=home minder 91, home minder 01
- 20=home minder 91, other 01
- 21=other 91, employed 01
- 22=other 91, unemployed 01
- 23=other 91, student 01
- 24=other 91, home minder 01
- 25=other 91, other 01 

You will need to ensure that you have the following variables in your data:
- econpo89 (from ME91)
- ecop80 and ecopimp (from ME01).
