/*
R.002474

----------

Name: unknown
Created by: Heather Braum

----------

Group: -
     -

Created on: 2015-03-24 09:39:40
Modified on: 2015-12-09 15:25:48
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT cardnumber, firstname, surname, userid, COUNT(1) AS Count, GROUP_CONCAT('<a target="_blank" href=\"/cgi-bin/koha/members/memberentry.pl?op=modify&destination=circ&borrowernumber=',borrowernumber,'\">',borrowernumber,'</a>') AS Links, GROUP_CONCAT(branchcode SEPARATOR ', ') as libraries
FROM borrowers
WHERE userid IS NOT NULL
GROUP BY userid
HAVING COUNT(1) > 1


