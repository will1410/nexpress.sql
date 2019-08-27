/*
R.000610

----------

Name: Branchcodes and Branchnames
Created by: NEKLS Administrator

----------

Group: Administrative Reports
     System-admin

Created on: 2009-06-24 16:26:50
Modified on: 2017-12-18 21:33:47
Date last run: 2017-12-18 21:34:17

----------

Public: 0
Expiry: 0

----------

Simple table showing branch names and branchcode

----------
*/

SELECT branches.branchname,
  branches.branchcode 
FROM branches 
ORDER BY branchname ASC



