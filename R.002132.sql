/*
R.002132

----------

Name: All Patrons in a Category
Created by: Heather Braum

----------

Group: Administrative Reports
     Patrons-admin

Created on: 2013-12-19 17:14:18
Modified on: 2013-12-19 17:14:18
Date last run: -

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/members/memberentry.pl?op=modify&destination=circ&borrowernumber=',borrowers.borrowernumber,'\" target="_blank">'"edit patron"'</a>') as "edit patron", firstname, surname, city, zipcode FROM borrowers WHERE categorycode = <<patron category|categorycode>> ORDER BY surname



