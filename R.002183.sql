/*
R.002183

----------

Name: Yearly ILL Loans for Book Materials
Created by: Heather Braum

----------

Group: Administrative Reports
     ILL-admin

Created on: 2014-02-06 14:53:28
Modified on: 2014-02-06 14:59:04
Date last run: -

----------

Public: 0
Expiry: 0

----------

Non-AV CCodes

----------
*/

SELECT items.homebranch, COUNT(*) as loans FROM branchtransfers LEFT JOIN items USING (itemnumber) WHERE (items.homebranch != branchtransfers.tobranch) AND (branchtransfers.frombranch != branchtransfers.tobranch) and YEAR(datesent)=<<enter year>> AND items.ccode IN ('XXX','BILINGUAL','BIOGRAPHY','BOARDBK','BOOKONCASS','BOOKONCD','BOOKONMP','READER','EDUCATION','FICTION','GENEALOGY','GRAPHIC','HOLIDAY','INSPRATION','KANSAS','LARGEPRINT','MAP','MYSTERY','NEW','NONFICTION','DISPLAY','OVERSIZE','PAPERBACK','PARENTING','EASY','PROFCOLL','ROMANCE','SF-FANT','SPANISH','WALKIN','WESTERN') GROUP BY items.homebranch



