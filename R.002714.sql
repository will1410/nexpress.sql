/*
R.002714

----------

Name: wellsville project
Created by: Heather Braum

----------

Group: -
     -

Created on: 2016-07-29 09:22:28
Modified on: 2016-07-29 09:25:18
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

select CONCAT('<a href=\"/cgi-bin/koha/cataloguing/additem.pl?op=edititem&biblionumber=',b.biblionumber,'&itemnumber=',i.itemnumber,'#edititem\" target="_blank">'"edit item"'</a>') as "edit barcode" from items i LEFT JOIN biblio b USING(biblionumber) where i.homebranch='wellsville' AND (i.barcode = <<enter barcode>> OR i.barcode = <<enter barcode>> OR i.barcode = <<enter barcode>> OR i.barcode = <<enter barcode>> OR  i.barcode = <<enter barcode>> OR  i.barcode = <<enter barcode>> OR  i.barcode = <<enter barcode>> OR  i.barcode = <<enter barcode>> OR  i.barcode = <<enter barcode>>)



