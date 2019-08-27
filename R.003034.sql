/*
R.003034

----------

Name: OverbrookAdultMusicCD
Created by: OVERBROOK TECH

----------

Group: -
     -

Created on: 2018-01-09 11:22:29
Modified on: 2018-01-09 11:22:29
Date last run: 2018-05-04 17:41:13

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT  items.barcode,items.itemcallnumber,items.holdingbranch,items.permanent_location,biblio.title,items.homebranch FROM items LEFT JOIN biblioitems on (items.biblioitemnumber=biblioitems.biblioitemnumber) LEFT JOIN biblio on (biblioitems.biblionumber=biblio.biblionumber)   WHERE items.itype='MUSIC' AND items.holdingbranch='OVERBROOK' AND items.homebranch='OVERBROOK' AND items.location='ADULT' ORDER BY biblio.title asc



