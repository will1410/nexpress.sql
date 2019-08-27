/*
R.002843

----------

Name: GHW - Deleted borrowers count - previous month
Created by: George H Williams

----------

Group: Patrons
     Patron Statistics

Created on: 2016-12-02 14:43:54
Modified on: 2018-04-16 11:05:24
Date last run: 2018-09-27 16:44:48

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>Count of patrons deleted in the previous calendar month</p>
<ul><li>Looks at patrons who were manually deleted - does not include patrons that were deleted in batch processes</li>
<li>Allows you to specify a patron home branch and patron category if you wish</li>
<li>grouped by patron home branch and patron category - includes total count by home branch and a total for the entire table</li>
<li>sorted by patron home branch and patron category</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>Report created at the request of Paola Free Library.</p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=2843&phase=Run this report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  deletedborrowers.branchcode AS PATRON_HOME_LIBRARY,
  deletedborrowers.categorycode AS PATRON_CATEGORY,
  Count(deletedborrowers.borrowernumber) AS COUNT_OF_PATRONS_DELETED
FROM
  action_logs JOIN
  deletedborrowers
    ON deletedborrowers.borrowernumber = action_logs.object
WHERE
  action_logs.module = 'MEMBERS' AND
  deletedborrowers.branchcode LIKE <<Choose patron home library|LBRANCH>> AND
  deletedborrowers.categorycode LIKE <<Choose patron category|LBORROWERCAT>> AND
  Month(action_logs.timestamp) = Month(Now() - INTERVAL 1 MONTH) AND
  Year(action_logs.timestamp) = Year(Now() - INTERVAL 1 MONTH) AND
  action_logs.action LIKE 'DELET%'
GROUP BY
  PATRON_HOME_LIBRARY, PATRON_CATEGORY
  WITH ROLLUP



