/*
R.001977

----------

Name: Borrowers LInked on COLL-New Delinquent
Created by: Heather Braum

----------

Group: Library-Specific
     -

Created on: 2013-08-09 13:07:36
Modified on: 2013-11-17 12:35:35
Date last run: 2017-08-28 16:15:23

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/members/maninvoice.pl?=borrowernumber',borrowers.borrowernumber,'\" target="_blank">',borrowers.cardnumber,'</a>') AS "Link to Fines",  borrowers.borrowernumber, borrowers.surname, borrowers.firstname, borrowers.address, borrowers.city, borrowers.zipcode, borrowers.phone, borrowers.mobile, borrowers.phonepro AS "Alt Ph 1", borrowers.B_phone AS "Alt Ph 2", borrowers.branchcode, categories.category_type AS "Adult or Child", borrowers.dateofbirth, MAX(accountlines.date) AS "Most recent charge", FORMAT(SUM(accountlines.amountoutstanding),2) AS Due 
FROM accountlines 
LEFT JOIN borrowers USING(borrowernumber) 
LEFT JOIN categories USING(categorycode) 
WHERE borrowers.categorycode IN ('OTT-CITY','OTT-CITYJ','OTT-FRCO','OTT-FRCOJ','OTT-OTHR','OTT-OTHRJ') 
AND borrowers.borrowernumber NOT IN (SELECT DISTINCT borrowernumber FROM accountlines WHERE (accountlines.accounttype='PAY' OR accountlines.accounttype='C')) 
AND accountlines.date > DATE_SUB(CURDATE(), INTERVAL 90 day) 
AND accountlines.date < DATE_SUB(CURDATE(), INTERVAL 30 day) 
GROUP BY borrowers.borrowernumber 
HAVING Due >=25.00 
ORDER BY borrowers.surname ASC


