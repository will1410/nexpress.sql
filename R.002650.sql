/*
R.002650

----------

Name: New New NEKLS Childrens Report
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-12-31 15:23:33
Modified on: 2015-12-31 15:23:33
Date last run: -

----------

Public: 1
Expiry: 1

----------



----------
*/

SELECT biblio.biblionumber, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(title, ' /', ''), ',', ''), ' :', ''), '"', ''), ';', ''), '\"', ''), '/', ''), REPLACE(author, ',', '')  FROM biblio LEFT JOIN items USING(biblionumber) WHERE homebranch='NEKLS' and itemcallnumber LIKE 'CHILD%'



