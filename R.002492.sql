/*
R.002492

----------

Name: Patron search
Created by: SABETHA TECH

----------

Group: Patrons
     -

Created on: 2015-04-29 17:27:55
Modified on: 2015-04-29 17:29:49
Date last run: 2019-05-02 12:01:33

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT  borrowers.surname,borrowers.firstname,borrowers.branchcode FROM borrowers   WHERE borrowers.branchcode='PHSHS' AND borrowers.categorycode='STUDENT'  AND borrowers.zipcode='66002' ORDER BY borrowers.surname asc,borrowers.firstname asc,borrowers.branchcode asc



