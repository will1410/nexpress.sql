/*
R.002527

----------

Name: Full Circulation History for a patron
Created by: Heather Braum

----------

Group: Borrowers
     -

Created on: 2015-06-24 17:10:01
Modified on: 2015-06-24 17:52:48
Date last run: 2021-01-14 11:22:53

----------

Public: 0
Expiry: 0

----------

This report queries the statistics table -- which goes back 25 months; patron's account circulation history goes back 13 months (querying issues table). Enter patron's cardnumber; report returns type of action (issue, renewal, return), date of action, where item was checked out/return, and the title, item type, collection code, and shelving location of the item. 

----------
*/

SELECT statistics.type, date(statistics.datetime) date, statistics.branch as "checkout location", biblio.title AS title, items.itype as "item type", items.ccode as "collection code", items.location as "shelving location" FROM statistics JOIN borrowers USING(borrowernumber) JOIN items USING(itemnumber) JOIN biblio USING(biblionumber) WHERE cardnumber=<<enter cardnumber>> AND statistics.type IN ('renew','issue','return') ORDER BY date asc



