/*
R.001746

----------

Name: Shelf List from a Private List
Created by: Heather Braum

----------

Group: Lists Module
     -

Created on: 2013-02-07 16:18:10
Modified on: 2019-07-17 16:29:12
Date last run: 2019-07-17 16:25:24

----------

Public: 0
Expiry: 0

----------

This report displays your items from a created Koha list, and includes call number, title, author, collection code, location, and barcode. Find your list number by looking at the end of the list's URL (example https://staff.nexpresslibrary.org/cgi-bin/koha/virtualshelves/shelves.pl?viewshelf=2350, list number is 2350) and choose your branch and run the report. 


<p><span style="background-color: darkred; color: white">Scheduled for deletion on August 31, 2019</p>

<p><span style="background-color: black; color: white">Is being replaced by report 3226 and 3227</p>

----------
*/

SELECT
  items.itemcallnumber,
  biblio.title,
  biblio.author,
  items.ccode,
  items.location,
  items.barcode
FROM virtualshelfcontents
  LEFT JOIN biblio USING(biblionumber)
  LEFT JOIN items USING(biblionumber)
WHERE
  virtualshelfcontents.shelfnumber=<<enter list number>> AND
  items.homebranch=<<Choose branch|branches>>
ORDER BY
  items.itemcallnumber



