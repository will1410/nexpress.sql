/*
R.002931

----------

Name: GHW - Card prefix report - NExpress-wide
Created by: George H Williams

----------

Group: Administrative Reports
     Testing

Created on: 2017-04-28 10:56:00
Modified on: 2017-04-28 10:56:56
Date last run: 2018-10-07 16:11:33

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT
  @var := <<Number of digits in card prefix|YNUMBER>> AS CARD_PREFIX_LENGTH,
  Left(borrowers.cardnumber, @var) AS LIBRAY_CARD_PREFIX,
  LENGTH(borrowers.cardnumber) AS CARD_NUMBER_LENGTH,
  Count(borrowers.borrowernumber) AS LIBRARY_CARD_COUNT,
  CONCAT( '<a href=\"/cgi-bin/koha/reports/guided_reports.pl?phase=Run+this+report&reports=2773&sql_params=', (Left(borrowers.cardnumber, @var)) ,'&limit=10000 \" target="_blank">Link to report 2773</a>' ) AS LINK_TO_PREFIX_REPORT_2
FROM
  borrowers
GROUP BY
  CARD_NUMBER_LENGTH, LIBRAY_CARD_PREFIX
HAVING
  LIBRARY_CARD_COUNT >= <<Minimum card number count|YNUMBER>>
ORDER BY
  LIBRAY_CARD_PREFIX



