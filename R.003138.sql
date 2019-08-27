/*
R.003138

----------

Name: Test Zipcode Report
Created by: Robin Hastings

----------

Group: -
     -

Created on: 2018-12-04 08:06:59
Modified on: 2018-12-04 08:19:33
Date last run: 2018-12-04 15:11:45

----------

Public: 0
Expiry: 300

----------

Test for Leavenworth Zip code report

----------
*/

SELECT borrowers.zipcode, COUNT(DISTINCT borrowers.borrowernumber) AS 'Patrons' FROM borrowers where borrowers.branchcode='LEAVENWRTH' GROUP BY borrowers.zipcode



