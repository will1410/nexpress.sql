/*
R.002390

----------

Name: Patrons addresses
Created by: SABETHA TECH

----------

Group: Patrons
     -

Created on: 2014-10-09 10:26:55
Modified on: 2019-05-13 12:45:41
Date last run: 2019-11-13 11:52:10

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT (borrowers.address), borrowers.surname,borrowers.firstname,borrowers.address FROM borrowers   WHERE borrowers.branchcode='TONGANOXIE' AND borrowers.categorycode='ADULT' GROUP BY borrowers.address



