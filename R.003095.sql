/*
R.003095

----------

Name: GHW - Monthly circulation by collection code
Created by: George H Williams

----------

Group: Statistics
     Date range

Created on: 2018-07-01 16:35:43
Modified on: 2018-12-09 21:12:24
Date last run: 2019-05-22 13:59:35

----------

Public: 0
Expiry: 300

----------

<div id=reportinfo>
<p>Reports circulation and renewal counts by branchcode, collection code, and shelving location</p>
<ul><li>Reports counts for the month you specify (within the previous 25 monhts)</li>
<li>at the library you specify</li>
<li>grouped by branchcode and collection code</li>
<li>sorted by branchcode and collection code description</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=3095&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
 branch_types.branchcode,
 branch_types.ccodename,
 Coalesce(circ_renew.count, 0) AS ALL_CIRC_COUNT,
 Coalesce(adult.count, 0) AS ADULT,
 Coalesce(youngadult.count, 0) AS YOUNG_ADULT,
 Coalesce(children.count, 0) AS CHILDRENS,
 Coalesce(other.count, 0) AS OTHER
FROM
   (SELECT
      branchcodes.authorised_value AS branchcode,
      branchcodes.lib AS branchname,
      ccodes.authorised_value AS ccode,
      ccodes.lib AS ccodename
     FROM
      authorised_values ccodes,
      authorised_values branchcodes
     WHERE
      ccodes.category = 'MRCCODE' AND
      branchcodes.category = 'MRBRAN'
     GROUP BY
      branchcodes.authorised_value,
      branchcodes.lib,
      ccodes.authorised_value,
      ccodes.lib) branch_types
 LEFT JOIN (SELECT
      Coalesce(st.branch, "~") AS branch,
      Count(*) AS count,
      Coalesce(st.ccode, "~") AS ccode
     FROM
      statistics st
     WHERE
      (st.type = 'issue' OR
       st.type = 'renew') AND
      (Month(st.datetime) = @date1 := <<Select month|Month>> COLLATE utf8mb4_unicode_ci) AND
      (Year(st.datetime) = @year1 := <<Select year|Year>> COLLATE utf8mb4_unicode_ci)
     GROUP BY
      Coalesce(st.ccode, "~"),
      st.ccode,
      st.branch) circ_renew ON branch_types.branchcode = circ_renew.branch AND
  branch_types.ccode = circ_renew.ccode
 LEFT JOIN (SELECT
      Coalesce(st.branch, "~") AS branch,
      Coalesce(st.ccode, "~") AS ccode,
      count(*) AS count
     FROM
      statistics st
      LEFT JOIN items i ON st.itemnumber = i.itemnumber
     WHERE
      (st.type = 'issue' OR
       st.type = 'renew') AND
      Month(st.datetime) = @date1 AND
      Year(st.datetime) = @year1 AND
      (i.location = 'ADULT' OR
       i.location = 'LVPLADULT')
     GROUP BY
      Coalesce(st.branch, "~"),
      Coalesce(st.ccode, "~")
     ORDER BY
      branch,
      ccode) adult ON branch_types.branchcode = adult.branch AND
  branch_types.ccode = adult.ccode
 LEFT JOIN (SELECT
      Coalesce(st.branch, "~") AS branch,
      Coalesce(st.ccode, "~") AS ccode,
      count(*) AS count
     FROM
      statistics st
      LEFT JOIN items i ON st.itemnumber = i.itemnumber
     WHERE
      (st.type = 'issue' OR
       st.type = 'renew') AND
      Month(st.datetime) = @date1 AND
      Year(st.datetime) = @year1 AND
      (i.location = 'YOUNGADULT' OR
       i.location = 'LVPLYA')
     GROUP BY
      Coalesce(st.branch, "~"),
      Coalesce(st.ccode, "~")
     ORDER BY
      branch,
      ccode) youngadult ON branch_types.branchcode = youngadult.branch AND
  branch_types.ccode = youngadult.ccode
 LEFT JOIN (SELECT
      Coalesce(st.branch, "~") AS branch,
      Coalesce(st.ccode, "~") AS ccode,
      count(*) AS count
     FROM
      statistics st
      LEFT JOIN items i ON st.itemnumber = i.itemnumber
     WHERE
      (st.type = 'issue' OR
       st.type = 'renew') AND
      Month(st.datetime) = @date1 AND
      Year(st.datetime) = @year1 AND
      (i.location = 'CHILDRENS' OR
       i.location = 'LVPLCHILD')
     GROUP BY
      Coalesce(st.branch, "~"),
      Coalesce(st.ccode, "~")
     ORDER BY
      branch,
      ccode) children ON branch_types.branchcode = children.branch AND
  branch_types.ccode = children.ccode
 LEFT JOIN (SELECT
      Coalesce(st.branch, "~") AS branch,
      Coalesce(st.ccode, "~") AS ccode,
      count(*) AS count
     FROM
      statistics st
      LEFT JOIN items i ON st.itemnumber = i.itemnumber
     WHERE
      (st.type = 'issue' OR
       st.type = 'renew') AND
      Month(st.datetime) = @date1 AND
      Year(st.datetime) = @year1 AND
      (i.location = 'CART' OR
       i.location = 'CATALOGING' OR
       i.location = 'PROC' OR
       i.location IS NULL)
     GROUP BY
      Coalesce(st.branch, "~"),
      Coalesce(st.ccode, "~")
     ORDER BY
      branch,
      ccode) other ON branch_types.branchcode = other.branch AND
  branch_types.ccode = other.ccode
WHERE
 branch_types.branchcode LIKE <<Choose your library|LBRANCH>>
GROUP BY
 branch_types.branchcode,
 branch_types.ccodename
ORDER BY
 branch_types.branchcode,
 branch_types.ccodename



