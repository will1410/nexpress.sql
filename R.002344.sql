/*
R.002344

----------

Name: Standard number searching
Created by: Heather Braum

----------

Group: Administrative Reports
     Duplicate Records-admin

Created on: 2014-08-26 22:55:56
Modified on: 2017-12-18 15:40:34
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT biblionumber, ExtractValue(metadata, '//datafield[@tag="024"]/subfield[@code="a"]') as standard_number FROM biblio_metadata


