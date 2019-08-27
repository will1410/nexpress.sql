/*
R.003158

----------

Name: GHW - Self to series
Created by: George H Williams

----------

Group: -
     -

Created on: 2019-01-25 18:16:57
Modified on: 2019-01-25 18:16:57
Date last run: 2019-07-23 17:40:10

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT
  virtualshelfcontents.shelfnumber,
  virtualshelfcontents.biblionumber,
  biblio.author,
  biblio.title,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]//subfield[@code="a"]') AS TITLEA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]//subfield[@code="h"]') AS TITLEH,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]//subfield[@code="n"]') AS TITLEN,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]//subfield[@code="p"]') AS TITLEP,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]//subfield[@code="b"]') AS TITLEB,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]//subfield[@code="c"]') AS TITLEC,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="100"]//subfield[@code="a"]') AS AUTHORXA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="100"]//subfield[@code="d"]') AS AUTHORXDATED,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="100"]//subfield[@code="9"]') AS AUTHORXAUTHORITY9,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="100"]//subfield[@code="e"]') AS AUTHORXRTERM,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="100"]//subfield[@code="4"]') AS AUTHORXRCODE,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="700"]//subfield[@code="a"]') AS ADDAUTHORXA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="700"]//subfield[@code="d"]') AS ADDAUTHORXDATED,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="700"]//subfield[@code="E"]') AS ADDAUTHORRELATORE,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="700"]//subfield[@code="4"]') AS ADDAUTHORXRELATRCODE,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="490"]//subfield[@code="a"]') AS SERIESFOURA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="490"]//subfield[@code="v"]') AS SERIESFOURV,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="800"]//subfield[@code="a"]') AS SERIESAUTHORA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="800"]//subfield[@code="d"]') AS SERIESDATED,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="800"]//subfield[@code="9"]') AS SERIESAUTHORITY9,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="800"]//subfield[@code="t"]') AS SERIESTITLET,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="690"]//subfield[@code="a"]') AS LOCALA,
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="690"]//subfield[@code="z"]') AS LOCALZ
FROM
  virtualshelfcontents
  INNER JOIN biblio ON virtualshelfcontents.biblionumber = biblio.biblionumber
  INNER JOIN biblio_metadata ON biblio_metadata.biblionumber = biblio.biblionumber
WHERE
  virtualshelfcontents.shelfnumber = <<Enter list id>>
GROUP BY
  virtualshelfcontents.biblionumber
ORDER BY
  SERIESFOURA,
  SERIESFOURV



