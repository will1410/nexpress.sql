/*
R.001945

----------

Name: Single Record -- MARC field size
Created by: Heather Braum

----------

Group: Administrative Reports
     System-admin

Created on: 2013-07-17 16:29:35
Modified on: 2017-12-18 15:38:15
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT LENGTH(metadata) FROM biblio_metadata WHERE biblionumber=<<enter biblionumber>>



