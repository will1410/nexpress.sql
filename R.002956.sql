/*
R.002956

----------

Name: GHW - Monthly statistics 005
Created by: George H Williams

----------

Group: Statistics
     Last calendar month

Created on: 2017-06-05 14:27:07
Modified on: 2017-06-05 14:48:30
Date last run: 2020-08-03 12:36:14

----------

Public: 0
Expiry: 300

----------

NExpress ILL Borrows

----------
*/

SELECT
  branches.branchcode,
  Coalesce(ILL_BORROWED.count, 0) AS NX_ILL_BORROWED_LM
FROM
  branches
  LEFT JOIN (SELECT
      branchtransfers.tobranch,
      COUNT(*) AS count
    FROM
      branchtransfers
      LEFT JOIN items ON branchtransfers.itemnumber = items.itemnumber
    WHERE
      branchtransfers.tobranch <> items.homebranch AND
      Month(branchtransfers.datesent) = Month(Now() - INTERVAL 1 MONTH) AND
      Year(branchtransfers.datesent) = Year(Now() - INTERVAL 1 MONTH) AND
      branchtransfers.frombranch <> branchtransfers.tobranch AND
      branchtransfers.comments IS NULL
    GROUP BY
      branchtransfers.tobranch) ILL_BORROWED ON branches.branchcode = ILL_BORROWED.tobranch
WHERE
  branches.branchcode LIKE "%"
GROUP BY
  branches.branchcode
ORDER BY
  branches.branchcode



