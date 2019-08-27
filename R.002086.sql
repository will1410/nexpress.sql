/*
R.002086

----------

Name: Borrower account table count overview
Created by: Heather Braum

----------

Group: Administrative Reports
     Slow Patrons - admin

Created on: 2013-11-05 12:34:36
Modified on: 2015-09-11 12:29:27
Date last run: -

----------

Public: 0
Expiry: 0

----------

For tracking slowness in circulation. Enter borrowernumber and run report. 

----------
*/

SELECT p.borrowernumber, CONCAT(p.firstname,' ', p.surname) as name, p.cardnumber,p.branchcode, p.categorycode,
CONCAT ('<a href=\"/cgi-bin/koha/circ/circulation.pl?borrowernumber=',p.borrowernumber,'\" target="_blank">'"circ tab"'</a>') AS "circ tab", 
CONCAT ('<a href=\"/cgi-bin/koha/members/moremember.pl?borrowernumber=',p.borrowernumber,'\" target="_blank">'"more details tab"'</a>') AS "more details tab", 
(SELECT count(oi.timestamp) FROM old_issues oi WHERE oi.borrowernumber=p.borrowernumber) as oldissues, 
(SELECT count(i.timestamp) FROM issues i WHERE i.borrowernumber=p.borrowernumber) as issues,
(SELECT count(oh.reserve_id) FROM old_reserves oh WHERE oh.borrowernumber=p.borrowernumber) as oldreserves,
(SELECT count(r.reserve_id) FROM reserves r WHERE r.borrowernumber=p.borrowernumber) as reserves, 
(SELECT count(a.accountlines_id) FROM accountlines a WHERE a.borrowernumber=p.borrowernumber) as accountlines, 
(SELECT count(s.datetime) FROM statistics s WHERE s.borrowernumber=p.borrowernumber) as stats,
(SELECT count(m.message_id) FROM messages m WHERE m.borrowernumber=p.borrowernumber) as messages,
(SELECT count(p2.guarantorid) FROM borrowers p2 WHERE p2.guarantorid=p.borrowernumber) as guarantees
FROM borrowers p
WHERE p.borrowernumber = <<enter borrowernumber>>
ORDER BY branchcode, accountlines desc


