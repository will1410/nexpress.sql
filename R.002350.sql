/*
R.002350

----------

Name: Total Charges paid in a specific month at your library
Created by: Heather Braum

----------

Group: Circulation
     Charges

Created on: 2014-09-03 16:51:17
Modified on: 2015-05-28 09:44:51
Date last run: 2017-12-28 09:47:09

----------

Public: 0
Expiry: 0

----------

Gives total of payments in Koha in a specific month (listed as negative amount in the accountlines table); branch is based on staff accounts listed in manager_id recorded when fines are paid. 

----------
*/

SELECT ROUND(ABS(SUM(a.amount)),2) as total, description FROM accountlines a WHERE manager_id IN (SELECT borrowernumber FROM borrowers WHERE categorycode='STAFF' AND branchcode=<<choose branch|branches>>) AND a.accounttype="Pay" AND year(a.date)=<<enter four digit year>> AND month(a.date)=<<enter two digit month>> AND a.amount < 0



