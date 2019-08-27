/*
R.002228

----------

Name: Wellsville Holds to Clear
Created by: Heather Braum

----------

Group: Library-Specific
     Wellsville

Created on: 2014-03-24 13:45:38
Modified on: 2014-03-24 14:04:31
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/reserve/request.pl?biblionumber=',r.biblionumber,'\" target="_blank">',r.biblionumber,'</a>') AS "Holds Link", CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',r.biblionumber,'\" target="_blank">',b.title,'</a>') AS "Title Link", r.reservedate FROM reserves r LEFT JOIN biblio b USING(biblionumber)
WHERE biblionumber IN ('244789','31091','505410','553697','588316') GROUP BY biblionumber



