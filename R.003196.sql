/*
R.003196

----------

Name: 4.16
Created by: HOLTON TECH

----------

Group: -
     -

Created on: 2019-04-16 09:42:26
Modified on: 2019-04-17 08:50:54
Date last run: 2019-04-17 08:37:36

----------

Public: 0
Expiry: 300

----------

I'm not sure what you're expecting this to do, but it's probably not going to do it.  Please let me know if you need help at nexthelp@nekls.org.  George

----------
*/

SELECT  items.dateaccessioned,items.datelastborrowed,items.stack,items.itemcallnumber FROM borrowers LEFT JOIN statistics on (statistics.borrowernumber=borrowers.borrowernumber) LEFT JOIN items on (items.itemnumber = statistics.itemnumber) LEFT JOIN biblioitems on (biblioitems.biblioitemnumber = items.biblioitemnumber)  



