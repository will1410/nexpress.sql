/*
R.002283

----------

Name: Circulation based on shelving location 
Created by: OVERBROOK TECH

----------

Group: Circulation
     Circ Stats

Created on: 2014-06-17 12:06:41
Modified on: 2015-08-16 20:52:20
Date last run: 2019-07-25 13:48:04

----------

Public: 0
Expiry: 0

----------

Ordered by total issues

----------
*/

SELECT biblio.title,t.publicationyear,items.replacementprice,items.dateaccessioned,items.issues,items.itype,items.ccode,items.homebranch FROM items LEFT JOIN biblio USING(biblionumber) LEFT JOIN biblioitems t USING(biblionumber) WHERE items.homebranch=<<Pick your branch|branches>> AND items.location=<<Pick your shelving location|LOC>> GROUP BY biblio.biblionumber ORDER BY items.issues DESC



