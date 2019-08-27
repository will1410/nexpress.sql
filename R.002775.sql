/*
R.002775

----------

Name: TEST
Created by: George H Williams

----------

Group: Administrative Reports
     Reports Testing Ground

Created on: 2016-09-15 15:22:07
Modified on: 2016-09-15 15:22:07
Date last run: -

----------

Public: 0
Expiry: 300

----------



----------
*/

SELECT @1:="Adult Fiction (F %)" AS "Collection Group", count(*) AS "Circ", (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'F %') AS "Total Items" FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'F %')


UNION


SELECT @1:="Adult Nonfiction 000s (0%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '0%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '0%')


UNION


SELECT @1:="Adult Nonfiction 100s (1%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '1%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '1%')


UNION


SELECT @1:="Adult Nonfiction 200s (2%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '2%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '2%')


UNION


SELECT @1:="Adult Nonfiction 300s (3%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '3%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '3%')


UNION


SELECT @1:="Adult Nonfiction 400s (4%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '4%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '4%')


UNION


SELECT @1:="Adult Nonfiction 500s (5%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '5%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '5%')


UNION


SELECT @1:="Adult Nonfiction 600s (6%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '6%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '6%')


UNION


SELECT @1:="Adult Nonfiction 700s (7%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '7%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '7%')


UNION


SELECT @1:="Adult Nonfiction 800s (8%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '8%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '8%')


UNION


SELECT @1:="Adult Nonfiction 900s (9%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '9%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE '9%') 


UNION


SELECT @1:="Adult Biography (B%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'B%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'B%')


UNION


SELECT @1:="Adult Large Print Fiction (LP F%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'LP F%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'LP F%')


UNION


SELECT @1:="Adult Graphic Novel Fiction (GN F%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN F%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN F%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 000s (GN 0%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 0%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 0%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 100s (GN 1%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 1%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 1%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 200s (GN 2%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 2%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 2%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 300s (GN 3%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 3%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 3%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 400s (GN 4%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 4%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 4%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 500s (GN 5%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 5%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 5%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 600s (GN 6%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 6%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 6%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 700s (GN 7%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 7%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 7%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 800s (GN 8%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 8%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 8%')


UNION


SELECT @1:="Adult Graphic Novel Nonfiction 900s (GN 9%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 9%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'GN 9%')


UNION


SELECT @1:="Adult Paperbacks (pbk%)", count(*), (SELECT count(itemnumber) FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'pbk%') FROM statistics s WHERE month(s.datetime)='01' AND year(s.datetime)='2014' AND s.branch='BASEHOR' AND s.type IN ('issue','renew') AND s.itemnumber IN (SELECT itemnumber FROM items WHERE homebranch='BASEHOR' AND itemcallnumber LIKE 'pbk%')



