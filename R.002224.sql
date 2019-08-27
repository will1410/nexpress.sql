/*
R.002224

----------

Name: Not sure?
Created by: Heather Braum

----------

Group: -
     -

Created on: 2014-03-23 20:19:45
Modified on: 2019-07-24 21:42:16
Date last run: 2019-07-24 21:36:20

----------

Public: 0
Expiry: 0

----------

<p><span style="background-color: darkred; color: white">Scheduled for deletion on August 31, 2019</p>

----------
*/

select CONCAT('<a href=\"/cgi-bin/koha/members/memberentry.pl?op=modify&borrowernumber=',borrowers.borrowernumber,'\" target="_blank">'"edit patron"'</a>') as "edit patron", borrowers.firstname, borrowers.surname, borrowers.branchcode, borrowers.cardnumber, borrower_attributes.attribute from borrower_attributes join borrowers USING(borrowernumber) where borrower_attributes.code IN ('LICENSE','ALTID','OLDKEY','STUDENT') group by borrowers.borrowernumber order by borrowers.branchcode, borrowers.surname, borrowers.firstname


