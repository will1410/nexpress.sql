/*
R.002147

----------

Name: Yearly Deleted Materials by Itype (branch-specific)
Created by: Heather Braum

----------

Group: Daily, Monthly, Yearly Stats
     Yearly

Created on: 2014-01-08 16:25:08
Modified on: 2014-01-08 16:25:08
Date last run: 2018-10-17 16:19:08

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT count(itemnumber) as deleted, itype, location from deleteditems WHERE homebranch=<<branch|branches>> AND year(timestamp) = <<enter four-digit year>> GROUP BY itype,location ORDER BY  itype,location 



