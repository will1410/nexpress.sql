/*
R.002876

----------

Name: Custom Holds Report: records with only 1 or 2 items available that your library owns
Created by: BASEHOR DIRECTOR

----------

Group: -
     -

Created on: 2017-01-05 10:23:46
Modified on: 2017-01-05 10:27:59
Date last run: 2018-06-18 12:53:33

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',t.biblionumber,'\" target="_blank">'"link to record"'</a>') AS "Link to Record",  t.title, b.author, t.holdingbranch, t.itemcallnumber, t.barcode, i.ccode, i.location, i.dateaccessioned as 'Accessioned', count(i.itemnumber) as totalitemsavail, 
(SELECT count(r.reserve_id) FROM reserves r WHERE r.biblionumber=t.biblionumber GROUP BY t.biblionumber) AS totalholds
FROM tmp_holdsqueue t LEFT JOIN biblio b USING(biblionumber) LEFT JOIN items i USING(biblionumber) 
WHERE i.withdrawn = '0' AND i.itemlost='0' AND i.notforloan='0' AND i.damaged='0' and i.onloan IS NULL AND t.holdingbranch=<<Choose your library|branches>> and t.pickbranch <> <<choose your library again|branches>>
GROUP BY t.itemnumber having count(totalitemsavail) < '3'
ORDER BY i.location, i.ccode, t.itemcallnumber


