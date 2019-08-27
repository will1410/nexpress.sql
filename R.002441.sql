/*
R.002441

----------

Name: 11.5 & 11.9 Borrows and Lending
Created by: Heather Braum

----------

Group: Administrative Reports
     -

Created on: 2015-01-08 21:36:18
Modified on: 2017-02-06 10:04:16
Date last run: -

----------

Public: 0
Expiry: 0

----------

ILL numbers for NExpress -- all other ILL numbers need to be collected separately. 

----------
*/

SELECT branches.branchcode, 
(SELECT count(*) FROM branchtransfers LEFT JOIN items USING (itemnumber) WHERE branches.branchcode=items.homebranch AND (items.homebranch != branchtransfers.tobranch) AND (branchtransfers.frombranch != branchtransfers.tobranch) AND YEAR(branchtransfers.datesent)='2015') as loans,
(SELECT count(*) FROM branchtransfers LEFT JOIN items USING(itemnumber) WHERE branches.branchcode=branchtransfers.tobranch AND (branchtransfers.tobranch != items.homebranch) AND (branchtransfers.tobranch != branchtransfers.frombranch) AND YEAR(branchtransfers.datesent)='2015') as borrows
FROM branches WHERE branches.branchcode NOT IN ('DIGITAL','PAOLA','LOUISBURG')
GROUP BY branches.branchcode 
LIMIT 100




