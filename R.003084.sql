/*
R.003084

----------

Name: GHW - Priority Holds Report
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-06-18 11:15:38
Modified on: 2019-08-16 15:53:25
Date last run: 2021-07-02 16:17:10

----------

Public: 0
Expiry: 300

----------

<div id=reportinfo class="noPrint">
<p>Print holds queue report with scannable barcodes and divided into priorities.</p>
<ul><li>Shows items in the current holds queue</li>
<li>at the location you specify</li>
<li>grouped by specified location, items home branch, call number, author, and title</li>
<li>sorted by request priority and standard NEXT classification.</li>
<li>contains links to the bibliographic records</li>
</ul><br />
<p></p>
<p><a href="/cgi-bin/koha/reports/guided_reports.pl?reports=3084&phase=Run%20this%20report"  target="_blank">Click here to run in a new window</a></p>
</div>

----------
*/

SELECT
  Concat_Ws('<br />', tmp_holdsqueue.holdingbranch, items.homebranch, (Concat('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=', biblio.biblionumber, '\" target="_blank">Go to biblio</a>')), "<br />", If(priority_one.homebranch IS NOT NULL, "<span style='background-color: #FF4500'>TOP PRIORITY</span>", If(priority_two.Count_itemnumber = 1, "<span style='background-color: #FFFF00;'>ONLY COPY</span>", If(priority_three.Count_itemnumber = 1, "<span style='background-color: #FFFF00;'>Only available copy</span>", "Many available copies")))) AS CURRENT_OWNING,
  Concat_Ws('<br />', items.location, authorised_values.lib, items.itemcallnumber, items.copynumber, Concat('<br />(',items.dateaccessioned, ')')) AS CALL_NUMBER,
  Concat_Ws('<br />', biblio.author, (Concat_Ws('<br />', biblio.title, ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="b"]'), ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="p"]'), ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="n"]')))) AS AUTHOR_TITLE,
  Concat_Ws('<br />', (Concat('<img src="/cgi-bin/koha/svc/barcode?barcode=', '*', Upper(items.barcode), '*', '&type=Code39"></img>')), items.barcode) AS BARCODE
FROM
  biblio
  LEFT JOIN (items
  LEFT JOIN biblio_metadata ON items.biblionumber = biblio_metadata.biblionumber) ON biblio.biblionumber =
    biblio_metadata.biblionumber
  LEFT JOIN authorised_values ON items.ccode = authorised_values.authorised_value
  RIGHT JOIN tmp_holdsqueue ON tmp_holdsqueue.itemnumber = items.itemnumber
  LEFT JOIN (SELECT
        items.itemnumber,
        items.homebranch
      FROM
        items
      GROUP BY
        items.itemnumber) priority_one ON items.itemnumber = priority_one.itemnumber AND tmp_holdsqueue.pickbranch =
    priority_one.homebranch
  JOIN (SELECT
        items.biblionumber,
        Count(DISTINCT items.itemnumber) AS Count_itemnumber
      FROM
        items
      GROUP BY
        items.biblionumber) priority_two ON biblio.biblionumber = priority_two.biblionumber
  JOIN (SELECT
        items.biblionumber,
        Count(DISTINCT items.itemnumber) AS Count_itemnumber,
        items.notforloan,
        items.damaged,
        items.itemlost,
        items.withdrawn,
        items.onloan
      FROM
        items
      WHERE
        (items.notforloan IS NULL OR
          items.notforloan = 0) AND
        (items.damaged IS NULL OR
          items.damaged = 0) AND
        (items.itemlost IS NULL OR
          items.itemlost = 0) AND
        (items.withdrawn IS NULL OR
          items.withdrawn = 0) AND
        (items.onloan IS NULL OR
          items.onloan = 0)
      GROUP BY
        items.biblionumber) priority_three ON biblio.biblionumber = priority_three.biblionumber
WHERE
  authorised_values.category = "ccode" AND
  tmp_holdsqueue.holdingbranch LIKE <<Choose your library|ZBRAN>>
GROUP BY
  tmp_holdsqueue.biblionumber,
  tmp_holdsqueue.itemnumber
ORDER BY
  If(priority_one.homebranch IS NOT NULL, "1", If(priority_two.Count_itemnumber = 1, "2", If(priority_three.Count_itemnumber = 1, "2", "4"))),
  Concat_Ws('<br />', items.location, authorised_values.lib, items.itemcallnumber),
  authorised_values.category,
  biblio.author,
  biblio.title



