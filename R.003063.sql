/*
R.003063

----------

Name: GHW - Print list by ID number
Created by: George H Williams

----------

Group: Lists Module
     -

Created on: 2018-03-12 22:34:32
Modified on: 2019-07-17 17:25:31
Date last run: 2019-07-17 17:25:05

----------

Public: 0
Expiry: 300

----------

<div id=reportinfo>
<p>Shows only the Tile/Author information for titles on a list</p>
<ul><li>Shows titles that are currently on the list</li>
<li>grouped by biblionumber</li>
<li>sorted by author and title</li>
</ul><br />
<p><ins>Notes:</ins></p>
<p></p>
<p>To print, use the web browser's print functions.</p>
<p></p>
<p>&nbsp;</p>
<p><span style="background-color: darkred; color: white">Scheduled for deletion on August 31, 2019</p>
<p><span style="background-color: black; color: white">Is being replaced by report 3226</p>
<p>&nbsp;</p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=3063&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  Concat("<span style='font-size: 125%;'><span style='float: left'><ins>Title:</ins> ", Coalesce(biblio.title, '--'), "</span><span style='float: right'><ins>Author:</ins> ", Coalesce(biblio.author, '--'), "</span></span>") AS TITLE_AUTHOR
FROM
  virtualshelfcontents
  LEFT JOIN biblio ON virtualshelfcontents.biblionumber = biblio.biblionumber
WHERE
  virtualshelfcontents.shelfnumber = <<Enter list ID number>>
GROUP BY
  biblio.biblionumber
ORDER BY
  biblio.author,
  biblio.title


