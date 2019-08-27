/*
R.003098

----------

Name: GHW - Hoopla 001
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-07-02 15:37:18
Modified on: 2018-08-01 14:06:32
Date last run: 2019-02-01 17:26:13

----------

Public: 0
Expiry: 300

----------

Delete items and associated biblios by the 5th of each month

----------
*/

SELECT
  items.itemnumber
FROM
  items
WHERE
  items.itemcallnumber = 'Hoopla' AND
  (items.ccode = 'DLAUDIO' OR
    items.ccode = 'DLBOOK' OR
    items.ccode = 'DLMUSIC')
GROUP BY
  items.itemnumber



