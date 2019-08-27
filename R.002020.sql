/*
R.002020

----------

Name: COLL-updatedel
Created by: Robin Hastings

----------

Group: Library-Specific
     Ottawa

Created on: 2013-08-30 15:26:06
Modified on: 2015-01-06 15:41:24
Date last run: 2017-12-22 09:45:12

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT borrowers.borrowernumber, borrowers.surname, borrowers.firstname, FORMAT(SUM(accountlines.amountoutstanding),2) AS Due 
FROM accountlines 
LEFT JOIN borrowers USING(borrowernumber) 
LEFT JOIN categories USING(categorycode) 
WHERE borrowers.branchcode IN ('OTTAWA')  
AND borrowers.sort1 = 'yes'
GROUP BY borrowers.borrowernumber 
ORDER BY borrowers.surname ASC



