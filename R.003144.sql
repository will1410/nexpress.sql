/*
R.003144

----------

Name: GHW -2774 rewrite for testing - DOES NOT WORK
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-12-15 20:47:26
Modified on: 2018-12-15 20:47:26
Date last run: 2019-02-06 05:50:23

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT
  Concat('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=', biblio.biblionumber, '\" target="_blank">', items.barcode, '</a>') AS 'CLICKABLEBC',
  items.location,
  items.itype,
  authorised_values.lib AS COLLECTION_CODE,
  items.itemcallnumber,
  biblio.author,
  biblio.title,
  Concat("-",items.barcode,"-") AS BC,
  items.homebranch AS OWNED_BY,
  branchtransfers.frombranch AS SENT_FROM,
  branchtransfers.datesent AS SHIPPED_DATE,
  branchtransfers.tobranch AS SENT_TO,
  items.datelastseen
FROM
  (items
  JOIN branchtransfers ON items.itemnumber = branchtransfers.itemnumber)
  JOIN biblio ON items.biblionumber = biblio.biblionumber
  LEFT JOIN authorised_values ON items.ccode = authorised_values.authorised_value
WHERE
  (items.datelastseen BETWEEN NOW() - INTERVAL 180 DAY AND Now() - INTERVAL 7 DAY) AND
  authorised_values.category = "ccode" AND
  branchtransfers.datearrived IS NULL AND
((items.homebranch = <<Choose your library|branches>>) OR
(branchtransfers.frombranch = <<Choose your library|branches>>) OR
(branchtransfers.tobranch = <<Choose your library|branches>>))
GROUP BY
  items.barcode
ORDER BY
  items.homebranch,
  items.location,
  items.itype,
  authorised_values.lib,
  items.itemcallnumber,
  biblio.author,
  biblio.title,
  items.barcode



