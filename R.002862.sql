/*
R.002862

----------

Name: Overbrook JB
Created by: OVERBROOK TECH

----------

Group: -
     -

Created on: 2016-12-20 11:03:11
Modified on: 2016-12-20 11:03:11
Date last run: 2018-05-04 17:46:40

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT  items.barcode,items.itemcallnumber,items.location,items.permanent_location,items.homebranch,biblio.author,biblio.title FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)   WHERE items.homebranch='OVERBROOK' AND items.itemcallnumber >= 'JB' AND items.itemcallnumber <= 'JC' ORDER BY items.itemcallnumber asc



