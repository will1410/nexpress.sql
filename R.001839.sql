/*
R.001839

----------

Name: Suspended Holds? 
Created by: Heather Braum

----------

Group: Administrative Reports
     Holds-admin

Created on: 2013-05-14 12:03:49
Modified on: 2014-01-15 15:18:57
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT reserves.suspend_until, CONCAT('<a href=\"/cgi-bin/koha/reserve/request.pl?biblionumber=',biblio.biblionumber,'\" target="_blank">',biblio.biblionumber,'</a>') AS "Holds", borrowers.firstname, borrowers.surname, reserves.reservedate, reserves.timestamp, biblio.title, reserves.itemnumber, reserves.waitingdate FROM reserves LEFT JOIN borrowers USING(borrowernumber) LEFT JOIN biblio USING(biblionumber) WHERE reserves.suspend='1' GROUP BY reserves.reserve_id ORDER BY reserves.reservedate DESC LIMIT 400



