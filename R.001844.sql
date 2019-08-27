/*
R.001844

----------

Name: Checked Out Items Letters for SMS
Created by: Heather Braum

----------

Group: Catalog Records and Items
     -

Created on: 2013-05-15 14:10:54
Modified on: 2013-05-15 14:33:30
Date last run: 2017-12-18 23:07:35

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT items.barcode, borrowers.firstname, borrowers.surname, CONCAT (borrowers.firstname,' ',borrowers.surname,', #',borrowers.cardnumber,', The ',items.itype,' ',biblio.title,' by ',biblio.author,' with barcode ',items.barcode,' needs to be returned before the school year is over. Please return the item immediately, or you may be charged a replacement cost of $',items.replacementprice,'. Thank you! Beverly Niehues, SMS Librarian.')
FROM borrowers LEFT JOIN borrower_attributes USING (borrowernumber) left join issues USING (borrowernumber) left join items USING (itemnumber) left JOIN biblio USING (biblionumber) where borrowers.branchcode = 'PHSMS' GROUP BY items.barcode ORDER BY borrowers.surname, borrowers.firstname LIMIT 1000


