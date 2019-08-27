/*
R.002969

----------

Name: GHW - Monthly 104
Created by: George H Williams

----------

Group: Statistics
     Monthly Statistics

Created on: 2017-07-01 13:22:33
Modified on: 2019-07-01 16:06:39
Date last run: 2019-07-05 16:28:36

----------

Public: 0
Expiry: 300

----------

<p style="display: none;">MNTHLY</p>
<p id="rquickdown"><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=1&phase=Export&format=csv&report_id=2969">Click here to download as a csv file</a></p>

----------
*/

SELECT
  'Total biblios on last day of last month' AS DESCRIPTION,
  count(*) AS COUNT
FROM
  biblio
WHERE
  biblio.datecreated < AddDate(Last_Day(SubDate(Now(), INTERVAL 1 MONTH)), 1)
UNION
SELECT
  'Biblios added last month' AS DESCRIPTION,
  Count(*)
FROM
  biblio
WHERE
  Month(biblio.datecreated) = Month(Now() - INTERVAL 1 MONTH) AND
  Year(biblio.datecreated) = Year(Now() - INTERVAL 1 MONTH)
UNION
SELECT
  'Biblios deleted last month' AS DESCRIPTION,
  Count(*)
FROM
  deletedbiblio
WHERE
  Month(deletedbiblio.timestamp) = Month(Now() - INTERVAL 1 MONTH) AND
  Year(deletedbiblio.timestamp) = Year(Now() - INTERVAL 1 MONTH)



