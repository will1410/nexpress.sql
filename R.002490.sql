/*
R.002490

----------

Name: Fines paid on a specific date or date range
Created by: Heather Braum

----------

Group: Circulation
     Charges

Created on: 2015-04-14 17:04:30
Modified on: 2015-04-14 17:10:38
Date last run: 2019-06-24 18:13:13

----------

Public: 0
Expiry: 0

----------

Set the date range (for a single date, put that date in twice) and choose your branch. Will return cardnumber and link to a patron's fines page, amount  paid and date paid. 

----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/members/boraccount.pl?borrowernumber=',borrowers.borrowernumber,'\" target="_blank">',borrowers.cardnumber,'</a>') AS "Link to Fines", round(accountlines.amount,2) AS 'Fines Paid', accountlines.date FROM accountlines LEFT JOIN borrowers USING(borrowernumber) WHERE accounttype = 'pay' AND date BETWEEN <<Between (YYYY-MM-DD)>> AND <<and (YYYY-MM-DD>> AND borrowers.branchcode=<<choose branch|branches>> ORDER BY date ASC




