/*
R.002427

----------

Name: Incorrectly Labeled Adult Fiction Books
Created by: BURLINGAME TECH

----------

Group: Library-Specific
     Burlingame

Created on: 2014-12-13 13:39:31
Modified on: 2014-12-13 14:54:54
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT
b.title,
i.itemnumber,
i.biblionumber,
i.biblioitemnumber,
i.barcode,
i.dateaccessioned,
i.datelastborrowed,
i.datelastseen,
i.itemcallnumber,
i.location,
i.ccode,
i.itype,
i.holdingbranch AS 'Current Location',
b.author,
CONCAT('<a href=\"/cgi-bin/koha/cataloguing/additem.pl?op=edititem&biblionumber=',b.biblionumber,'&itemnumber=',i.itemnumber,'#edititem\" target="_blank">'"edit item"'</a>') as "edit item"
FROM items i
LEFT JOIN biblioitems bi on (i.biblioitemnumber=bi.biblioitemnumber)
LEFT JOIN biblio b on (bi.biblionumber=b.biblionumber)
WHERE i.homebranch='BURLINGAME'
AND i.itype='BOOK'
AND i.location='ADULT'
AND i.ccode='FICTION'
AND NOT (i.itemcallnumber REGEXP '^F ' OR i.itemcallnumber REGEXP '^PB ')
ORDER BY b.author


