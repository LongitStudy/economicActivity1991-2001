# Employment Status 
This repository consists of two Stata .do files, one for 1991-2001 and the other for 2001-2011. For each period the syntax creates two cross-sectional employment status variables and combines them into a longitudinal employment status variable.

The cross-sectional variables for 1991, 2001 and 2011 are coded:
- 1=employed
- 2=unemployed
- 3=student
- 4=house minders
- 5=other (sick, retired, other)

The longitudinal variables (1991-2001 and 2001-2011) are coded:
- 1=employed T1 & T2
- 2=employed T1, unemployed T2
- 3=employed T1, student T2
- 4=employed T1, home minder T2
- 5=employed T1, other T2
- 6=unemployed T1, employed T2
- 7=unemployed T1 & T2
- 8=unemployed T1, student T2
- 9=unemployed T1, home minder T2
- 10=unemployed T1, other T2
- 11=student T1, employed T2
- 12=student T1, unemployed T2
- 13=student T1, student T2
- 14=student T1, home minder T2
- 15=student T1, other T2
- 16=home minder T1, employed T2
- 17=home minder T1, unemployed T2
- 19=home minder T1, home minder T2
- 20=home minder T1, other T2
- 21=other T1, employed T2
- 22=other T1, unemployed T2
- 23=other T1, student T2
- 24=other T1, home minder T2
- 25=other T1, other T2
(for 1991-2001 T1=1991 and T2=2001, and for 2001-2011 T1=2001 and T2=2011).

For the 1991-2001 period you will need to ensure that you have the following variables in your data:
- econpo89 (from ME91)
- ecop80 and ecopimp (from ME01).

And for 2001-2011 you will need the variables:
- ecop81 and ecopimp (from ME01)
- ecop81 and ecop11_imp (from ME11).
