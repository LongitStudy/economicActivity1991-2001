/*ecac0111

-	This .do file generates two economic activity variables for 2001 and 2011 (employ0
	and employ11) from ecop80 and ecop811
-	It recodes them to: 1=employed; 2=unemployed; 3=Student; 4=houseminders;
	5=Other (sick, retired, other)
-	It also combines the two into a longitudinal variable coded as follows:
	1 employed 01 & 11; 2 employed 01 unemployed 11; 3 employed 01 student 11
	4 employed 01 home minder 11; 5 employed 01 other 11; 6 unemployed 01 employed 11
	7 unemployed 01 & 01; 8 unemployed 01 student 11; 9 unemployed 01 home minder 11
	10 unemployed 01 other 11; 11 student 01 employed 11; 12 student 01 unemployed 11
	13 student 01 student 11; 14 student 01 home minder 11; 15 student 01 other 11
	16 home minder 01 employed 11; 17 home minder 01 unemployed 11; 19 home minder 
	01 home minder 11; 20 home minder 01 other 11; 21 other 01 employed 11; 
	22 other 01 unemployed 11; 23 other 01 student 11; 24 other 01 home minder 11;
	25 other 01 other 11 

Uses the following variables:
ME01 - ecop80 and ecopimp
ME11 - ecop81 


1) Make sure that you change your working directory to your project area
cd "P:\......"

2) Open the dataset that you want to add the derived variable to. Make sure that it has all the variables that are in the variables list above)
********************************************************************************/

gen employ0 = ecop80
gen employ11 = ecop81

* recode to 1 = employed, 2 = unemployed, 3 = students, 4 = house minders 5 = others (sick, retired, other)
*for 2001
recode employ0 1/6 = 1 7/8 = 2 18 = 3 19 = 4 17 = 5 20/21 = 5
label variable employ0 "Employment status in 2001"
tab ecop80 employ0

* and for 2011
recode employ11 1/6 = 1 7 = 2 16 = 3 17 = 4 15=5 18/19 = 5
label variable employ11 "Employment status in 2011"
tab ecop81 employ11

label define employ 1 "Employed" 2 "Unemployed" 3 "Students" 4 "House Minders" 5 "Others (sick,retired,other)"
label val employ0 employ
label val employ11 employ

tab employ0 ecop80
tab employ11 ecop81
**************************************************************
* option to set students as employed /unemployed (lose student group)

*recode employ9 3 = 1 if econpo9 <= 5
*recode employ9 3 = 2 if econpo9 >= 6
*recode employ0 1/6 = 1 7/8 17 19/21 = 2
*
***************************************************************

* set employment status - see label values for interpretation of coding

gen empstat0111 =.

label variable empstat0111 "Employment Status in 2001 and 2011"

replace empstat0111 = 1 if employ0 == 1 & employ11 == 1
replace empstat0111 = 2 if employ0 == 1 & employ11 == 2
replace empstat0111 = 3 if employ0 == 1 & employ11 == 3
replace empstat0111 = 4 if employ0 == 1 & employ11 == 4
replace empstat0111 = 5 if employ0 == 1 & employ11 == 5

replace empstat0111 = 6 if employ0 == 2 & employ11 == 1
replace empstat0111 = 7 if employ0 == 2 & employ11 == 2
replace empstat0111 = 8 if employ0 == 2 & employ11 == 3
replace empstat0111 = 9 if employ0 == 2 & employ11 == 4
replace empstat0111 = 10 if employ0 == 2 & employ11 == 5


*treat students and housewives separately

replace empstat0111 = 11 if employ0 == 3 & employ11 == 1
replace empstat0111 = 12 if employ0 == 3 & employ11 == 2
replace empstat0111 = 13 if employ0 == 3 & employ11 == 3
replace empstat0111 = 14 if employ0 == 3 & employ11 == 4
replace empstat0111 = 15 if employ0 == 3 & employ11 == 5

replace empstat0111 = 16 if employ0 == 4 & employ11 == 1
replace empstat0111 = 17 if employ0 == 4 & employ11 == 2
replace empstat0111 = 20 if employ0 == 4 & employ11 == 3
replace empstat0111 = 19 if employ0 == 4 & employ11 == 4
replace empstat0111 = 20 if employ0 == 4 & employ11 == 5

replace empstat0111 = 21 if employ0 == 5 & employ11 == 1
replace empstat0111 = 22 if employ0 == 5 & employ11 == 2
replace empstat0111 = 23 if employ0 == 5 & employ11 == 3
replace empstat0111 = 24 if employ0 == 5 & employ11 == 4
replace empstat0111 = 25 if employ0 == 5 & employ11 == 5
 

lab def empstat0111 1 "employed 01 & 11" 2 "employed 01 unemployed 11" 3 "employed 01 student 11" 4 "employed 01 home minder 11" 5 "employed 01 other 11" 6 "unemployed 01 employed 11" 7 "unemployed 01 & 11" 8 "unemployed 01 student 11" 9 "unemployed 01 home minder 11" 10 "unemployed 01 other 11" 11 "student 01 employed 11" 12 "student 01 unemployed 11" 13 "student 01 student 11" 14 "student 01 home minder 11" 15 "student 01 other 11" 16 "home minder 01 employed 11" 17 "home minder 01 unemployed 11" 19 "home minder 01 home minder 11" 20 "home minder 01 other 11" 21 "other 01 employed 11" 22 "other 01 unemployed 11" 23 "other 01 student 11" 24 "other 01 home minder 11" 25 "other 01 other 11" 
	  
label values empstat0111 empstat0111

tab empstat0111 employ0
tab empstat0111 employ11
tab empstat0111

*SAVE YOIUR DATA