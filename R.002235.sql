/*
R.002235

----------

Name: Borrower accounts with account management fees
Created by: Heather Braum

----------

Group: Administrative Reports
     Patrons-admin

Created on: 2014-04-02 12:52:31
Modified on: 2014-08-09 00:32:02
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT * FROM accountlines WHERE description LIKE "Account management%"



