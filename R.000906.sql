/*
R.000906

----------

Name: Item with both waiting and in transit status
Created by: -

----------

Group: Administrative Reports
     Holds-admin

Created on: 2010-08-20 14:15:54
Modified on: 2013-06-18 18:25:42
Date last run: 2019-03-05 11:40:59

----------

Public: 0
Expiry: 0

----------



----------
*/

select biblio.title, branchtransfers.itemnumber, datesent, frombranch, datearrived, tobranch, comments from branchtransfers, items, biblio, reserves where branchtransfers.itemnumber = items.itemnumber and items.biblionumber = biblio.biblionumber and branchtransfers.itemnumber = reserves.itemnumber and datearrived is NULL and reserves.waitingdate is not null and reserves.found = 'w' order by branchtransfers.itemnumber


