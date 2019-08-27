/*
R.002185

----------

Name: Yearly ILL Borrows for Limited AV Materials
Created by: Heather Braum

----------

Group: Administrative Reports
     ILL-admin

Created on: 2014-02-06 23:55:53
Modified on: 2014-02-06 23:55:53
Date last run: -

----------

Public: 0
Expiry: 300

----------

DVD, TV Series

----------
*/

SELECT branchtransfers.tobranch, COUNT(*) as borrows FROM branchtransfers LEFT JOIN items USING (itemnumber) WHERE (branchtransfers.tobranch != items.homebranch) AND (branchtransfers.tobranch != branchtransfers.frombranch) and YEAR(datesent)=<<enter year>> AND items.ccode IN ('DVD','TVSERIES') GROUP BY branchtransfers.tobranch



