/*
R.002680

----------

Name: 	Circulation of your library's materials at your library in a month, by item type, collection code and location
Created by: Heather Braum

----------

Group: Daily, Monthly, Yearly Stats
     Monthly

Created on: 2016-04-01 15:53:04
Modified on: 2016-04-01 15:53:38
Date last run: 2018-12-10 23:18:21

----------

Public: 0
Expiry: 0

----------

Choose your branch three times. Gives the circulation of your materials at your library in a given month by item type, collection code and location

----------
*/

SELECT IF(items.itype IS NULL AND deleteditems.itype IS NULL, NULL, CONCAT(COALESCE(items.itype,''), COALESCE(deleteditems.itype,''))) AS itype, IF(items.ccode IS NULL AND deleteditems.ccode IS NULL, NULL, CONCAT(COALESCE(items.ccode,''), COALESCE(deleteditems.ccode,''))) AS ccode, IF(items.location IS NULL AND deleteditems.location IS NULL, NULL, CONCAT(COALESCE(items.location,''), COALESCE(deleteditems.location,''))) AS location, Count(*) AS count  FROM statistics LEFT JOIN items USING(itemnumber) LEFT JOIN deleteditems USING(itemnumber) WHERE statistics.branch=<<choose branch|branches>> AND statistics.type IN ('issue','renew','localuse') AND month(statistics.datetime) = <<Choose month|MONTH>> AND year(statistics.datetime) = <<Choose Year|YEAR>> AND (items.homebranch=<<choose branch|branches>> OR deleteditems.homebranch=<<choose branch|branches>>) GROUP BY itype, ccode, location 


