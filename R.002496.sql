/*
R.002496

----------

Name: author search
Created by: Heather Braum

----------

Group: -
     -

Created on: 2015-05-14 12:13:22
Modified on: 2015-08-16 19:59:15
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',b.biblionumber,'\" target="_blank">'"link to record"'</a>') as "link to record", b.title, GROUP_CONCAT(DISTINCT i.ccode SEPARATOR ', ') as ccodes, GROUP_CONCAT(DISTINCT i.itype SEPARATOR ', ') as itypes, t.pages, t.publicationyear, t.size from biblio b left join items i using(biblionumber) left join biblioitems t using(biblionumber) where b.author like <<enter author>> AND i.ccode NOT LIKE 'DL%' GROUP BY b.biblionumber ORDER BY b.title, ccodes LIMIT 700



