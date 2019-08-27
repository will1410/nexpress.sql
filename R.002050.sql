/*
R.002050

----------

Name: Cancelled Holds
Created by: Heather Braum

----------

Group: Holds-Reserves
     -

Created on: 2013-10-17 11:54:28
Modified on: 2013-10-21 12:13:47
Date last run: 2018-07-09 10:52:51

----------

Public: 0
Expiry: 0

----------

List Holds that Were cancelled between a date range and limit to a branch. 

----------
*/

SELECT b.title, b.author, p.surname, p.firstname, r.reservedate, 
       r.cancellationdate, r.branchcode 
FROM old_reserves r 
LEFT JOIN biblio b USING (biblionumber) 
LEFT JOIN borrowers p USING (borrowernumber) 
WHERE r.cancellationdate BETWEEN <<Cancelled BETWEEN (yyyy-mm-dd)>> 
      AND <<and (yyyy-mm-dd)>> AND r.branchcode =<<Branch|branches>>


