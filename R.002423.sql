/*
R.002423

----------

Name: eudoracustom120914
Created by: -

----------

Group: Administrative Reports
     -

Created on: 2014-12-10 10:31:23
Modified on: 2014-12-10 10:35:57
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT  items.barcode,items.datelastborrowed,items.datelastseen,items.itype,items.ccode,items.itemcallnumber,biblio.title,biblio.author FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)   WHERE items.barcode LIKE '%T%' AND items.holdingbranch='EUDORA' AND items.homebranch='EUDORA' 



