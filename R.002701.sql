/*
R.002701

----------

Name: After merging records, run this report to delete dup holds
Created by: Heather Braum

----------

Group: Administrative Reports
     Holds-admin

Created on: 2016-06-21 13:43:12
Modified on: 2016-06-22 09:52:25
Date last run: -

----------

Public: 0
Expiry: 0

----------

Due to bug 16766

----------
*/

SELECT CONCAT(borrowers.firstname, ' ', borrowers.surname), CONCAT('<a href=\"/cgi-bin/koha/reserve/request.pl?biblionumber=',biblionumber,'\" target="_blank">',biblionumber,'</a>') as "hold link"  FROM reserves LEFT JOIN borrowers USING(borrowernumber) GROUP BY reserves.borrowernumber, biblionumber HAVING count(*) > 1



