/*
R.002853

----------

Name: GHW - Action Logs - last 10 days
Created by: George H Williams

----------

Group: Administrative Reports
     Testing

Created on: 2016-12-14 08:35:31
Modified on: 2019-03-20 23:55:16
Date last run: 2019-09-09 11:50:26

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT
  action_logs.action_id,
  action_logs.timestamp,
  action_logs.user,
  action_logs.module,
  action_logs.action,
  action_logs.object,
  replace(replace(action_logs.info, CHAR(13), 'ZAZAZ '), CHAR(10), 'YAYAY')
FROM
  action_logs
WHERE
  action_logs.timestamp > Now() - INTERVAL 10 DAY AND
  action_logs.module = 'SYSTEMPREFERENCE'



