/*
R.001379

----------

Name: All items in a specific ccode
Created by: Heather Braum

----------

Group: Administrative Reports
     Shelf Lists - admin

Created on: 2012-05-11 13:42:07
Modified on: 2013-11-17 14:16:01
Date last run: 2017-09-27 13:01:06

----------

Public: 0
Expiry: 0

----------

(Reports on Entire Collection)

----------
*/

SELECT  items.homebranch, items.itemcallnumber,biblio.title,items.itype,items.ccode,items.location,items.barcode, items.dateaccessioned, CONCAT('<a href=\"/cgi-bin/koha/cataloguing/additem.pl?op=edititem&biblionumber=',biblio.biblionumber,'&itemnumber=',items.itemnumber,'#edititem\" target="_blank">'"edit item"'</a>') as "edit item" FROM items JOIN biblio USING(biblionumber) WHERE items.ccode=<<Pick your ccode|CCODE>> ORDER BY items.homebranch, items.itemcallnumber



