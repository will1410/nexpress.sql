/*
R.001580

----------

Name: Shelf List of Temporary Restricted Itypes
Created by: Heather Braum

----------

Group: -
     -

Created on: 2012-10-08 14:47:16
Modified on: 2018-04-16 10:47:37
Date last run: 2017-12-28 10:06:14

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>Shows items with restricted itemtypes that have passed their restriction limits</p>
<ul><li>Shows items with localhold1, localhold2, walkin1, walkin2 item types that have passed their 30 or 60 day restriction limits</li>
<li>at all NExpress libraries</li>
<li>grouped by item number</li>
<li>sorted by owning library, collection code, and accession date</li>
<li>contains links to the item record</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>Companion reports are:</p>
<p></p>
<p>For Book barcodes <a href="https://staff.nexpresslibrary.org/cgi-bin/koha/reports/guided_reports.pl?reports=2498&phase=Run%20this%20report" target="_blank">Run Report #2498</a></p>
<p>For Movie Barcodes <a href="https://staff.nexpresslibrary.org/cgi-bin/koha/reports/guided_reports.pl?reports=2497&phase=Run%20this%20report" target="_blank">Run Report #2497</a></p>
<p></p>
<p>Report created by Heather Braum.  Explanatory notes added and query updated by GHW on 2017.12.28.</p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=1580&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  Concat('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=', biblio.biblionumber, '\" target="_blank">LINK</a>') AS LINK,
  biblio.title,
  items.homebranch,
  items.itype,
  items.ccode,
  items.dateaccessioned,
  items.barcode
FROM
  items
  JOIN biblio ON items.biblionumber = biblio.biblionumber
WHERE
  (((items.itype = 'WALKIN1' OR items.itype = 'LOCALHOLD1') AND
      items.dateaccessioned < Curdate() - Interval 30 Day) OR
    ((items.itype = 'WALKIN2' OR items.itype = 'LOCALHOLD2') AND
      items.dateaccessioned < Curdate() - Interval 60 Day)) AND
  (items.ccode <> 'ILL' AND items.ccode <> 'GADGET' AND items.ccode <> 'MAGAZINE' AND items.ccode <> 'COMPUTER') AND
  biblio.title NOT LIKE 'BASEHOR ILL%'
GROUP BY
  items.itemnumber
ORDER BY
  items.homebranch,
  items.ccode,
  items.dateaccessioned DESC
LIMIT 1000


