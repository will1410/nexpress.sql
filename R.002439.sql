/*
R.002439

----------

Name: 11.1 Circulation of Adult Materials
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-01-08 21:15:13
Modified on: 2017-02-06 10:05:26
Date last run: -

----------

Public: 0
Expiry: 0

----------

Ready for 2016

----------
*/

SELECT statistics.branch, IF(items.location IS NULL AND deleteditems.location IS NULL, NULL, CONCAT(COALESCE(items.location,''), COALESCE(deleteditems.location,''))) AS location, Count(*) AS count FROM borrowers LEFT JOIN deletedborrowers USING(borrowernumber) LEFT JOIN statistics USING(borrowernumber) LEFT JOIN items USING(itemnumber) LEFT JOIN deleteditems USING(itemnumber) WHERE statistics.type IN ('issue','renew') AND year(statistics.datetime) = '2015' AND (deleteditems.location = 'ADULT' OR items.location ='ADULT')
GROUP BY statistics.branch, location 



