/*
R.003106

----------

Name: GHW - Monthly B
Created by: George H Williams

----------

Group: Statistics
     Last calendar month

Created on: 2018-08-02 16:04:08
Modified on: 2018-09-25 10:54:02
Date last run: 2019-11-03 17:45:34

----------

Public: 0
Expiry: 300

----------

<div id="reportinfo">
<p>Generates monthly statistics for adult combined checkouts and renewals</p>
<ul><li>Shows adult checkout and renewal counts for the previous calendar month</li>
<li>At all Next Kansas libraries</li>
<li>grouped and sorted by branchcode</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>Corresponds with column K on the monthly circulation spreadsheet for 2018.</p>
<p>This report is designed to run on Koha 17.11 and greater.</p>
<p></p>
<p id="rquickopen"><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=3106&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
<p id="rquickdown"><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=1&phase=Export&format=csv&report_id=3106">Click here to download as a csv file</a></p>
</div>

----------
*/

SELECT
  Concat(Year(Now() - INTERVAL 1 MONTH), ".", LPad(Month(Now() - INTERVAL 1 MONTH), 2, 0)) AS YYYY_MM,
  branches.branchcode,
  Coalesce(ADULT.count, 0) AS CR_ADULT_LM
FROM
  branches
  LEFT JOIN (SELECT
        statistics.branch,
        Count(*) AS count
      FROM
        statistics
      WHERE
        (statistics.type = 'issue' OR
          statistics.type = 'renew') AND
        Month(statistics.datetime) = Month(Now() - INTERVAL 1 MONTH) AND
        Year(statistics.datetime) = Year(Now() - INTERVAL 1 MONTH) AND
        (statistics.location = 'ADULT' OR
          statistics.location = 'LVPLADULT' OR
          statistics.location IS NULL)
      GROUP BY
        statistics.branch) ADULT ON branches.branchcode = ADULT.branch
GROUP BY
  branches.branchcode
ORDER BY
  branches.branchcode



