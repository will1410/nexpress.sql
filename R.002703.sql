/*
R.002703

----------

Name: Bonner Springs Patron Count
Created by: Heather Braum

----------

Group: Library-Specific
     Bonner Springs

Created on: 2016-06-29 09:14:04
Modified on: 2016-06-30 11:46:57
Date last run: 2018-10-07 15:51:24

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT b.categorycode, (SELECT ba.attribute FROM borrower_attributes ba WHERE ba.borrowernumber=b.borrowernumber AND ba.code='Location') as location, count(DISTINCT borrowernumber) FROM borrowers b WHERE b.branchcode='BONNERSPGS' GROUP BY b.categorycode, location



