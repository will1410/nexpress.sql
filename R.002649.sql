/*
R.002649

----------

Name: LP list
Created by: VALLEYFALL TECH

----------

Group: -
     -

Created on: 2015-12-31 12:20:44
Modified on: 2019-07-17 09:43:10
Date last run: -

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT  items.barcode,items.itemcallnumber FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber) 



