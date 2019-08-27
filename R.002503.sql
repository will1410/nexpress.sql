/*
R.002503

----------

Name: Holds missing record level ccode -- cn_class (942$h)
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-05-21 18:46:19
Modified on: 2015-05-21 20:47:48
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/cataloguing/addbiblio.pl?biblionumber=',t.biblionumber,'#tab9XX\" target="_blank">',t.biblionumber,'</a>') as "edit bibnumber", CONCAT('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',t.biblionumber,'\" target="_blank">'"access bib"'</a>') as "access bib", GROUP_CONCAT(DISTINCT ccode SEPARATOR ', ') as ccodes, GROUP_CONCAT(DISTINCT itype SEPARATOR ', ') as itypes, GROUP_CONCAT(DISTINCT location SEPARATOR ', ') as locations, t.pages, t.agerestriction, t.cn_class, t.itemtype FROM biblioitems t LEFT JOIN items i USING(biblionumber) WHERE (t.biblionumber IN (SELECT biblionumber FROM reserves) OR t.biblionumber IN (SELECT biblionumber FROM old_reserves WHERE reservedate > '2015-03-01'))  AND t.cn_class IS NULL GROUP BY t.biblionumber ORDER BY locations, itypes, ccodes



