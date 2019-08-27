/*
R.000434

----------

Name: Patrons with no email address
Created by: -

----------

Group: Patrons
     Fix Patrons

Created on: 2009-04-23 13:39:30
Modified on: 2013-06-17 02:04:17
Date last run: 2018-12-12 11:13:55

----------

Public: 0
Expiry: 0

----------

List of your library's patrons without an email address.

----------
*/

SELECT email, cardnumber, surname, firstname, branchcode, debarred, dateexpiry FROM borrowers WHERE branchcode=<<branch|branches>> AND email = "" ORDER BY branchcode, cardnumber ASC


