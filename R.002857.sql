/*
R.002857

----------

Name: GHW - TEST of 350 replacement
Created by: George H Williams

----------

Group: Administrative Reports
     Testing

Created on: 2016-12-15 16:04:31
Modified on: 2016-12-15 16:13:58
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT
  Concat('<a href=\"/cgi-bin/koha/circ/circulation.pl?borrowernumber=',  borrowers.borrowernumber, '\" target="_blank">', borrowers.borrowernumber, '</a>') AS 'Link to borrower',
  borrowers.firstname,
  borrowers.surname,
  borrowers.address,
  borrowers.address2,
  borrowers.city,
  borrowers.state,
  borrowers.zipcode,
  items.itemcallnumber,
  biblio.author,
  biblio.title,
  (To_Days(CurDate()) - To_Days(issues.date_due)) AS DAYS_OVERDUE,
  items.replacementprice
FROM
  borrowers JOIN
  issues
    ON borrowers.borrowernumber = issues.borrowernumber JOIN
  items
    ON issues.itemnumber = items.itemnumber JOIN
  biblio
    ON items.biblionumber = biblio.biblionumber JOIN
  biblioitems
    ON biblio.biblionumber = biblioitems.biblionumber
WHERE
  (To_Days(CurDate()) - To_Days(issues.date_due)) > <<Enter number of days overdue>> AND
  issues.branchcode LIKE <<Enter check-out branch|ZBRAN>>
ORDER BY
  borrowers.surname,
  issues.date_due



