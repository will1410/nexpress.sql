/*
R.000954

----------

Name: Bsehor - DLA item search list
Created by: BASEHOR TECH

----------

Group: Library-Specific
     -

Created on: 2010-10-06 16:46:51
Modified on: 2013-06-17 01:09:03
Date last run: 2017-06-28 16:55:55

----------

Public: 0
Expiry: 0

----------

Produces a list of items that are claimed lost.

----------
*/

SELECT  items.barcode,items.homebranch,items.itemcallnumber,biblio.title,biblio.author FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)   WHERE items.homebranch='BASEHOR' AND items.itemlost>0 ORDER BY items.itemcallnumber asc


