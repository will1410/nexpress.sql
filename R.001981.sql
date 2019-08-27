/*
R.001981

----------

Name: Report of authors & author report search
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Bib Records-admin

Created on: 2013-08-09 19:47:24
Modified on: 2013-08-16 10:07:44
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT biblio.author, CONCAT('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=au&q=',biblio.author,'&sort_by=title_az\" target="_blank">',biblio.author,'</a>') as "author search", CONCAT('<a href=\"/cgi-bin/koha/reports/guided_reports.pl?phase=Run+this+report&reports=1980&sql_params=',biblio.author,'&sort_by=title_az\" target="_blank">',biblio.author,'</a>') as "list of bibs report link", count(DISTINCT biblio.biblionumber) as count FROM biblio LEFT JOIN items USING(biblionumber) WHERE items.homebranch IN ('PHAXTELL','PHSMS','PHSES','PHSHS','PHWAC') AND biblio.biblionumber BETWEEN '555000' AND '576000' GROUP BY biblio.author HAVING count(items.itemnumber) > 0 ORDER BY count DESC



