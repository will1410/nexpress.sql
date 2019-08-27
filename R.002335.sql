/*
R.002335

----------

Name: Creating card batches for Schools
Created by: Heather Braum

----------

Group: Administrative Reports
     Patrons-admin

Created on: 2014-08-21 12:34:47
Modified on: 2014-08-25 13:23:48
Date last run: 2018-08-13 02:23:04

----------

Public: 0
Expiry: 0

----------

Need to change the batch_id link field to one step above the last batch_id in the creator_batches table. 

----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/patroncards/edit-batch.pl?borrower_number=',p.borrowernumber,'&batch_id=4696&op=add\" target="_blank">',p.cardnumber,'</a>') as "student" , CONCAT(p.firstname, " ", p.surname) as name, othernames FROM borrowers p WHERE p.branchcode=<<choose branch|branches>> AND categorycode='STUDENT' AND othernames=<<enter othernames>> ORDER BY p.surname, p.firstname


