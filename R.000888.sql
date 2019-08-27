/*
R.000888

----------

Name: LOST Report for Your Library's Patrons
Created by: NEKLS Administrator

----------

Group: Circulation
     Charges

Created on: 2010-07-09 14:55:50
Modified on: 2016-04-15 12:59:47
Date last run: 2019-08-27 09:08:06

----------

Public: 0
Expiry: 0

----------

Enhanced - Click Run, Select Branch code twice from dropdown menu, Run and download report results;

Updated 7/30/15: includes all lost items in the system. if the item hasn't been deleted, lists title, barcode, ccode, itype, callnumber; if item has been deleted, limited info available in the description column. 

----------
*/

SELECT accountlines.date as "date marked lost", borrowers.cardnumber, borrowers.surname, borrowers.firstname, borrowers.phone,borrowers.email,borrowers.address, borrowers.city,borrowers.zipcode, items.homebranch as "owning library", biblio.title as title, items.ccode as ccode, items.itype as itype, items.itemcallnumber, items.barcode, accountlines.description, accountlines.timestamp as "last change", FORMAT(SUM(accountlines.amountoutstanding),2) as "amount due" FROM biblio LEFT JOIN items USING(biblionumber) LEFT JOIN accountlines USING(itemnumber) LEFT JOIN borrowers USING(borrowernumber) WHERE borrowers.branchcode=<<choose library|branches>> and accounttype IN ('l','losti') AND accountlines.amountoutstanding > 0 AND accountlines.itemnumber IS NOT NULL GROUP BY accountlines.accountlines_id
UNION ALL
SELECT accountlines.date, borrowers.cardnumber, borrowers.surname, borrowers.firstname, borrowers.phone,borrowers.email,borrowers.address, borrowers.city,borrowers.zipcode, "deleted homebranch", "deleted title", "deleted ccode", "deleted itype", "deleted itemcallnumber", "deleted barcode",accountlines.description, accountlines.timestamp,  FORMAT(SUM(accountlines.amountoutstanding),2)  FROM accountlines LEFT JOIN borrowers USING(borrowernumber) WHERE borrowers.branchcode=<<choose library|branches>> and accounttype IN ('l','losti') AND accountlines.amountoutstanding > 0 AND accountlines.itemnumber IS NULL AND accountlines.itemnumber IS NULL GROUP BY accountlines.accountlines_id


