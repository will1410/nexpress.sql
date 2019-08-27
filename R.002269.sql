/*
R.002269

----------

Name: Not sure? 
Created by: Heather Braum

----------

Group: -
     -

Created on: 2014-06-02 13:39:23
Modified on: 2014-08-09 00:26:59
Date last run: 2017-11-06 15:28:41

----------

Public: 0
Expiry: 0

----------



----------
*/

SELECT CONCAT ('<a href=\"/cgi-bin/koha/catalogue/detail.pl?biblionumber=',i.biblionumber,'\" target="_blank">'"record"'</a>') AS "Link to Record", CONCAT('<a href=\"/cgi-bin/koha/catalogue/search.pl?idx=ti&q=',b.title,'&sort_by=title_az\" target="_blank">',b.title,'</a>') AS "Title Search" FROM biblio b JOIN items i USING(biblionumber) LEFT JOIN biblioitems t USING(biblionumber) WHERE b.biblionumber IN ('145502','505047','518966','519789','521751','521754','521756','522653','522658','522660','522662','531945','575293','575571','575646','575896','575902','576030','576031','576228','576338','576355','576372','576604','576608','576782','576789','576863','576864','576865','576866','577004','577099','577309','577466','577467','577468','577469','577470','577471','577472','577473','577616','577692','577697','577841','577842','577846','577859','577860','577861','577925','578022','578047','578314','578320','578339','578358','578369','578370','578371','578372','578478','578564','578791','578826','578918','578937','578938','578958','578959','578960','578961','578966','578987','578988','578990','578994','578995','579053','579054','579055','579056','579057','579070','579071','579072','579074','579075','579079','579085','579093','579094','579095','579104','579105','579327','579328','579329','579330','579331','579332','579581','579595','580080','580139','580140','580172','580276','580300','580301','580460','580462','580477','580652','580712','580719','580810','580896','580905','580922','580959','581001','581034','581035','581046','581049','581121','581122','581123','581124','581140','581141','581142','581356','581396','581397','581431','581432','581526','581567','581568','581569','581570','581575','581910','581913','581974','582069','582150','582220','582345','582542','582561','582562','582563','582564','582565','582573','582649','582665','582878','582946','582977','582978','583046','583104','583139','583178','583186','583192','583200','583205','583400','583401','583402','583403','583404','583405','583406','583465','583471','583484','583485','583486','583487','583520','583658','583659','583739','583827','583874','583875','583876','583877','583878','583879','583880','583881','583882','583883','583884','583885','583911','583924','583933','583934','584017','584118','584216','584320','584321','584512','584689','584715','584829','584834','584996','585006','585037','585039','585040','585107','585108','585141','585164','585190','585199','585235','585236','585237','585238','585239','585240','585241','585242','585243','585244','585317','585424','585433','585441','585488','585489','585520','585549','585550','585566','585588','585749','585751','585756','585759','585760','585761','585762','585767','585768','585774','585777','585780','585874','586059','586068','586069','586070','586098','586099','586145','586149','586337','586338','586347','586349','586381','586408','586412','586413','586414','586415','586416','586417','586418','586512','586566','586582','586583','586584','586585','586586','586587','586588','586589','586590','586591','586592','586593','586594','586595','586596','586598','586599','586600','586602','586610','586658','586663','586669','586671','586673','586735','586736','586737','586738','586739','586740','586743','586744','586804','586883','586893','586894','586899','586936','586939','586940','586945','586946','586949','586950','586952','586954','586962','587178','587179','587180','587181','587186','587311','587312','587313','587315','587316','587380','587704','587705','587707','587708','587709','587890','587916','588105','588151','588157','588159','588270','588271','588272','588273','588274','588275','588276','588278','588357','588374','588391','588444','588450','588459','588492','588566','588576','588589','588590','588592','588593','588594','588596','588598','588602','588667','588671','588698','588792','588808','588817','588883','588884','588886','588915','588916','588917','588918','588920','588922','588997','589040','589042','589043','589044','589055','589056','589057','589062','589063','589064','589065','589066','589098','589102','589128','589131','589135','589167','589170','589207','589328','589335','589340','589392','589474','589476','589487','589489','589507','589641','589761','589767','589894','589895','589931','589936','589939','589992','589999','590050','590071','590330','590331','590332','590333','590334','590335','590354','590355','590470','590512','590556','590557','590577','590603','590604','590717','590725','590731','590849','591066','591073','591074','591075','591076','591077','591078','591079','591080','591081','591082','591087','591114','591115','591159','591780','591832','592032','592157','592165','592181','592235','592237','592238','592239','592240','592338','592339','592340','592481','592484','592666','592679','593003','593046','593048','593061','593144','593238','593477','593641','593645','593647','593648','593651','593759','593853','594101','594166','594167','594170','594265','594456','594467','594489','594511','594512','594513','594554','594555','594681','594689','594735','594779','594780','594800','594816','594894','594903','594942','594943','594945','594949','594950','595221','595243','595372','595386','595423','595424','595426','595428','595429','595430','595441','595442','595443','595454','595455','595521','595566','595833','595854','595947','595948','595951','595953','595978','595983','595987','595992','596107','596171','596186','596192','596305','596362','596401','596411','596418','596661','596717','596750','596760','596784','596785','596797','596842','596845','596928','596931','596932','596966','597031','597069','597154','597263','597264','597266','597271','597277','597345','597346','597437','597440','597442','597459','597522','597563','597610','597611','597612','597613','597614','597751','597753','597781','597882','598044','598059','598234','598235','598236','598237','598270','598309','598335','598429','598433','598435','598437','598594','598602','598603','598604','598605','598943','599037','599038','599039','599045','599058','599072','599073','599074','599090','620451','620468','620469','620493','620494','620496','620571','620607','620642','620700','620701','620868','620909','620933','620937','620938','621004','621005','621023','621402','621405','621407','621599','621600','621744','621745','621746','621946','621999','622002','622003','622005','622038','622061','622062','622107','622181','622235','622240','622262','622270','622356','622358','622362','622363','622368','622373','622392','622397','622405','622488','622632','622633','622634','622638','622639','622640','622641','622642','622643','622644','622645','622646','622647','622648','622649','622650','622652','622653','622654','622655','622656','622659','622660','622661','622662','622700','622778','622871','622934','622935','622939','622958','623067','623068','623069','623071','623072','623073','623074','623095','623252','623258','623297','623321','623346','623390','623600','623709','623710','623740','623781','623913','623987','624038','624046','624163','624296','624397','624404','624408','624412','624416','624418','624421','624491','624493','624494','624495','624496','624513','624523','624597','624639','624703','624717','624718','624720','624858','624860','624890','624977','624978','624991','625015','625022','625031','625080','625116','625117','625460','625476','625501','625553','625568','625591','625655','625719','625794','625795','625796','625799','625842','625846','625847','625939','625944','625949','625952','625962','625966','626010','626037','626069','626118','626307','626406','626426','626435','626436','626501','626623','626624','626625','626627','626710','626789','626792','626794','626954','627053','627069','627080','627136','627139','627150','627164','627167','627173','627196','627220','627222','627225','627226','627228','627229','627230','627430','627488','627489','627512','627541','627639','627645','627652','627654','627656','627659','627680','627685','627686','627687','627689','627728','627788','627789','627790','627983','627985','627986','627987','627989','627991','628005','628039','628053','628069','628149','628298','628309','628310','628351','628374','628379','628661','628712','628851','628860','628874','628924','629058','629085','629088','629093','629109','629111','629178','629185','629190','629194','629218','629220','629222','629235','629247','629266','629275','629283','629364','629403','629446','629447','629449','629454','629612','629699','629700','629708','629713','629732','629765','629767','629784','629785','629786','629855','629966','629978','629987','630003','630004','630051','630221','630294','630396','630411','630535','630549','630583','630595','630600','630623','630626','630822','630861','630970','630971','631028','631039','631054','631121','631152','631192','631216','631040') AND (b.timestamp < '2014-06-03' OR t.timestamp < '2014-06-03') AND i.ccode='LARGEPRINT' GROUP BY b.biblionumber



