/*
R.002452

----------

Name: Breakdown of patrons by gender
Created by: Heather Braum

----------

Group: Patrons
     Patron Statistics

Created on: 2015-01-28 15:35:25
Modified on: 2015-01-28 15:36:47
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT sex, count(*) FROM borrowers WHERE branchcode=<<branch|branches>> GROUP BY sex



