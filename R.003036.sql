/*
R.003036

----------

Name: Issuing rules
Created by: Bywater bwssupport

----------

Group: -
     -

Created on: 2018-01-11 21:17:37
Modified on: 2018-01-11 21:21:28
Date last run: 2018-09-19 19:59:01

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT 
            issuingrules.branchcode,
            issuingrules.*,
            itemtypes.description AS humanitemtype,
            categories.description AS humancategorycode,
            COALESCE( localization.translation, itemtypes.description ) AS translated_description
    FROM issuingrules
    LEFT JOIN itemtypes
        ON (itemtypes.itemtype = issuingrules.itemtype)
    LEFT JOIN categories
        ON (categories.categorycode = issuingrules.categorycode)
    LEFT JOIN localization ON issuingrules.itemtype = localization.code
        AND localization.entity = 'itemtypes'
        AND localization.lang = 'EN'
ORDER BY issuingrules.branchcode



