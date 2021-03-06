/*
R.003172

----------

Name: GHW - Collection code count by Library
Created by: George H Williams

----------

Group: -
     -

Created on: 2019-02-18 11:40:08
Modified on: 2019-04-18 20:27:32
Date last run: 2020-02-06 10:44:50

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT
  authorised_values.lib AS CCODE_DESCRIPTION,
  authorised_values.authorised_value AS CCODE_CODE,
  If(branchlimits.branchcode IS NOT NULL, "Yes", "") AS THIS_LIB_CAN_CREATE_,
  Coalesce(totalcount.Count_itemnumber, "-") AS TOTAL_COUNT,
  Coalesce(addcount.Count_itemnumber, "-") AS ADD_LAST_MONTH,
  Coalesce(deletecount.Count_itemnumber, "-") AS DEL_LAST_MONTH,
  Concat(
    '<a class= "clicked" href=\"/cgi-bin/koha/reports/guided_reports.pl?reports=2731&phase=Run+this+report',
    CHAR(38),
    'param_name=Item+home+library%7CZBRAN&sql_params=',
    totalcount.homebranch,
    CHAR(38),
    'param_name=Item+shelving+location%7CLLOC&sql_params=%25',
    CHAR(38),
    'param_name=Item+type%7CLITYPES&sql_params=%25',
    CHAR(38),
    'param_name=Item+collection+code%7CLCCODE&sql_params=',
    authorised_values.authorised_value,
    CHAR(38),
    'param_name=Enter+first+part+of+call+number+or+a+%25+symbol',
    CHAR(38),
    'sql_params=%25',
    CHAR(38),
    'param_name=Not+for+loan+status%7CLNOT_LOAN&sql_params=%25',
    CHAR(38),
    'param_name=Item+was+added+before%7Cdate&sql_params=02%2F18%2F2019',
    CHAR(38),
    'param_name=Date+last+borrowed+was+before%7Cdate&sql_params=02%2F18%2F2019',
    CHAR(38),
    'param_name=Date+last+seen+was+before%7Cdate&sql_params=02%2F18%2F2019',
    CHAR(38),
    'param_name=With+X+or+fewer+checkouts%7CZNUMBERS&sql_params=999999999999',
    CHAR(38),
    'param_name=Display+checked+out+items%7CZYES_NO&sql_params=%25',
    CHAR(38),
    'param_name=Display+lost%2C+missing%2C+and+withdrawn+items%7CZYES_NO&sql_params=%25',
    CHAR(38),
    'param_name=With+X+or+more+copies+at+this+library%7CYNUMBER&sql_params=0',
    CHAR(38),
    'param_name=With+X+or+more+copies+at+throughout+the+catalog%7CYNUMBER&sql_params=0\" target="_blank">current shelf-list</a>'
  ) AS LINK_TO_SHELF_LIST
FROM
  authorised_values
  LEFT JOIN (SELECT
      Coalesce(items.ccode, "XXX") AS ccode,
      Count(items.itemnumber) AS Count_itemnumber,
      items.homebranch
    FROM
      items
    WHERE
      items.homebranch LIKE @brn := <<Choose your library|ZBRAN>> COLLATE utf8mb4_unicode_ci
    GROUP BY
      Coalesce(items.ccode, "XXX")) totalcount ON totalcount.ccode = authorised_values.authorised_value
  LEFT JOIN (SELECT
      Count(items.itemnumber) AS Count_itemnumber,
      items.homebranch,
      Coalesce(items.ccode, "XXX") AS ccode
    FROM
      items
    WHERE
      items.homebranch LIKE @brn AND
      Month(items.dateaccessioned) = Month(Now() - INTERVAL 1 MONTH) AND
      Year(items.dateaccessioned) = Year(Now() - INTERVAL 1 MONTH)
    GROUP BY
      Coalesce(items.ccode, "XXX")) addcount ON addcount.ccode = authorised_values.authorised_value
  LEFT JOIN (SELECT
      Count(deleteditems.itemnumber) AS Count_itemnumber,
      deleteditems.homebranch,
      Coalesce(deleteditems.ccode, "XXX") AS ccode
    FROM
      deleteditems
    WHERE
      deleteditems.homebranch LIKE @brn AND
      Month(deleteditems.timestamp) = Month(Now() - INTERVAL 1 MONTH) AND
      Year(deleteditems.timestamp) = Year(Now() - INTERVAL 1 MONTH)
    GROUP BY
      Coalesce(deleteditems.ccode, "XXX")) deletecount ON deletecount.ccode = authorised_values.authorised_value
  LEFT JOIN (SELECT
      authorised_values_branches.av_id,
      authorised_values_branches.branchcode
    FROM
      authorised_values_branches
    WHERE
      authorised_values_branches.branchcode LIKE @brn
    GROUP BY
      authorised_values_branches.av_id,
      authorised_values_branches.branchcode) branchlimits ON branchlimits.av_id = authorised_values.id
WHERE
  authorised_values.category = 'CCODE'
GROUP BY
  authorised_values.lib,
  authorised_values.authorised_value,
  totalcount.Count_itemnumber,
  addcount.Count_itemnumber,
  deletecount.Count_itemnumber
LIMIT 500



