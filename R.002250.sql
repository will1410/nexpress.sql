/*
R.002250

----------

Name: Circulation of your library's materials at your library in a year, by item type and location
Created by: Heather Braum

----------

Group: Daily, Monthly, Yearly Stats
     Yearly

Created on: 2014-04-24 11:08:31
Modified on: 2014-04-24 11:08:31
Date last run: 2018-01-17 13:53:53

----------

Public: 0
Expiry: 300

----------

Choose your branch three times. Gives the circulation of your materials at your library in a given year, by item type and location

----------
*/

SELECT IF(items.itype IS NULL AND deleteditems.itype IS NULL, NULL, CONCAT(COALESCE(items.itype,''), COALESCE(deleteditems.itype,''))) AS itype, IF(items.location IS NULL AND deleteditems.location IS NULL, NULL, CONCAT(COALESCE(items.location,''), COALESCE(deleteditems.location,''))) AS location, Count(*) AS count  FROM statistics LEFT JOIN items USING(itemnumber) LEFT JOIN deleteditems USING(itemnumber) WHERE statistics.branch=<<choose branch|branches>> AND statistics.type IN ('issue','renew','localuse') AND year(statistics.datetime) = <<enter four-digit year (ex, 2014)>> AND (items.homebranch=<<choose branch|branches>> OR deleteditems.homebranch=<<choose branch|branches>>) GROUP BY itype, location



