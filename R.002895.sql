/*
R.002895

----------

Name: GHW - Lost statuses by check-out branch with last patron data
Created by: George H Williams

----------

Group: Circulation
     Overdues

Created on: 2017-02-01 15:28:38
Modified on: 2018-09-11 12:07:27
Date last run: 2019-08-24 09:41:56

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>Lists items with any "Lost" status that were checked out at your library</p>
<ul><li>Shows items that currently have the "Lost" status you specify</li>
<li>shows items that were checked out at your library - regardless of which library owns the item</li>
<li>grouped by item barcode</li>
<li>sorted by check-out branch, normal item classification, last patron's borrower id</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>Monthly cleanup</p>
<p></p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=2895&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  items.holdingbranch AS CKO_BRANCH,
  items.barcode AS ITEM_BARCODE,
  items.homebranch AS ITEM_HOME,
  items.location AS LOCATION,
  items.itype AS ITYPE,
  ccodes.lib AS CCODE,
  items.itemcallnumber AS CALL_NUMBER,
  biblio.author,
  Concat_Ws(' ', biblio.title,
    ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="b"]'),
    ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="p"]'),
    ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="n"]')) AS FULL_TITLE,
  losts.lib AS LOST_STATUS,
  Date_Format(old_issues.returndate, '%m/%d/%Y') AS LOST_ON,
  borrowers.cardnumber AS LAST_PATRON_CARD,
  borrowers.surname AS LAST_PATRON_NAME,
  items.replacementprice
FROM
  items
  JOIN biblio ON items.biblionumber = biblio.biblionumber
  LEFT JOIN (SELECT
        authorised_values.authorised_value,
        authorised_values.lib
      FROM
        authorised_values
      WHERE
        authorised_values.category = "CCODE") ccodes ON items.ccode = ccodes.authorised_value
  LEFT JOIN (SELECT
        authorised_values.authorised_value,
        authorised_values.lib
      FROM
        authorised_values
      WHERE
        authorised_values.category = 'LOST') losts ON items.itemlost = losts.authorised_value
  JOIN old_issues ON old_issues.itemnumber = items.itemnumber
  JOIN borrowers ON old_issues.borrowernumber = borrowers.borrowernumber
  JOIN biblio_metadata ON biblio.biblionumber = biblio_metadata.biblionumber
WHERE
  Date_Format(old_issues.returndate, '%m/%d/%Y') = Date_Format(items.itemlost_on, '%m/%d/%Y') AND
  items.holdingbranch LIKE <<Check-out branch|ZBRAN>>
GROUP BY
  items.barcode,
  Date_Format(old_issues.returndate, '%m/%d/%Y'),
  borrowers.cardnumber,
  borrowers.surname
HAVING
  LOST_STATUS LIKE <<Choose check-out library|ZLOST_ONLY>>
ORDER BY
  CKO_BRANCH,
  LOCATION,
  ITYPE,
  CCODE,
  CALL_NUMBER,
  FULL_TITLE,
  biblio.author,
  old_issues.borrowernumber,
  LAST_PATRON_CARD,
  LAST_PATRON_NAME



