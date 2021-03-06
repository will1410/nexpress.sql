/*
R.003128

----------

Name: GHW - Checkout and renewal count by item type and shelving location - previous calendar month
Created by: George H Williams

----------

Group: Statistics
     Monthly Statistics

Created on: 2018-10-09 17:27:16
Modified on: 2021-04-02 14:21:30
Date last run: 2021-07-02 16:23:45

----------

Public: 0
Expiry: 300

----------

<div id=reportinfo>
<p>Last month's checkouts by library, item type, and location</p>
<ul><li>Shows check-outs and renewals in the previous month by item type and shelving location</li>
<li>at the library you specify</li>
<li>grouped and sorted by checkout branch and shelving location</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>Checkouts without a checkout branch location will show as being checked out at NEKLS</p>
<p>Checkouts without an item type will be counted as BOOK</p>
<p></p>
<p>Partially replaces report 1930</p>
<p></p>
<p id="rquickdown"><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=1&phase=Export&format=csv&report_id=3128&reportname=GHW%20-%20Checkout%20and%20renewal%20count%20by%20item%20type%20and%20shelving%20location%20-%20previous%20calendar%20month&sql_params=%25&param_name=Choose%20check-out%20library%7CLBRANCH">Click here to download for all libraries as a csv file</a></p>
<p id="rquickopen"><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=3128&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  branch_itype.branchname,
  branch_itype.description,
  Coalesce(statisticsall.CKO_REN, 0) AS CKO_REN_ALL,
  Coalesce(statisticsadult.CKO_REN, 0) AS CKO_REN_ADULT,
  Coalesce(statisticsya.CKO_REN, 0) AS CKO_REN_YA,
  Coalesce(statisticschildren.CKO_REN, 0) AS CKO_CHILDRENS,
  Coalesce(statisticsother.CKO_REN, 0) AS CKO_REN_OTHER
FROM
  (SELECT
      branches.branchname,
      itemtypes.description,
      branches.branchcode,
      itemtypes.itemtype
    FROM
      branches,
      itemtypes
    WHERE
      branches.branchcode Like <<Choose check-out library|ZBRAN>>) branch_itype Left Join
  (SELECT
      Coalesce(statistics.branch, "NEKLS") AS branch,
      Coalesce(statistics.itemtype, "BOOK") AS itemtype,
      Count(*) AS CKO_REN
    FROM
      statistics
    WHERE
      (statistics.type = 'issue' OR
        statistics.type = 'renew') AND
      Year(statistics.datetime) = Year(Now() - INTERVAL 1 MONTH) AND
      Month(statistics.datetime) = Month(Now() - INTERVAL 1 MONTH)
    GROUP BY
      Coalesce(statistics.branch, "NEKLS"),
      Coalesce(statistics.itemtype, "BOOK")
    ORDER BY
      branch,
      itemtype) statisticsall ON branch_itype.branchcode = statisticsall.branch
      AND
      branch_itype.itemtype = statisticsall.itemtype LEFT JOIN
  (SELECT
      Coalesce(statistics.branch, "NEKLS") AS branch,
      Coalesce(statistics.itemtype, "BOOK") AS itemtype,
      Count(*) AS CKO_REN
    FROM
      statistics
    WHERE
      (statistics.type = 'issue' OR
        statistics.type = 'renew') AND
      Year(statistics.datetime) = Year(Now() - INTERVAL 1 MONTH) AND
      Month(statistics.datetime) = Month(Now() - INTERVAL 1 MONTH) AND
      (Coalesce(statistics.location, "CART") = 'ADULT' OR
        Coalesce(statistics.location, "CART") = 'LVPLADULT' OR
        Coalesce(statistics.location, "CART") = 'PAOLAADULT' OR
        Coalesce(statistics.location, "CART") = 'BALDADULT')
    GROUP BY
      Coalesce(statistics.branch, "NEKLS"),
      Coalesce(statistics.itemtype, "BOOK")
    ORDER BY
      branch,
      itemtype) statisticsadult ON branch_itype.branchcode =
      statisticsadult.branch AND
      branch_itype.itemtype = statisticsadult.itemtype LEFT JOIN
  (SELECT
      Coalesce(statistics.branch, "NEKLS") AS branch,
      Coalesce(statistics.itemtype, "BOOK") AS itemtype,
      Count(*) AS CKO_REN
    FROM
      statistics
    WHERE
      (statistics.type = 'issue' OR
        statistics.type = 'renew') AND
      Year(statistics.datetime) = Year(Now() - INTERVAL 1 MONTH) AND
      Month(statistics.datetime) = Month(Now() - INTERVAL 1 MONTH) AND
      Coalesce(statistics.location, "CART") NOT LIKE "%ADULT%" AND
      Coalesce(statistics.location, "CART") NOT LIKE "%CHILD%" AND
      Coalesce(statistics.location, "CART") NOT LIKE "%YA%"
    GROUP BY
      Coalesce(statistics.branch, "NEKLS"),
      Coalesce(statistics.itemtype, "BOOK")
    ORDER BY
      branch,
      itemtype) statisticsother ON branch_itype.branchcode =
      statisticsother.branch AND
      branch_itype.itemtype = statisticsother.itemtype LEFT JOIN
  (SELECT
      Coalesce(statistics.branch, "NEKLS") AS branch,
      Coalesce(statistics.itemtype, "BOOK") AS itemtype,
      Count(*) AS CKO_REN
    FROM
      statistics
    WHERE
      (statistics.type = 'issue' OR
        statistics.type = 'renew') AND
      Year(statistics.datetime) = Year(Now() - INTERVAL 1 MONTH) AND
      Month(statistics.datetime) = Month(Now() - INTERVAL 1 MONTH) AND
      (Coalesce(statistics.location, "CART") LIKE "%YA%" OR
        Coalesce(statistics.location, "CART") LIKE "YOUNGADULT")
    GROUP BY
      Coalesce(statistics.branch, "NEKLS"),
      Coalesce(statistics.itemtype, "BOOK")
    ORDER BY
      branch,
      itemtype) statisticsya ON statisticsya.itemtype = branch_itype.itemtype
      AND
      statisticsya.branch = branch_itype.branchcode LEFT JOIN
  (SELECT
      Coalesce(statistics.branch, "NEKLS") AS branch,
      Coalesce(statistics.itemtype, "BOOK") AS itemtype,
      Count(*) AS CKO_REN
    FROM
      statistics
    WHERE
      (statistics.type = 'issue' OR
        statistics.type = 'renew') AND
      Year(statistics.datetime) = Year(Now() - INTERVAL 1 MONTH) AND
      Month(statistics.datetime) = Month(Now() - INTERVAL 1 MONTH) AND
      Coalesce(statistics.location, "CART") LIKE "%CHILD%"
    GROUP BY
      Coalesce(statistics.branch, "NEKLS"),
      Coalesce(statistics.itemtype, "BOOK")
    ORDER BY
      branch,
      itemtype) statisticschildren ON statisticschildren.itemtype =
      branch_itype.itemtype AND
      statisticschildren.branch = branch_itype.branchcode
GROUP BY
  branch_itype.branchname,
  branch_itype.description
ORDER BY
  branch_itype.branchname,
  branch_itype.description



