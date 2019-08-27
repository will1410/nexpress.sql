/*
R.001935

----------

Name: Framework subfield structure
Created by: Heather Braum

----------

Group: Administrative Reports
     System-admin

Created on: 2013-07-12 10:44:59
Modified on: 2013-07-12 11:07:42
Date last run: -

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT s.frameworkcode, t.tagfield, t.liblibrarian, s.tagsubfield, s.liblibrarian, t.repeatable, s.repeatable, t.mandatory, s.mandatory, s.kohafield, s.tab, s.authorised_value, s.authtypecode, s.value_builder, s.isurl, s.hidden FROM marc_tag_structure t LEFT JOIN marc_subfield_structure s USING(tagfield)



