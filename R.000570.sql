/*
R.000570

----------

Name: Monthly 005 New Materials Added by Item Type and Location
Created by:  Tongie Book Club

----------

Group: -
     -

Created on: 2009-06-01 16:56:47
Modified on: 2016-10-05 16:18:26
Date last run: 2019-12-26 14:16:50

----------

Public: 0
Expiry: 0

----------

Shows count of new items added to a collection in last month by item type and shelving location

----------
*/

SELECT i.homebranch as "Library", i.itype as "Item Type", i.location as "Location", count(i.biblionumber) as "Total Added" FROM items i WHERE month(i.dateaccessioned) = <<Choose month|MONTH>> AND year (i.dateaccessioned) = <<Choose year|YEAR>> GROUP BY i.homebranch,i.itype,i.location ORDER BY i.homebranch,i.itype,i.location ASC



