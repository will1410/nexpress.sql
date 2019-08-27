/*
R.002699

----------

Name: fixing 264/0c
Created by: Heather Braum

----------

Group: Administrative Reports
     Fix Bib Records-admin

Created on: 2016-06-17 15:51:28
Modified on: 2017-12-19 09:29:36
Date last run: 2018-07-02 20:27:43

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT('<a href=\"/cgi-bin/koha/cataloguing/addbiblio.pl?biblionumber=',biblionumber,'&op=#tab2XX\" target="_blank">',biblionumber,'</a>') as bibnumber, ExtractValue(metadata, '//datafield[@tag="264"]/subfield[@code="c"]') as 264c, ExtractValue(metadata, '//datafield[@tag="260"]/subfield[@code="c"]') as 260c  from biblio_metadata 
where ExtractValue(metadata, '//datafield[@tag="264"]/subfield[@code="c"]') REGEXP '[ABDEFGHIJKLMNOQRSTUVWXYZ]' OR ExtractValue(metadata, '//datafield[@tag="260"]/subfield[@code="c"]') REGEXP '[ABDEFGHIJKLMNOQRSTUVWXYZ]' LIMIT 2000



