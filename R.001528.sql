/*
R.001528

----------

Name: All Authors in NExpress
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Bib Records-admin

Created on: 2012-08-25 00:28:16
Modified on: 2013-06-17 00:51:33
Date last run: 2018-05-07 00:01:27

----------

Public: 0
Expiry: 0

----------



----------
*/

select author, count(title) AS total from biblio WHERE author IS NOT NULL GROUP by author



