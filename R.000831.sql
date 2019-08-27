/*
R.000831

----------

Name: GHW - Patrons with outstanding credits
Created by: NEKLS Administrator

----------

Group: Circulation
     Charges

Created on: 2010-03-23 11:57:07
Modified on: 2019-01-28 21:43:21
Date last run: 2019-08-21 14:01:54

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT
  Concat(
    '<a href=\"/cgi-bin/koha/members/pay.pl?borrowernumber=',
    accountlines.borrowernumber,
    '\" target="_blank">patron fine records</a>'
  ) AS LINK_TO_PATRON,
  borrowers.branchcode,
  borrowers.cardnumber,
  accountlines.amountoutstanding
FROM
  accountlines
  JOIN borrowers ON accountlines.borrowernumber = borrowers.borrowernumber
WHERE
  borrowers.branchcode LIKE <<Choose patron home branch|LBRANCH>> AND
  accountlines.amountoutstanding < 0
GROUP BY
  accountlines.borrowernumber,
  borrowers.branchcode,
  borrowers.cardnumber,
  accountlines.amountoutstanding
ORDER BY
  borrowers.branchcode,
  borrowers.cardnumber



