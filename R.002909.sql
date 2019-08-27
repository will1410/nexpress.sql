/*
R.002909

----------

Name: GHW - Duplicate borrowers at a library
Created by: George H Williams

----------

Group: -
     -

Created on: 2017-02-20 16:37:40
Modified on: 2019-07-23 10:03:51
Date last run: 2019-08-02 10:57:06

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>Report of possible duplicate borrowers at a library</p>
<ul><li>Shows patrons currently in the database</li>
<li>with at least one library account at the library you specify</li>
<li>grouped and sorted by last name/first name</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>Updated on 2019.07.22 to filter out middle names - now matches on last name and first name when those two names are spelled exactly.  Ignores everything after the first space between name/initial strings in the borrowers.firstname field.</p>
<p></p>
<p>Report created by George Williams.</p>
<p></p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=2909&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>


----------
*/

SELECT
  surname,
  firstname,
  GROUP_CONCAT(CONCAT(surname, '-', firstname) ORDER BY borrowernumber SEPARATOR '<br />'),
  GROUP_CONCAT(cardnumber ORDER BY borrowernumber SEPARATOR '<br />') as CARD_NUMBER,
  GROUP_CONCAT(dateofbirth ORDER BY borrowernumber SEPARATOR '<br />') as BIRTH_DATE,
  GROUP_CONCAT((Concat('<a href=\"/cgi-bin/koha/members/moremember.pl?borrowernumber=', borrowernumber, '\" target="_blank">', borrowernumber, '</a>')) ORDER BY borrowernumber SEPARATOR '<br />') as BORROWER_NUMBER,
  GROUP_CONCAT(branchcode ORDER BY borrowernumber SEPARATOR '<br />') as HOME_BRANCH,
  GROUP_CONCAT(Concat(borrowers.borrowernumber, ' // ', borrowers.debarredcomment) ORDER BY borrowernumber SEPARATOR '<br />') AS COMMENTS
FROM borrowers
GROUP BY
  CONCAT(TRIM(surname),'-',TRIM(SUBSTRING_INDEX(firstname, ' ', 1)),'/')
HAVING
  COUNT(CONCAT(TRIM(surname),'-',TRIM(SUBSTRING_INDEX(firstname, ' ', 1)),'/'))>1 AND
  HOME_BRANCH LIKE CONCAT( '%', <<Select one branch|branches>>, '%')



