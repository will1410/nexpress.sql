/*
R.002426

----------

Name: DVD labeling problems (not all)
Created by: BURLINGAME TECH

----------

Group: Library-Specific
     Burlingame

Created on: 2014-12-13 13:04:28
Modified on: 2014-12-13 15:03:40
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT  biblio.title,items.datelastborrowed,items.datelastseen,items.itemlost,items.withdrawn,items.permanent_location,items.itype,biblioitems.cn_class,items.ccode,items.itemcallnumber
FROM items
LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber)
LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)
WHERE items.homebranch='BURLINGAME' AND items.ccode='DVD' AND NOT (items.itemcallnumber LIKE 'J DVD %' OR items.itemcallnumber LIKE 'DVD %')
ORDER BY biblio.title asc


