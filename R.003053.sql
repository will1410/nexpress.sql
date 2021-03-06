/*
R.003053

----------

Name: GHW - Videos with links
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-03-02 08:49:22
Modified on: 2018-08-28 21:21:30
Date last run: 2018-11-24 22:15:05

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT
  biblio.timestamp,
  Concat(biblio.title, " ", ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code>="b"]')) AS TITLE,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag=130]/subfield[@code="a"]') AS UNTITLE_OA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag=730]/subfield[@code="a"]') AS UNTITLE_SA,
  Concat('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=', biblio.biblionumber, '\" target="_blank">LINK</a>') AS LINK_TO_BIBLIO,
  Concat('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=kw&q=', biblio.title, '&op=and&idx=kw&op=and&idx=kw&limit=mc-itype%2Cphr%3ALOCALHOLD1&limit=mc-itype%2Cphr%3AMEDIA&limit=mc-itype%2Cphr%3ANEWMEDIA&limit=mc-itype%2Cphr%3AWALKIN1&sort_by=relevance" target="_blank">video</a>') AS VIDEO_SEARCH,
  Concat("<a href='https://www.youtube.com/results?search_query=official+trailer+", Replace(SubString_Index(biblio.title, "(", 1), " ", "+"), "' target='_blank'>Youtube</a>") AS YOUTUBE,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="856"]/subfield[@code>="u"]') AS EIGHTFIVESIX
FROM
  biblio
  JOIN biblio_metadata ON biblio_metadata.biblionumber = biblio.biblionumber
  JOIN items ON items.biblionumber = biblio.biblionumber
WHERE
  (items.itype = 'LOCALHOLD1' OR
    items.itype = 'MEDIA' OR
    items.itype = 'NEWMEDIA' OR
    items.itype = 'WALKIN1')
GROUP BY
  biblio.biblionumber
ORDER BY
  biblio.biblionumber DESC



