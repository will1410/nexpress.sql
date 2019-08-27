/*
R.002627

----------

Name: Shelf list for All Playaways in NEKLS
Created by: Robin Hastings

----------

Group: Catalog Records and Items
     Shelf Lists

Created on: 2015-11-04 13:24:54
Modified on: 2015-11-04 13:31:32
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT items.dateaccessioned,items.itype,items.ccode,items.location,items.itemcallnumber,items.barcode,biblio.title,biblio.author,t.publicationyear, items.homebranch
  FROM items LEFT JOIN biblio USING(biblionumber)  LEFT JOIN biblioitems t USING(biblionumber) WHERE items.ccode = 'BOOKONMP' ORDER BY  items.homebranch ASC 



