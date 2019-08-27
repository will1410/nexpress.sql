/*
R.001860

----------

Name: SMS Cleanup
Created by: Heather Braum

----------

Group: Administrative Reports
     School Libraries-admin

Created on: 2013-05-20 14:47:39
Modified on: 2013-06-17 01:55:45
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT b.biblionumber, b.title, t.isbn, t.pages, t.size, b.author, t.publishercode, CONCAT('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=ti&q=',b.title,'&sort_by=title_az\">',b.title,'</a>')
AS "Title Search", CONCAT ('<a href=\"/cgi-bin/koha/reports/guided_reports.pl?phase=Run+this+report&reports=1368&sql_params=%25',b.author,'%25\" target="_blank">',b.author,'</a>') AS "Report of Author", CONCAT('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=au&q=',b.author,'&sort_by=title_az\">',b.author,'</a>')
AS "Author Search", CONCAT('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',b.biblionumber,'\">',b.biblionumber,'</a>') AS "bibnumber linked" FROM biblio b JOIN items i USING(biblionumber) JOIN biblioitems t USING(biblionumber) WHERE i.homebranch='PHSMS' AND b.biblionumber BETWEEN '550000' AND <<enter end number>> GROUP by b.author LIMIT 7000 ORDER BY b.biblionumber DESC



