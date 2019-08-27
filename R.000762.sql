/*
R.000762

----------

Name: Yearly New patrons added
Created by: NEKLS Administrator

----------

Group: Administrative Reports
     Daily, Monthly, Yearly Stats-admin

Created on: 2009-12-31 11:19:28
Modified on: 2014-01-05 22:58:12
Date last run: 2019-03-06 13:20:49

----------

Public: 0
Expiry: 0

----------

Enter Year for Count of patrons added in a certain year. Year End Report

----------
*/

SELECT branchcode,COUNT(*) FROM borrowers WHERE YEAR(dateenrolled)= <<Year>> GROUP BY branchcode ORDER BY branchcode



