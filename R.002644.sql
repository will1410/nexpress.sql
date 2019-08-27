/*
R.002644

----------

Name: On Order - All
Created by: Robin Hastings

----------

Group: Administrative Reports
     Catalog-admin

Created on: 2015-12-28 09:18:47
Modified on: 2015-12-28 09:31:51
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT count(reserves.reserve_id) as count, biblionumber, biblio.title, biblio.author, CONCAT('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',biblionumber,'\" target="_blank">',biblio.title,'</a>') AS Title FROM items  join biblio USING(biblionumber) join reserves using(biblionumber) WHERE items.notforloan='-1'  AND items.homebranch='LEAVENWRTH' GROUP BY biblio.biblionumber ORDER BY count desc LIMIT 1000



