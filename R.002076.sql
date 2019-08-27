/*
R.002076

----------

Name: Counts of Returns (Checkins) for specific patrons per day
Created by: Heather Braum

----------

Group: Administrative Reports
     Patron Statistics-admin

Created on: 2013-10-29 16:06:57
Modified on: 2015-09-11 12:30:05
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT borrowernumber, MONTH(datetime) as month, DAY(datetime) as DAY, count(datetime) as count FROM statistics WHERE type='return' AND borrowernumber = <<enter borrowernumber>> GROUP BY borrowernumber, month, day


