/*
R.001680

----------

Name: Expired Patrons
Created by: Heather Braum

----------

Group: Patrons
     -

Created on: 2012-12-18 21:10:32
Modified on: 2014-01-15 14:25:26
Date last run: 2019-07-26 15:04:29

----------

Public: 0
Expiry: 0

----------

List of expired patrons #patrons

----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/members/memberentry.pl?op=modify&borrowernumber=',borrowers.borrowernumber,'\" target="_blank">'"edit patron"'</a>') as "edit patron", borrowers.surname,borrowers.firstname,borrowers.dateenrolled, borrowers.dateexpiry, borrowers.categorycode,borrowers.phone,borrowers.cardnumber,borrowers.address,borrowers.city,borrowers.zipcode, borrowers.email FROM borrowers WHERE borrowers.branchcode = <<Pick your branch|branches>> AND DATE(borrowers.dateexpiry) < CURDATE() ORDER BY borrowers.surname


