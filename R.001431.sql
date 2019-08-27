/*
R.001431

----------

Name: Collection size by Item type and CCode
Created by: -

----------

Group: Catalog Records and Items
     Collection Statistics

Created on: 2012-05-24 10:59:51
Modified on: 2013-09-21 16:19:25
Date last run: 2018-03-23 15:26:53

----------

Public: 0
Expiry: 0

----------

Enhanced - pick branch #count

----------
*/

SELECT itype, ccode, count(itemnumber) as items FROM items WHERE homebranch = <<Pick your branch|branches>> GROUP BY itype, ccode ORDER BY itype asc 


