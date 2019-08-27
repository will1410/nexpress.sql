/*
R.003185

----------

Name: GHW - Yeah, I wouldn't run this if I were you
Created by: George H Williams

----------

Group: -
     -

Created on: 2019-03-13 15:53:01
Modified on: 2019-03-15 17:24:20
Date last run: 2019-04-05 08:48:02

----------

Public: 0
Expiry: 300

----------

For LEAVENWRTH fines project

----------
*/

SELECT
  Concat('<a href=\"/cgi-bin/koha/members/boraccount.pl?borrowernumber=', borrowers.borrowernumber, '\" target="_blank">Link to fees</a>') AS 'LINK',
  Upper(borrowers.cardnumber) AS CARDNUMBER,
  borrowers.firstname,
  borrowers.surname,
  borrowers.address,
  borrowers.city,
  borrowers.state,
  borrowers.zipcode,
  borrowers.email,
  borrowers.phone,
  borrowers.branchcode,
  If(Count(DISTINCT issues.issue_id) > 0, "Yes", "No") AS HAS_ITEMS_OUT,
  Count(DISTINCT issues.issue_id) AS CURRENT_CKO_COUNT,
  outstanding.date AS FEE_DATE,
  If(
    outstanding.accounttype = "L", "Lost Item",
    If(
      outstanding.accounttype LIKE "F%", "Fine",
      If(
        outstanding.accounttype = "A", "Account management fee",
        If(
          outstanding.accounttype = "N", "New card",
          If(
            outstanding.accounttype = "M", "Sundry",
            If(
              outstanding.accounttype LIKE "C%", "Copier fees",
              If(
                outstanding.accounttype LIKE "D%", "Damaged item",
                "-"
              )
            )
          )
        )
      )
    )
  ) AS TYPE_OF_FEE,
  Format(outstanding.amount, 2) AS FULL_FEE_AMOUNT,
  outstanding.accountlines_id,
  outstanding.description AS FEE_DESCRIPTION,
  outstanding.note AS FEE_NOTE,
  Format(Sum(outstanding.amount - outstanding.amountoutstanding), 2) AS PAID_SO_FAR,
  If(Sum(outstanding.amount > outstanding.amountoutstanding), CAST(outstanding.timestamp AS DATE), "-") AS MOST_RECENT_PAYMENT,
  Format(outstanding.amountoutstanding, 2) AS AMOUNT_OUTSTANDING,
  outstanding.branchcode AS branchcode1
FROM
  (
    SELECT
      accountlines.accountlines_id,
      accountlines.borrowernumber,
      accountlines.accountno,
      accountlines.itemnumber,
      accountlines.date,
      accountlines.amount,
      accountlines.description,
      accountlines.accounttype,
      accountlines.amountoutstanding,
      accountlines.timestamp,
      accountlines.lastincrement,
      accountlines.note,
      accountlines.manager_id,
      borrowers.branchcode
    FROM
      accountlines
      JOIN borrowers
        ON borrowers.borrowernumber = accountlines.manager_id
    WHERE
      accountlines.amountoutstanding > 0 AND
      borrowers.branchcode NOT LIKE @brn := "LEAVENWRTH" COLLATE utf8mb4_unicode_ci
    UNION
    SELECT
      accountlines.accountlines_id,
      accountlines.borrowernumber,
      accountlines.accountno,
      accountlines.itemnumber,
      accountlines.date,
      accountlines.amount,
      accountlines.description,
      accountlines.accounttype,
      accountlines.amountoutstanding,
      accountlines.timestamp,
      accountlines.lastincrement,
      accountlines.note,
      accountlines.manager_id,
      old_issues.branchcode
    FROM
      accountlines
      JOIN old_issues
        ON old_issues.borrowernumber = accountlines.borrowernumber AND
        old_issues.itemnumber = accountlines.itemnumber
    WHERE
      accountlines.amountoutstanding > 0 AND
      old_issues.branchcode NOT LIKE @brn AND
      accountlines.manager_id IS NULL
    UNION
    SELECT
      accountlines.accountlines_id,
      accountlines.borrowernumber,
      accountlines.accountno,
      accountlines.itemnumber,
      accountlines.date,
      accountlines.amount,
      accountlines.description,
      accountlines.accounttype,
      accountlines.amountoutstanding,
      accountlines.timestamp,
      accountlines.lastincrement,
      accountlines.note,
      accountlines.manager_id,
      borrowers.branchcode
    FROM
      accountlines
      INNER JOIN borrowers
        ON borrowers.borrowernumber = accountlines.borrowernumber
    WHERE
      accountlines.accountlines_id NOT IN (
          SELECT
            accountlines.accountlines_id
          FROM
            accountlines
            JOIN old_issues
              ON old_issues.borrowernumber = accountlines.borrowernumber AND
              old_issues.itemnumber = accountlines.itemnumber
          WHERE
            accountlines.amountoutstanding > 0 AND
            old_issues.branchcode NOT LIKE @brn AND
            accountlines.manager_id IS NULL
          UNION
          SELECT
            accountlines.accountlines_id
          FROM
            accountlines
            JOIN issues
              ON issues.borrowernumber = accountlines.borrowernumber AND
              issues.itemnumber = accountlines.itemnumber
          WHERE
            accountlines.amountoutstanding > 0 AND
            issues.branchcode NOT LIKE @brn AND
            accountlines.manager_id IS NULL
        ) AND
      accountlines.amountoutstanding > 0 AND
      borrowers.branchcode NOT LIKE @brn AND
      accountlines.manager_id IS NULL
    UNION
    SELECT
      accountlines.accountlines_id,
      accountlines.borrowernumber,
      accountlines.accountno,
      accountlines.itemnumber,
      accountlines.date,
      accountlines.amount,
      accountlines.description,
      accountlines.accounttype,
      accountlines.amountoutstanding,
      accountlines.timestamp,
      accountlines.lastincrement,
      accountlines.note,
      accountlines.manager_id,
      issues.branchcode
    FROM
      accountlines
      JOIN issues
        ON issues.borrowernumber = accountlines.borrowernumber AND
        issues.itemnumber = accountlines.itemnumber
    WHERE
      accountlines.amountoutstanding > 0 AND
      issues.branchcode NOT LIKE @brn AND
      accountlines.manager_id IS NULL
  ) outstanding
  JOIN borrowers
    ON borrowers.borrowernumber = outstanding.borrowernumber
  LEFT JOIN issues
    ON issues.borrowernumber = borrowers.borrowernumber
WHERE
  If(
    outstanding.accounttype = "L", "Lost Item",
    If(
      outstanding.accounttype LIKE "F%", "Fine",
      If(
        outstanding.accounttype = "A", "Account management fee",
        If(
          outstanding.accounttype = "N", "New card",
          If(
            outstanding.accounttype = "M", "Sundry",
            If(
              outstanding.accounttype LIKE "C%", "Copier fees",
              If(
                outstanding.accounttype LIKE "D%", "Damaged item",
                "-"
              )
            )
          )
        )
      )
    )
  ) LIKE 'FINE' AND
  borrowers.branchcode = "LEAVENWRTH"
GROUP BY
  Upper(borrowers.cardnumber),
  outstanding.accountlines_id
HAVING
  HAS_ITEMS_OUT LIKE '%'
ORDER BY
  borrowers.surname,
  borrowers.firstname,
  borrowers.cardnumber


