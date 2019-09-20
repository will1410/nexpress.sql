/*
R.000808

----------

Name: Collection size by Collection Code & Location (per branch)
Created by: NEKLS Administrator

----------

Group: Catalog Records and Items
     Collection Statistics

Created on: 2010-02-08 16:12:48
Modified on: 2016-04-11 15:24:14
Date last run: 2019-09-18 10:22:34

----------

Public: 0
Expiry: 0

----------

Enhanced - Pick Branch. (On Reports Webpages, 5/14/12)

----------
*/

SELECT ccode, location, count(itemnumber) as items FROM items WHERE homebranch = <<Pick your branch|branches>> GROUP BY ccode, location ORDER BY ccode,location asc 



