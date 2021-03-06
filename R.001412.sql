/*
R.001412

----------

Name: All items in a specific not for loan status
Created by: Heather Braum

----------

Group: Administrative Reports
     Not For Loan-admin

Created on: 2012-05-14 23:02:45
Modified on: 2013-11-17 14:23:20
Date last run: 2019-10-10 10:09:19

----------

Public: 0
Expiry: 0

----------

(Entire Collection) Items in a Specific Not For Loan Status

----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',b.biblionumber,'\" target="_blank">'"access record"'</a>') AS "Download Record",  i.notforloan, i.homebranch, i.itemcallnumber,b.title,i.itype,i.ccode,i.barcode, i.dateaccessioned FROM items i JOIN biblio b USING (biblionumber) WHERE i.notforloan=<<Not For Loan Status|NOT_LOAN>> ORDER BY i.dateaccessioned ASC



