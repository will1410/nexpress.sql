/*
R.002865

----------

Name: GHW - Overdue Notice Template
Created by: George H Williams

----------

Group: Administrative Reports
     Testing

Created on: 2016-12-31 19:25:57
Modified on: 2018-04-16 11:05:00
Date last run: 2021-06-25 14:05:53

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>Shows overdue notice template automatically sent by Koha</p>
<ul><li>shows notices template for the library you specify</li>
<li>allows you to specify which template you want to look at</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>This report was created to work with the new notices NExpress will start using on January 1, 2016.</p>
<p>You should run the report and then download the results into Excel or another spreadsheet program.  The results will be very hard to read on the screen in Koha.</p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=2865&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  letter.branchcode,
  letter.code,
  letter.name,
  letter.title,
  letter.content
FROM
  letter
WHERE
  letter.branchcode LIKE <<Choose a branch|ZBRAN>> AND
  letter.code LIKE <<Choose an overdue notice|ZODUE>>
GROUP BY
  letter.branchcode, letter.code



