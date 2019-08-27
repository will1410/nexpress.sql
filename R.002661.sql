/*
R.002661

----------

Name: NEKLS Prof Collection - LM call number
Created by: Heather Braum

----------

Group: Library-Specific
     NEKLS

Created on: 2016-02-02 11:34:48
Modified on: 2016-08-15 23:43:26
Date last run: -

----------

Public: 1
Expiry: 0

----------

LM call number prefix

----------
*/

SELECT biblio.biblionumber, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(title, ' /', ''), ',', ''), ' :', ''), '"', ''), ';', ''), '\"', ''), '/', ''), REPLACE(author, ',', '') FROM biblio LEFT JOIN items USING(biblionumber) WHERE items.homebranch='nekls' and items.itemcallnumber LIKE 'LM %' GROUP BY biblionumber ORDER BY biblionumber ASC



