/*
R.002593

----------

Name: New Patrons by Categorycode for a month for Overbrook
Created by: Heather Braum

----------

Group: Library-Specific
     Overbrook

Created on: 2015-08-28 05:52:17
Modified on: 2016-07-01 12:25:27
Date last run: -

----------

Public: 0
Expiry: 0

----------

For when Overbrook needs stats early. 

----------
*/

SELECT categorycode, count(*) FROM borrowers WHERE branchcode='OVERBROOK' and month(dateenrolled)=<<Choose Month|Month>> AND year(dateenrolled)=<<Choose Year|Year>> GROUP BY categorycode


