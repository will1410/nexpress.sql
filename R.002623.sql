/*
R.002623

----------

Name: Item Type List
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-10-18 16:29:51
Modified on: 2015-10-18 16:32:14
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT it.description, it.notforloan, count(itemnumber) FROM itemtypes it LEFT JOIN items ON it.itemtype = items.itype GROUP BY it.description



