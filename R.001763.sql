/*
R.001763

----------

Name: Top 100 Titles with Holds Report for Media (DVDs, Blu-Ray, TV Series, Videogames)
Created by: Heather Braum

----------

Group: Popular Reports
     -

Created on: 2013-02-25 12:18:01
Modified on: 2017-12-18 15:38:01
Date last run: 2019-03-25 08:55:30

----------

Public: 0
Expiry: 0

----------



----------
*/

select count(DISTINCT reserves.borrowernumber) as reservecount, count(DISTINCT items.itemnumber) as itemcount, ROUND(count(DISTINCT reserves.borrowernumber)/count(DISTINCT items.itemnumber)) AS holdsratio, biblio.title, ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code>="b"]') as 'Remainder of Title', items.ccode, items.itype, biblio.biblionumber from borrowers LEFT JOIN reserves USING(borrowernumber) join biblio USING(biblionumber) join biblio_metadata USING(biblionumber) JOIN items USING(biblionumber) WHERE items.ccode IN ('DVD','TVSERIES','BLURAY','VIDEOGAME') group by biblionumber order by holdsratio desc, reservecount desc limit 100


