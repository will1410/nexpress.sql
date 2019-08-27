/*
R.002810

----------

Name: GHW - Public lists with items
Created by: George H Williams

----------

Group: Lists Module
     -

Created on: 2016-10-18 09:58:19
Modified on: 2019-07-17 16:33:23
Date last run: 2019-07-17 16:30:16

----------

Public: 0
Expiry: 0

----------

<div id=reportinfo>
<p>Generates a list of public lists with a title that contains a specified phrase</p>
<ul><li>Shows items that are currently on the specified list</li>
<li>shows all lists in NExpress</li>
<li>grouped and sorted by list name, author and title</li>
<li>contains links to the lists and links to the titles on the lists</li>
</ul><br />
<p>&nbsp;</p>
<p><span style="background-color: darkred; color: white">Scheduled for deletion on August 31, 2019</p>
<p><span style="background-color: black; color: white">Is being replaced by report 3223, 3224, 3225</p>
<p>&nbsp;</p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=2810&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  CONCAT( '<a href=\"/cgi-bin/koha/virtualshelves/shelves.pl?op=view&shelfnumber=', virtualshelves.shelfnumber,'\" target="_blank">Link to list</a>' ) AS LINK_TO_LIST,
  virtualshelves.shelfname AS LIST_NAME,
  biblio.author AS AUTHOR,
  biblio.title as BRIEF_TITLE,
  Count(items.itemnumber) AS COUNT_OF_ITEMS,
  CONCAT( '<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=', biblio.biblionumber,'\" target="_blank">Link to title</a>' ) AS LINK_TO_TITLE
FROM
  virtualshelves LEFT JOIN
  virtualshelfcontents
    ON virtualshelfcontents.shelfnumber = virtualshelves.shelfnumber LEFT JOIN
  biblio
    ON virtualshelfcontents.biblionumber = biblio.biblionumber LEFT JOIN
  items
    ON items.biblionumber = biblio.biblionumber
WHERE
  virtualshelves.category = '2' AND
  virtualshelves.shelfname LIKE concat('%',<<Enter a list name search phrase>>, '%')
GROUP BY
  virtualshelves.shelfname,
  biblio.author,
  biblio.title


