/*
R.002437

----------

Name: 9.3 Total Video, Physical Units
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-01-08 17:09:55
Modified on: 2017-02-06 10:07:33
Date last run: -

----------

Public: 0
Expiry: 0

----------

Ready for 2016

----------
*/

SELECT homebranch, count(*) FROM items WHERE year(dateaccessioned) < '2016' and (itype IN ('media','newmedia','mediacoll')) OR (itype IN ('kits','localhold','localhold1','reference','walkin','walkin1') and ccode IN ('dvd','blu-ray','vhs','tvseries')) GROUP BY homebranch LIMIT 100



