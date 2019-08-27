/*
R.003122

----------

Name: GHW - SANDBOX - ADMINREPORT
Created by: George H Williams

----------

Group: -
     -

Created on: 2018-09-18 15:36:28
Modified on: 2018-09-18 15:36:28
Date last run: 2018-09-18 15:36:30

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT
  items.biblionumber,
  items.itemnumber,
  items.barcode,
  items.homebranch,
  Concat(itemtypes.description, " (", items.itype, ")") AS ITYPE,
  ccodes.lib AS CCODE,
  items.itemcallnumber,
  biblio.author,
  Concat_Ws(" ", biblio.title, ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="n"]'),
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="p"]'),
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="h"]'),
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="b"]'),
  ExtractValue(biblio_metadata.metadata, '//datafield[@tag="245"]/subfield[@code="c"]')) AS FULL_TITLE,
  biblioitems.publicationyear
FROM
  biblio
  JOIN biblio_metadata ON biblio_metadata.biblionumber = biblio.biblionumber
  JOIN items ON items.biblionumber = biblio.biblionumber
  LEFT JOIN (SELECT
        authorised_values.category,
        authorised_values.authorised_value,
        authorised_values.lib
      FROM
        authorised_values
      WHERE
        authorised_values.category = 'CCODE'
      GROUP BY
        authorised_values.category,
        authorised_values.authorised_value,
        authorised_values.lib) ccodes ON items.ccode = ccodes.authorised_value
  JOIN biblioitems ON biblioitems.biblionumber = biblio.biblionumber AND
    items.biblioitemnumber = biblioitems.biblioitemnumber
  LEFT JOIN itemtypes ON items.itype = itemtypes.itemtype
GROUP BY
  items.itemnumber,
  biblioitems.publicationyear,
  biblio.biblionumber,
  itemtypes.description
ORDER BY
  items.homebranch,
  items.itype,
  CCODE,
  items.itemcallnumber,
  biblio.author,
  FULL_TITLE


