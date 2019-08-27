/*
R.002149

----------

Name: Monthly Deleted Materials by Ccode (branch-specific)
Created by: Heather Braum

----------

Group: Daily, Monthly, Yearly Stats
     Monthly

Created on: 2014-01-08 16:29:52
Modified on: 2014-01-08 16:48:01
Date last run: 2018-07-26 17:38:44

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT count(itemnumber) as deleted, ccode, location from deleteditems WHERE homebranch=<<branch|branches>> AND month(timestamp) =<<enter two digit month, ex. 02>> AND year (timestamp) = <<enter four digit year>> GROUP BY ccode,location ORDER BY ccode,location asc



