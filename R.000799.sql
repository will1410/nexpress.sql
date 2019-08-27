/*
R.000799

----------

Name: Titles of intra consortial ILLs for the Prior Month
Created by: NEKLS Administrator

----------

Group: Acquisitions
     Collection Development

Created on: 2010-01-26 14:52:22
Modified on: 2018-07-02 09:44:36
Date last run: 2019-08-07 18:45:07

----------

Public: 0
Expiry: 0

----------

Enhanced - Pick your Branch, run and get a list of items checked out at your branch that belonged to another library.  Useful for Collection DEVELOPMENT.   

<p><span style="background-color: green; color: white">Has potential</p>

<p><span style="background-color: darkred; color: white">virtually line by line identical to report 684 - merge two to make one report</p>

<p>group/sort/organize by classification order / link to deleteditsms/biblios</p>

----------
*/

SELECT
  statistics.branch AS Library,
  biblio.title,
  biblio.author,
  items.itemcallnumber,
  items.itype,
  items.ccode,
  items.location,
  items.homebranch AS ItemBranch,
  statistics.itemtype
FROM
  statistics
  LEFT JOIN items ON statistics.itemnumber = items.itemnumber
  LEFT JOIN biblio ON items.biblionumber = biblio.biblionumber
WHERE
  statistics.branch != items.homebranch AND
  statistics.type IN ('issue', 'renew') AND
  Month(statistics.datetime) = <<Month>> AND
  Year(statistics.datetime) = <<Year>> AND
  statistics.branch = <<Pick your branch|branches>>
ORDER BY
  Library,
  biblio.title


