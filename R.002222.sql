/*
R.002222

----------

Name: Not sure?
Created by: Heather Braum

----------

Group: -
     -

Created on: 2014-03-20 13:08:41
Modified on: 2014-08-09 00:30:15
Date last run: 2017-06-10 16:10:20

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/reserve/request.pl?biblionumber=',r.biblionumber,'\" target="_blank">',biblionumber,'</a>') AS "Holds Link", CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',biblionumber,'\" target="_blank">',r.biblionumber,'</a>') AS "Title Link", r.branchcode, r.reservedate, r.timestamp, CONCAT(p.firstname, ' ', p.surname) as name, p.cardnumber, r.biblionumber, r.found, i.itemlost, i.withdrawn, i.onloan, i.datelastborrowed, i.datelastseen FROM borrowers p LEFT JOIN reserves r USING(borrowernumber) LEFT JOIN items i USING (biblionumber) WHERE r.reservedate < '2014-01-01' AND r.timestamp < '2014-03-13' AND r.branchcode NOT IN('PHSES','NEKLS','PHWAC','CENTRALIA','MCLOUTH','POMONA','WETMORE','OSKALOOSA','EVEREST','WINCHESTER','HORTON','ROSSVILLE','BERN','VALLEYFALL','DONIWATH','SILVERLAKE','OVERBROOK') ORDER BY branchcode, biblionumber



