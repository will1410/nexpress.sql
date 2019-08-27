/*
R.002348

----------

Name: Fixing copyrightdate on records with holds
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Bib Records-admin

Created on: 2014-09-01 23:16:36
Modified on: 2015-08-16 20:37:44
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT DISTINCT CONCAT('<a href=\"/cgi-bin/koha/cataloguing/addbiblio.pl?biblionumber=',r.biblionumber,'#tab2XX\" target="_blank">'"edit record"'</a>') as "edit record", b.title FROM reserves r LEFT JOIN biblio b USING(biblionumber) LEFT JOIN items i USING(biblionumber)  LEFT JOIN biblioitems t USING(biblionumber) WHERE t.publicationyear IS NULL AND b.frameworkcode <> 'FA' AND i.ccode NOT IN ('ILL','MISC') AND i.itype <> 'ILL' AND i.notforloan <> '-1' AND biblionumber NOT IN ('70841','115261','121010','234927','638714','638713','637234','637361','637363','637497','637686','637689','637769','637771','638008','638025','638027','638028','638030','638131','638403','638414','638416','638417','638420','638476','638594','638599','638600','638603','638605','638711','635581','635852','632351','627100','624254','596614','593217','357614','517202','597660','636225','275045','260122','271026','597670') GROUP BY r.biblionumber



