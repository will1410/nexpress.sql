/*
R.001782

----------

Name: Home or Current Branch is Null
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Items-admin

Created on: 2013-04-01 10:44:22
Modified on: 2013-07-30 16:27:09
Date last run: 2019-02-13 13:41:30

----------

Public: 0
Expiry: 0

----------

(empty/missing homebranch)

----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',biblionumber,'\" target="_blank">'"link to record"'</a>') AS "Linked Record", itemnumber, homebranch, holdingbranch, barcode FROM items WHERE homebranch IS NULL OR holdingbranch IS NULL



