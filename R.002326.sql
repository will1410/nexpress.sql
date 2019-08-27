/*
R.002326

----------

Name: Teachers for 2014-2015 School Year
Created by: Heather Braum

----------

Group: School Libraries
     Teachers

Created on: 2014-08-15 14:51:21
Modified on: 2014-08-19 22:30:18
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/members/moremember.pl?borrowernumber=',b.borrowernumber,'\" target="_blank">'"view patron"'</a>') as "view patron",  b.cardnumber, b.surname, b.firstname, b.othernames, b.email, b.dateofbirth, b.branchcode, b.categorycode, b.userid, b.sort1, b.dateexpiry, b.dateenrolled, ba_UPDATED.attribute AS updated
FROM borrowers b
LEFT JOIN borrower_attributes ba_UPDATED ON (b.borrowernumber = ba_UPDATED .borrowernumber AND ba_UPDATED .code = 'UPDATED ')
WHERE b.branchcode LIKE 'PH%' AND b.categorycode NOT IN ('STAFF','STUDENT')
GROUP BY b.borrowernumber
ORDER BY b.categorycode, b.branchcode, b.surname,  b.firstname



