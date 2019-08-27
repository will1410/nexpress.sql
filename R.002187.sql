/*
R.002187

----------

Name: Collection Breakdown at Years End
Created by: Heather Braum

----------

Group: Administrative Reports
     Collection Stats-admin

Created on: 2014-02-07 00:45:54
Modified on: 2016-01-28 10:21:26
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT branches.branchcode, 
(SELECT count(*) FROM items WHERE branches.branchcode=items.homebranch AND items.dateaccessioned < <<enter current year>> AND items.ccode IN ('DVD')) as "DVD", 
(SELECT count(*) FROM items WHERE branches.branchcode=items.homebranch AND items.dateaccessioned < <<enter current year>> AND items.ccode IN ('AUDIOBOOK')) as "AUDIOBOOK", 
(SELECT count(*) FROM items WHERE branches.branchcode=items.homebranch AND items.dateaccessioned < <<enter current year>> AND items.ccode='VIDEOGAME') AS "Videogames Collection", 
(SELECT count(*) FROM items WHERE branches.branchcode=items.homebranch AND items.dateaccessioned < <<enter current year>> AND items.ccode NOT IN ('DVD','TVSERIES','VIDEOGAME')) AS "All Others Collection" 
FROM branches



