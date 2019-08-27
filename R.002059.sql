/*
R.002059

----------

Name: List of All Patrons with unfilled holds in a single month
Created by: Heather Braum

----------

Group: Administrative Reports
     Holds-admin

Created on: 2013-10-22 14:48:51
Modified on: 2013-10-22 14:52:49
Date last run: 2018-10-07 13:01:28

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT p.firstname, p.surname, r.branchcode as pickup, p.branchcode as home, r.reservedate, b.title, CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',b.biblionumber,'\" target="_blank">'"link to record"'</a>') AS record, count(i.itemnumber) FROM reserves r LEFT JOIN borrowers p USING (borrowernumber) LEFT JOIN biblio b USING (biblionumber) LEFT JOIN items i USING(biblionumber)WHERE r.priority > 0 AND MONTH(r.reservedate)=<<enter month>> AND YEAR(r.reservedate)=<<enter year>> GROUP BY p.firstname, p.surname, pickup, b.title, record LIMIT 10000




