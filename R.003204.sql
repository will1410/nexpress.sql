/*
R.003204

----------

Name: tongie res
Created by: TONGANOXIE TECH

----------

Group: -
     -

Created on: 2019-05-13 10:04:24
Modified on: 2019-05-13 22:55:57
Date last run: 2019-05-13 22:50:15

----------

Public: 0
Expiry: 1

----------

Please contact the NEKLS office to ask for help with this report.  As originally written, this report has the potential to overload the server and shut down the catalog.



SELECT sum(borrowers.zipcode),sum(borrowers.city),sum(borrowers.cardnumber), borrowers.zipcode,borrowers.city,borrowers.cardnumber FROM borrowers LEFT JOIN statistics on (statistics.borrowernumber=borrowers.borrowernumber) LEFT JOIN items on (items.itemnumber = statistics.itemnumber) LEFT JOIN biblioitems on (biblioitems.biblioitemnumber = items.biblioitemnumber)  GROUP BY borrowers.zipcode,borrowers.city,borrowers.cardnumber

----------
*/

SELECT
  branches.branchcode
FROM branches


