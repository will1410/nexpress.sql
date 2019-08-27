/*
R.002003

----------

Name: COLL-notdelinq-linked
Created by: Robin Hastings

----------

Group: Library-Specific
     Ottawa

Created on: 2013-08-16 08:45:37
Modified on: 2015-01-06 15:42:49
Date last run: -

----------

Public: 0
Expiry: 0

----------

Remove sort1 flag from accounts in Ottawa

----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/members/moremember.pl?borrowernumber=',borrowers.borrowernumber,'\" target="_blank">',borrowers.cardnumber,'</a>') AS "Link to Fines", borrowers.borrowernumber, borrowers.surname, borrowers.firstname, FORMAT(SUM(accountlines.amountoutstanding),2) AS Due 
FROM accountlines 
LEFT JOIN borrowers USING(borrowernumber) 
LEFT JOIN categories USING(categorycode) 
WHERE borrowers.branchcode IN ('OTTAWA') 
AND borrowers.sort1 = 'yes'
AND borrowers.borrowernumber NOT IN (SELECT DISTINCT borrowernumber FROM accountlines WHERE (accountlines.accounttype='PAY' OR accountlines.accounttype='C')) 
HAVING Due = 0.00
SET borrowers.sort1 = ''
ORDER BY borrowers.surname ASC



