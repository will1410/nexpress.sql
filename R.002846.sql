/*
R.002846

----------

Name: GHW - Report for LVPL - Items lost on RESET accounts
Created by: George H Williams

----------

Group: Library-Specific
     Leavenworth

Created on: 2016-12-05 14:06:50
Modified on: 2018-04-16 11:05:20
Date last run: 2019-08-08 14:14:28

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>What it does looks for items long overdue on Leavenworth's "RESET" accounts.</p>
<ul><li>Shows items currently checked out to these patrons</li>
<li>shows items from all NExpress libraries</li>
<li>grouped and sorted by borrower's cardnumber and item barcode</li>
<li>contains links to the item's bibliographic record</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=2846&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  borrowers.cardnumber,
  FORMAT(accountlines.amountoutstanding, 2) AS AMT_OUTSTANDING,
  Concat_Ws('<br />',
    CONCAT('Home: ', IF(items.homebranch='LEAVENWRTH', items.homebranch, CONCAT('<span style="background-color: yellow;">',items.homebranch,'</span>')) ),
    CONCAT('Current: ', items.holdingbranch),
    CONCAT('Location: ', items.location),
    CONCAT('Itype: ', items.itype),
    CONCAT('Ccode: ', items.ccode),
    CONCAT('Call #: ', items.itemcallnumber),
    CONCAT('Author: ', biblio.author),
    CONCAT('Title: ', biblio.title),
    CONCAT('BC: ',items.barcode)) AS ITEM_INFO,
  CONCAT( '<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=', biblio.biblionumber,'\" target="_blank"> Link to title</a>' ) AS LINK_TO_TITLE
FROM
  borrowers LEFT JOIN
  accountlines
    ON accountlines.borrowernumber = borrowers.borrowernumber LEFT JOIN
  items
    ON accountlines.itemnumber = items.itemnumber INNER JOIN
  biblio
    ON items.biblionumber = biblio.biblionumber
WHERE
  borrowers.branchcode LIKE 'LEAVENWRTH' AND
  items.itemlost = 1 AND
  accountlines.amountoutstanding > .01 AND
  borrowers.cardnumber LIKE '%RESET%' AND
  accountlines.accounttype = 'L'
GROUP BY
  borrowers.cardnumber, items.barcode



