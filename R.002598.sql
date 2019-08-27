/*
R.002598

----------

Name: Direct Link to edit specific barcode
Created by: Heather Braum

----------

Group: Catalog Records and Items
     Fix Items

Created on: 2015-09-08 12:57:19
Modified on: 2015-09-08 12:59:35
Date last run: -

----------

Public: 0
Expiry: 0

----------

Gives box to scan a single barcode and then returns a direct link to edit that specific item. Saves time searching! 

----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/cataloguing/additem.pl?op=edititem&biblionumber=',b.biblionumber,'&itemnumber=',i.itemnumber,'#edititem\" target="_blank">'"edit item"'</a>') as "edit item",b.title, b.author,i.ccode,i.location,i.itemcallnumber FROM items i LEFT JOIN biblio b USING (biblionumber) LEFT JOIN biblioitems t USING(biblionumber) WHERE i.barcode=<<click in box and item barcode>>


