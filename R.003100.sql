/*
R.003100

----------

Name: GHW - Last borrower informatin to be deleted
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-07-02 17:18:28
Modified on: 2018-07-20 11:28:44
Date last run: 2018-10-02 15:28:32

----------

Public: 0
Expiry: 300

----------

<div id=reportinfo>
<p>Shows id numbers from rows in items_last_borrower table that should be deleted.</p>
<ul><li>Shows items_last_borrowed id numbers where the item is not lost/damaged/withdrawn and the item was returned more than 13 months ago.</li>
<li>on items at all libraries</li>
<li>grouped by id number</li>
<li>sorted by id number</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=3100&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  items_last_borrower.id AS ITEMS_LAST_BORROWER_ID
FROM
  items_last_borrower
  JOIN items ON items_last_borrower.itemnumber = items.itemnumber
WHERE
  items_last_borrower.created_on < (Date_Sub(Date(Now()), INTERVAL DayOfWeek(Now()) + 7 DAY) + INTERVAL 1 WEEK) - INTERVAL 13 MONTH AND
  Coalesce(items.damaged, "0") = 0 AND
  Coalesce(items.itemlost, "0") = 0 AND
  Coalesce(items.withdrawn, "0") = 0
GROUP BY
  items_last_borrower.id
ORDER BY
  items_last_borrower.created_on



