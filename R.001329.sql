/*
R.001329

----------

Name: List of patrons added in a year
Created by: -

----------

Group: Patrons
     -

Created on: 2012-03-02 14:27:15
Modified on: 2013-09-25 17:14:36
Date last run: 2019-07-30 17:38:51

----------

Public: 0
Expiry: 0

----------

Choose branch and enter year added to list. #patrons

----------
*/

SELECT borrowers.dateenrolled, borrowers.surname,borrowers.firstname,borrowers.branchcode,borrowers.categorycode, borrowers.cardnumber,borrowers.address,borrowers.city,borrowers.phone,borrowers.email FROM borrowers WHERE year(dateenrolled) = << numericyear >> AND borrowers.branchcode = <<Pick your branch|branches>> ORDER BY borrowers.categorycode ASC


