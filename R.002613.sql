/*
R.002613

----------

Name: Items Acquired Last 30 Days
Created by: Bywater bwssupport

----------

Group: -
     -

Created on: 2015-10-09 06:43:25
Modified on: 2015-10-15 14:54:45
Date last run: -

----------

Public: 1
Expiry: 300

----------



----------
*/

SELECT biblio.biblionumber, title, author, ccode FROM items LEFT JOIN biblio USING ( biblionumber ) WHERE items.dateaccessioned BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE() AND homebranch=<<choose a library|branches>> 



