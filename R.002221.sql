/*
R.002221

----------

Name: Tracking Old Holds that are waiting/in transit/item level
Created by: Heather Braum

----------

Group: Administrative Reports
     Holds-admin

Created on: 2014-03-19 12:23:18
Modified on: 2014-03-21 17:52:22
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT branchcode, reservedate, timestamp, CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',biblionumber,'\" target="_blank">',biblionumber,'</a>') AS "Holds Table", biblionumber, found FROM reserves WHERE ((found IS NOT NULL and priority='0') OR (found IS NULL AND itemnumber IS NOT NULL)) AND reservedate < '2014-01-01' AND timestamp < '2014-03-12' ORDER BY branchcode, timestamp asc



