/*
R.001930

----------

Name: Monthly Circ by Itype, Location, Limited by Library
Created by: Heather Braum

----------

Group: Daily, Monthly, Yearly Stats
     Monthly

Created on: 2013-07-07 19:52:11
Modified on: 2016-12-30 10:36:36
Date last run: 2021-07-01 17:50:48

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT IF(items.itype IS NULL AND deleteditems.itype IS NULL, NULL, CONCAT(COALESCE(items.itype,''), COALESCE(deleteditems.itype,''))) AS itype, IF(items.location IS NULL AND deleteditems.location IS NULL, NULL, CONCAT(COALESCE(items.location,''), COALESCE(deleteditems.location,''))) AS location, Count(*) AS count  FROM statistics LEFT JOIN items USING(itemnumber) LEFT JOIN deleteditems USING(itemnumber) WHERE statistics.branch=<<branch|branches>> AND statistics.type IN ('issue','renew','localuse') AND month(statistics.datetime) = <<Choose month|Month>> AND year(statistics.datetime) = <<Choose year|Year>> GROUP BY itype, location ORDER BY itype, location



