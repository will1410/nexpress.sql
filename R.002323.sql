/*
R.002323

----------

Name: Checking for duplicate school patrons
Created by: Heather Braum

----------

Group: Administrative Reports
     School Libraries-admin

Created on: 2014-08-15 11:14:32
Modified on: 2014-08-19 22:32:19
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT surname, firstname, GROUP_CONCAT(cardnumber SEPARATOR ', ') AS barcodes,
GROUP_CONCAT(borrowernumber SEPARATOR ', ') AS borrowers 
FROM borrowers 
WHERE branchcode LIKE 'PH%' AND categorycode='STUDENT'
GROUP BY CONCAT(trim(surname),"/",trim(firstname),"/") 
HAVING COUNT(CONCAT(trim(surname),"/",trim(firstname),"/"))>1


