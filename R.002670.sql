/*
R.002670

----------

Name: fix these emails
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2016-02-25 11:56:53
Modified on: 2016-02-26 17:34:07
Date last run: 2019-04-21 18:16:06

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/members/memberentry.pl?op=modify&borrowernumber=',borrowers.borrowernumber,'\" target="_blank">'"edit patron"'</a>') as "edit patron" FROM borrowers WHERE email NOT LIKE '%_@__%.__%' and (email is not NULL and email!="")



