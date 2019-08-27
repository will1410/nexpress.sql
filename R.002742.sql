/*
R.002742

----------

Name: Overbrook LocalHold
Created by: OVERBROOK TECH

----------

Group: -
     -

Created on: 2016-08-25 15:17:06
Modified on: 2016-08-25 15:17:06
Date last run: -

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT  items.dateaccessioned,items.barcode,items.itype,biblio.author,biblio.title,items.itemcallnumber,items.homebranch FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)   WHERE items.homebranch='OVERBROOK' AND items.itype=<<itype|itemtypes>> ORDER BY items.itemcallnumber asc


