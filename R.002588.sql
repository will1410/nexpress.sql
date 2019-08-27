/*
R.002588

----------

Name: ILL Stats for Overbrook
Created by: Heather Braum

----------

Group: Library-Specific
     Overbrook

Created on: 2015-08-28 05:43:15
Modified on: 2016-07-01 12:18:29
Date last run: -

----------

Public: 0
Expiry: 0

----------

For when the library has run them earlier than NExpress team is ready to. 

----------
*/

SELECT branches.branchcode as Library, 
(SELECT count(*) FROM branchtransfers LEFT JOIN items USING (itemnumber) WHERE branches.branchcode=items.homebranch AND (items.homebranch != branchtransfers.tobranch) AND (branchtransfers.frombranch != branchtransfers.tobranch) AND MONTH(branchtransfers.datesent)=<<Choose month|Month>> AND YEAR(branchtransfers.datesent)=<<Choose Year|Year>>) as loans,
(SELECT count(*) FROM branchtransfers LEFT JOIN items USING(itemnumber) WHERE branches.branchcode=branchtransfers.tobranch AND (branchtransfers.tobranch != items.homebranch) AND (branchtransfers.tobranch != branchtransfers.frombranch) AND MONTH(branchtransfers.datesent)=<<Choose month|Month>> AND YEAR(branchtransfers.datesent)=<<Choose Year|Year>>) as borrows
FROM branches WHERE branches.branchcode ='OVERBROOK'
GROUP BY branches.branchcode 
LIMIT 100



