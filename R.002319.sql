/*
R.002319

----------

Name: Making sure no items are In transit or on Hold in a Search
Created by: Heather Braum

----------

Group: Administrative Reports
     Items-admin

Created on: 2014-08-11 12:42:44
Modified on: 2014-08-11 12:42:44
Date last run: -

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT i.barcode, i.datelastseen FROM items i LEFT JOIN branchtransfers b USING(itemnumber) LEFT JOIN reserves r USING(itemnumber) WHERE i.homebranch=<choose branch|branches>> AND i.datelastseen < <<enter date last seen to search before>> AND b.datearrived IS NULL AND r.found IN ('W','T')



