/*
R.002305

----------

Name: Call Number report for Valley Falls
Created by: Heather Braum

----------

Group: Library-Specific
     Valley Falls

Created on: 2014-07-29 14:19:52
Modified on: 2014-07-29 14:23:46
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/cataloguing/additem.pl?op=edititem&biblionumber=',b.biblionumber,'&itemnumber=',i.itemnumber,'#edititem\" target="_blank">'"edit item"'</a>') as "edit item", i.itemcallnumber, b.title, i.ccode, i.location FROM items i JOIN biblio b USING(biblionumber) WHERE i.homebranch='VALLEYFALL' ORDER BY i.itemcallnumber LIMIT 15000



