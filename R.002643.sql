/*
R.002643

----------

Name: bywater ticket 31213: Letter table problems
Created by: Bywater bwssupport

----------

Group: -
     -

Created on: 2015-12-11 13:59:59
Modified on: 2015-12-11 14:14:47
Date last run: 2018-04-20 09:56:05

----------

Public: 0
Expiry: 0

----------



----------
*/

select module, code, branchcode, message_transport_type, name, is_html, title, content from letter order by  code, branchcode, message_transport_type



