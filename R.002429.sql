/*
R.002429

----------

Name: 2.2a number of registered users
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-01-08 10:20:53
Modified on: 2017-02-06 10:05:48
Date last run: -

----------

Public: 0
Expiry: 0

----------

Counts total borrowers enrolled at a library before a set date (for yearly statistics); updated for 2016. 

----------
*/

SELECT branchcode, count(*) FROM borrowers WHERE dateenrolled < '2016-01-01' GROUP BY branchcode LIMIT 100



