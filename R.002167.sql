/*
R.002167

----------

Name: Pages to fix
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Bib Records-admin

Created on: 2014-01-16 23:53:28
Modified on: 2014-01-28 18:14:21
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT biblio.frameworkcode, biblio.biblionumber, biblio.title, 
CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',biblio.biblionumber,'\" target="_blank">'"link to record"'</a>') AS "Link to Record",  
CONCAT('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=ti&q=',biblio.title,'&sort_by=title_az\" target="_blank">',biblio.title,'</a>') AS "Title Search", 
CONCAT('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=au&q=',biblio.author,'&sort_by=title_az\" target="_blank">',biblio.author,'</a>') AS "Author Search", biblioitems.isbn
FROM biblioitems JOIN items USING(biblionumber) JOIN biblio USING(biblionumber) WHERE items.ccode NOT IN ('MAGAZINE','ILL','WALKIN','GADGET','MISC','BOOKONMP') AND items.itype NOT IN ('MAGAZINE','ILL','EQUIPMENT','KITS') AND biblioitems.pages IS NULL AND biblio.title NOT LIKE '%EUDORA ILL%' AND biblio.title NOT LIKE '%BASEHOR ILL%' AND biblio.title NOT LIKE '%BONNER ILL%' AND items.notforloan <> '-1' GROUP BY biblio.biblionumber HAVING count(items.itemnumber) > 0



