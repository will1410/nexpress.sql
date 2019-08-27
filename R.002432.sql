/*
R.002432

----------

Name: 9.1a books owned as of January 1 previous year (part 2)
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-01-08 16:42:46
Modified on: 2017-02-06 09:52:48
Date last run: 2017-10-09 16:16:30

----------

Public: 0
Expiry: 0

----------

This report gives total number of books owned as of January 1, [prev year] (that were deleted in [prev year]). Need to run part 1 report to get items still in the collection on January 1, [prev year] that were added before [prev year]. ready for 2016

----------
*/

SELECT homebranch, count(*) FROM deleteditems WHERE dateaccessioned < '2015-01-01' AND ((itype IN ('book','localhold2','newbook','walkin2')) OR (itype='localhold' and ccode IN ('easy','fiction','nonfiction','profcoll')) OR (itype='reference' and ccode NOT IN ('bookoncd','bookonmp','computer','GADGET','GAMECUBE','magazine','MAP','SOFTWARE','vhs','dvd','misc','blu-ray')) OR (itype='walkin' and ccode IN ('biography','easy','holiday','kansas','genealogy','nonfiction','profcoll','walkin'))) GROUP BY homebranch LIMIT 100



