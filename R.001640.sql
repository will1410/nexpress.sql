/*
R.001640

----------

Name: Testing 852 and 961 deletions
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Bib Records-admin

Created on: 2012-11-19 10:37:27
Modified on: 2018-06-03 23:22:37
Date last run: 2018-06-03 23:21:49

----------

Public: 0
Expiry: 0

----------

<p><span style="background-color: darkred; color: white">Useful - needs update - run monthly after updated. - GHW</p>

----------
*/

SELECT
  CONCAT ('<a href=\"/cgi-bin/koha/cataloguing/addbiblio.pl?biblionumber=',biblionumber,'\" target="_blank">'"record"'</a>') AS "Edit Record", biblionumber, ExtractValue(metadata,'//datafield[@tag="852"]/*') AS old, ExtractValue(metadata,'//datafield[@tag="961"]/*') AS ancient
FROM biblio_metadata WHERE biblionumber BETWEEN <<bib1>> AND <<bib2>>



