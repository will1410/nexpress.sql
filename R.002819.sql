/*
R.002819

----------

Name: Overbrook ILL
Created by: OVERBROOK TECH

----------

Group: -
     -

Created on: 2016-11-08 14:18:25
Modified on: 2016-11-08 14:18:25
Date last run: -

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT  items.barcode,biblio.title,items.onloan,items.homebranch FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)   WHERE items.homebranch='OVERBROOK' AND items.ccode='ILL' ORDER BY biblio.title asc



