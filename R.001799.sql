/*
R.001799

----------

Name: Card Numbers for school libraries
Created by: Heather Braum

----------

Group: School Libraries
     Students

Created on: 2013-04-19 14:06:12
Modified on: 2014-08-19 22:31:00
Date last run: 2018-08-15 12:48:59

----------

Public: 0
Expiry: 0

----------

Report that lists just cardnumbers; limits based on grade and branch. (for school libraries)

----------
*/

SELECT borrowers.cardnumber FROM borrowers LEFT JOIN borrower_attributes USING (borrowernumber) WHERE borrowers.branchcode=<<branch|branches>> AND borrower_attributes.attribute=<<grade|GRADE>> ORDER BY borrowers.surname LIMIT 300


