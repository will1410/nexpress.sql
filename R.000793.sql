/*
R.000793

----------

Name: Monthly ILL (Loans)
Created by: NEKLS Administrator

----------

Group: Administrative Reports
     Daily, Monthly, Yearly Stats-admin

Created on: 2010-01-25 09:54:12
Modified on: 2014-07-01 12:12:24
Date last run: 2019-09-05 11:52:23

----------

Public: 0
Expiry: 0

----------

Enhanced! Logic - Counts Library A's items being sent to a library other than Library A.  Update 2-digit month and 4-digit year.

----------
*/

SELECT items.homebranch, COUNT(*) 
FROM branchtransfers 
LEFT JOIN items USING (itemnumber) 
WHERE (items.homebranch != branchtransfers.tobranch) AND (branchtransfers.frombranch != branchtransfers.tobranch) 
AND MONTH(branchtransfers.datesent)=<<Month>> AND YEAR(branchtransfers.datesent)=<<Year>> 
GROUP BY items.homebranch



