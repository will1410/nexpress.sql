/*
R.003119

----------

Name: Test - GHW
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-09-11 15:24:01
Modified on: 2018-09-11 15:24:01
Date last run: 2019-07-14 22:54:32

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT items.location, count(items.itemnumber) as COUNT
FROM items
Group by items.location
with rollup


