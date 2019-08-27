/*
R.002582

----------

Name: Reports without new date authorised values 
Created by: Heather Braum

----------

Group: Administrative Reports
     Reports-admin

Created on: 2015-08-22 13:48:26
Modified on: 2015-08-22 14:49:29
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT * FROM saved_sql WHERE (savedsql NOT LIKE '<%|Year%' OR savedsql NOT LIKE '%<%|Month%>%' OR savedsql NOT LIKE '%<%|date%>%') AND (savedsql LIKE '%<%year%>%'  OR savedsql LIKE '%<%month%>%'  OR savedsql LIKE '%<%day%>%' OR savedsql LIKE '%<%date%>%')



