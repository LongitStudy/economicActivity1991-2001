/*ecac9101

-	This .do file generates two economic activity variables for 1991 and 2001 
	(employ9 and employ0) from econpo89 and ecop80.
-	It recodes them to: 1=employed; 2=unemployed; 3=Student; 4=houseminders;
	5=Other (sick, retired, other)
-	It also combines the two into a longitudinal variable coded as follows:
	1 employed 91 & 01; 2 employed 91 unemployed 01; 3 employed 91 student 01
	4 employed 91 home minder 01; 5 employed 91 other 01; 6 unemployed 91 employed 01
	7 unemployed 91 & 01; 8 unemployed 91 student 01; 9 unemployed 91 home minder 01
	10 unemployed 91 other 01; 11 student 91 employed 01; 12 student 91 unemployed 01
	13 student 91 student 01; 14 student 91 home minder 01; 15 student 91 other 01
	16 home minder 91 employed 01; 17 home minder 91 unemployed 01; 19 home minder 
	91 home minder 01; 20 home minder 91 other 01; 21 other 91 employed 01; 
	22 other 91 unemployed 01; 23 other 91 student 01; 24 other 91 home minder 01;
	25 other 91 other 01 

Uses the following variables:
ME91 - econpo89
ME01 - ecop80 and ecopimp


1) Make sure that you change your working directory to your project area
cd "P:\......"


2) Open the dataset that you want to add the derived variable to. Make sure that it has all the variables that are in the variables list above)
********************************************************************************/

gen employ9 = econpo89
gen employ0 = ecop80

* recode to 1 = employed, 2 = unemployed, 3 = students, 4 = house minders 5 = others (sick, retired, other)

recode employ9 1/5 = 1 6/7 = 2 8 = 3 11=4 9/10 12 = 5

* and for 2001

recode employ0 1/6 = 1 7/8 = 2 18 = 3 19 = 4 17 20/21 = 5
label variable employ9 "Employment status in 1991"
label variable employ0 "Employment status in 2001"

label define employ 1 "Employed" 2 "Unemployed" 3 "Students" 4 "House Minders" 5 "Others (sick,retired,other)"
label val employ9 employ
label val employ0 employ

tab employ9
tab employ0
**************************************************************
* option to set students as employed /unemployed (lose student group)
*
*recode employ9 3 = 1 if econpo9 <= 5
*recode employ9 3 = 2 if econpo9 >= 6
*recode employ0 1/6 = 1 7/8 17 19/21 = 2
*
***************************************************************

* set employment status - see label values for interpretation of coding

gen empstat9101 =.

label variable empstat9101 "Employment Status in 1991 and 2001"

replace empstat9101 = 1 if employ9 == 1 & employ0 == 1
replace empstat9101 = 2 if employ9 == 1 & employ0 == 2
replace empstat9101 = 3 if employ9 == 1 & employ0 == 3
replace empstat9101 = 4 if employ9 == 1 & employ0 == 4
replace empstat9101 = 5 if employ9 == 1 & employ0 == 5

replace empstat9101 = 6 if employ9 == 2 & employ0 == 1
replace empstat9101 = 7 if employ9 == 2 & employ0 == 2
replace empstat9101 = 8 if employ9 == 2 & employ0 == 3
replace empstat9101 = 9 if employ9 == 2 & employ0 == 4
replace empstat9101 = 10 if employ9 == 2 & employ0 == 5


*treat students and housewives separately

replace empstat9101 = 11 if employ9 == 3 & employ0 == 1
replace empstat9101 = 12 if employ9 == 3 & employ0 == 2
replace empstat9101 = 13 if employ9 == 3 & employ0 == 3
replace empstat9101 = 14 if employ9 == 3 & employ0 == 4
replace empstat9101 = 15 if employ9 == 3 & employ0 == 5

replace empstat9101 = 16 if employ9 == 4 & employ0 == 1
replace empstat9101 = 17 if employ9 == 4 & employ0 == 2
replace empstat9101 = 20 if employ9 == 4 & employ0 == 3
replace empstat9101 = 19 if employ9 == 4 & employ0 == 4
replace empstat9101 = 20 if employ9 == 4 & employ0 == 5

replace empstat9101 = 21 if employ9 == 5 & employ0 == 1
replace empstat9101 = 22 if employ9 == 5 & employ0 == 2
replace empstat9101 = 23 if employ9 == 5 & employ0 == 3
replace empstat9101 = 24 if employ9 == 5 & employ0 == 4
replace empstat9101 = 25 if employ9 == 5 & employ0 == 5
 

lab def empstat9101 1 "employed 91 & 01" 2 "employed 91 unemployed 01" ///
	3 "employed 91 student 01" 4 "employed 91 home minder 01" ///
	5 "employed 91 other 01" 6 "unemployed 91 employed 01" ///
	7 "unemployed 91 & 01" 8 "unemployed 91 student 01" ///
	9 "unemployed 91 home minder 01" 10 "unemployed 91 other 01" ///
	11 "student 91 employed 01" 12 "student 91 unemployed 01" ///
	13 "student 91 student 01" 14 "student 91 home minder 01" ///
	15 "student 91 other 01" 16 "home minder 91 employed 01" ///
	17 "home minder 91 unemployed 01" 19 "home minder 91 home minder 01" ///
	20 "home minder 91 other 01" 21 "other 91 employed 01" ///
	22 "other 91 unemployed 01" 23 "other 91 student 01" ///
	24 "other 91 home minder 01" 25 "other 91 other 01" 
	  
label values empstat9101 empstat9101

tab empstat9101

*SAVE YOUR DATA