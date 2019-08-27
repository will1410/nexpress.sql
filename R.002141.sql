/*
R.002141

----------

Name: Yearly Circulation by CCode and Shelving Location for All Branches
Created by: Heather Braum

----------

Group: Administrative Reports
     Daily, Monthly, Yearly Stats-admin

Created on: 2014-01-06 13:35:04
Modified on: 2014-01-06 13:36:16
Date last run: -

----------

Public: 0
Expiry: 0

----------

All branches. Enter year. DO NOT RUN DURING NORMAL HOURS! (Running from command line/database client much better)

----------
*/

SELECT statistics.branch, IF(items.ccode IS NULL AND deleteditems.ccode IS NULL, NULL, CONCAT(COALESCE(items.ccode,''), COALESCE(deleteditems.ccode,''))) AS ccode, IF(items.location IS NULL AND deleteditems.location IS NULL, NULL, CONCAT(COALESCE(items.location,''), COALESCE(deleteditems.location,''))) AS location, Count(*) AS count  FROM statistics LEFT JOIN items USING(itemnumber) LEFT JOIN deleteditems USING(itemnumber) WHERE statistics.type IN ('issue','renew','localuse') AND year(statistics.datetime) = <<enter year>> 
GROUP BY statistics.branch, ccode, location 
ORDER BY statistics.branch, ccode, location



