/*
R.002054

----------

Name: Coll-newdelinq-hiaw
Created by: Robin Hastings

----------

Group: Library-Specific
     Hiawatha

Created on: 2013-10-22 12:09:53
Modified on: 2015-02-26 12:54:21
Date last run: -

----------

Public: 0
Expiry: 0

----------

Finds overdue books at Hiawatha with more than $25 due for more than 60 days.

----------
*/

SELECT borrowers.cardnumber, borrowers.borrowernumber, borrowers.surname, borrowers.firstname, borrowers.address, borrowers.address2, borrowers.city, borrowers.zipcode, borrowers.phone, borrowers.mobile, borrowers.phonepro AS "Alt Ph 1", borrowers.B_phone AS "Alt Ph 2", borrowers.branchcode, categories.category_type AS "Adult or Child", borrowers.dateofbirth, MAX(accountlines.date) AS "Most recent charge", FORMAT(SUM(accountlines.amountoutstanding),2) AS Due 
FROM accountlines 
LEFT JOIN borrowers USING(borrowernumber) 
LEFT JOIN categories USING(categorycode) 
WHERE borrowers.branchcode IN ('HIAWATHA') 
AND borrowers.sort1 != 'yes'
AND accountlines.date > DATE_SUB(CURDATE(), INTERVAL 3 year) 
AND accountlines.date < DATE_SUB(CURDATE(), INTERVAL 60 day) 
GROUP BY borrowers.borrowernumber 
HAVING Due >=25.00 
ORDER BY borrowers.surname ASC



