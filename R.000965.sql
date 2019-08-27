/*
R.000965

----------

Name: Cumulative ILL Loans for a Specific Branch
Created by: -

----------

Group: Daily, Monthly, Yearly Stats
     Yearly

Created on: 2010-10-25 15:25:58
Modified on: 2013-06-18 18:26:21
Date last run: 2019-07-30 18:53:30

----------

Public: 0
Expiry: 0

----------

Enhanced.  Counts number of your items sent to fill holds by year

----------
*/

SELECT items.homebranch, MONTH(datesent), COUNT(*) FROM branchtransfers LEFT JOIN items USING (itemnumber) WHERE (items.homebranch != branchtransfers.tobranch) AND (branchtransfers.frombranch != branchtransfers.tobranch) and YEAR(datesent)=<<Year>> and items.homebranch=<<Pick Items Home Branch|branches>> GROUP BY MONTH(datesent)



