/*
R.002325

----------

Name: Sort1 fields in use for schools
Created by: Heather Braum

----------

Group: Administrative Reports
     School Libraries-admin

Created on: 2014-08-15 14:27:28
Modified on: 2014-08-19 22:29:54
Date last run: -

----------

Public: 0
Expiry: 0

----------

(for creating patron barcode sheets)

----------
*/

SELECT branchcode, othernames FROM borrowers WHERE branchcode LIKE 'PH%' AND categorycode='STUDENT' AND othernames <> '' GROUP BY othernames, branchcode ORDER BY branchcode, sort1 LIMIT 200



