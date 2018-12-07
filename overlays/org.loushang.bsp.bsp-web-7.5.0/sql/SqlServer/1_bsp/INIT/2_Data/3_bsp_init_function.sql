INSERT INTO PUB_APPS (APP_CODE,APP_NAME,TRANSPORT,SERVER_HOST,PORT,CONTEXT,URI,SEQ,NOTE) VALUES ('-1',		'系统默认',			'',			'',		'',	'',		'',	0,	'');
----------------------------功能权限开始--------------------------------------------------------
------模块--
INSERT INTO PUB_MODULES (MODULE_CODE,MODULE_NAME,PARENT_MODULE_CODE,IS_LEAF_MODULE,APP_CODE,MODULE_PATH,MODULE_PATH_NAME,SEQ) VALUES ('BSP00010','组织结构管理','-1','1','-1','BSP00010','组织结构管理',0);
INSERT INTO PUB_MODULES (MODULE_CODE,MODULE_NAME,PARENT_MODULE_CODE,IS_LEAF_MODULE,APP_CODE,MODULE_PATH,MODULE_PATH_NAME,SEQ) VALUES ('BSP00011','安全管理','-1','1','-1','BSP00011','安全管理',1);
INSERT INTO PUB_MODULES (MODULE_CODE,MODULE_NAME,PARENT_MODULE_CODE,IS_LEAF_MODULE,APP_CODE,MODULE_PATH,MODULE_PATH_NAME,SEQ) VALUES ('BSP00012','其他构件','-1','1','-1','BSP00012','其他构件',2);
INSERT INTO PUB_MODULES (MODULE_CODE,MODULE_NAME,PARENT_MODULE_CODE,IS_LEAF_MODULE,APP_CODE,MODULE_PATH,MODULE_PATH_NAME,SEQ) VALUES ('BSP00013','个人设置','-1','1','-1','BSP00013','个人设置',4);

-----功能---
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000100','组织类型维护','BSP00010',0);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000101','组织结构规则维护','BSP00010',1);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000102','组织视角管理','BSP00010',2);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000110','功能管理','BSP00011',0);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000112','角色管理','BSP00011',2);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000113','用户管理','BSP00011',3);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000114','角色模板','BSP00011',4);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000115','全局策略','BSP00011',5);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000118','在线用户','BSP00011',8);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES('BSP000119','操作日志','BSP00011',9);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000120','菜单分类管理','BSP00012',0);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000121','业务流水管理','BSP00012',1);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000122','工作日历管理','BSP00012',1);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000123','字典管理','BSP00012',3);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000130','修改我的密码','BSP00013',0);
DROP INDEX URL_CONTENT_INDEX ON PUB_URLS;

----组织视角管理功能----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00010200','查看组织视角','BSP000102','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000102000','查看组织视角','service/bsp/organ','BSP00010200','BSP000102',0,'http');

----组织类型维护功能----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00010000','查看组织类型','BSP000100','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000100000','查询组织类型','service/bsp/organType','BSP00010000','BSP000100',0,'http');

----组织机构规则维护功能----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00010100','查看组织结构规则','BSP000101','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000101000','查看组织结构规则','service/bsp/organtyperule','BSP00010100','BSP000101',1,'http');

--------功能管理-----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00011000','查看功能树','BSP000110','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000110000','展现功能树','service/bsp/function','BSP00011000','BSP000110',0,'http');

-------角色管理----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00011200','查看角色树','BSP000112','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000112000','展开角色树','service/bsp/role','BSP00011200','BSP000112',1,'http');

-------用户管理----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00011300','查看用户树','BSP000113','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000113000','查看用户树','service/bsp/user','BSP00011300','BSP000113',0,'http');

-------角色模板/组管理----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00011400','查看角色组','BSP000114','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000114000','查看角色组','service/bsp/rolegroup','BSP00011400','BSP000114',1,'http');
-------策略管理----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00011500','查看全局策略','BSP000115','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000115000','查看全局策略','service/bsp/globalpolicy','BSP00011500','BSP000115',0,'http');

-------审计操作注册----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES('BSP00011800','在线用户','BSP000118','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000118000','查看在线用户','service/bsp/audit/online','BSP00011800','BSP000118',0,'http');
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES('BSP00011900','操作日志','BSP000119','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000119000','查看操作日志','service/bsp/audit','BSP00011900','BSP000119',0,'http');

-------菜单类型管理----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP00012000','查看菜单类型列表','BSP000120','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000120000','展现菜单类型','service/bsp/menu','BSP00012000','BSP000120',0,'http');

--------业务流水管理功能----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP0001210','查看业务流水号','BSP000121','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP00012100','展现业务流水号','service/bsp/bizid','BSP0001210','BSP000121',0,'http');

--------工作日历管理功能----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP0001220','查看工作日历','BSP000122','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP00012200','展现工作日历','service/bsp/workcalendar','BSP0001220','BSP000122',0,'http');

----字典管理----
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP0001224','字典查询','BSP000123','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000122400','字典查询','service/bsp/dict','BSP0001224','BSP000123',0,'http');
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP0001300','修改我的密码','BSP000130','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000130000','修改我的密码','service/bsp/userinfo','BSP0001300','BSP000130',1,'http');


----权限委托----
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000131','管理我的委托','BSP00013',0);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES ('BSP000132','权限委托','BSP00013',0);
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP0001310','管理我的委托','BSP000131','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000131000','管理我的委托','service/bsp/proxypermissionlist','BSP0001310','BSP000131',1,'http');
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('BSP0001320','权限委托','BSP000132','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('BSP000132000','管理我的委托','service/bsp/userproxylist','BSP0001320','BSP000132',1,'http');
----菜单项----
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,MODULE_CODE,APP_CODE,IS_LEAF,ICON) VALUES('BSP00010','组织机构管理','BSP00010','-1','0','platform/img/organization.png');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,MODULE_CODE,APP_CODE,IS_LEAF,ICON) VALUES('BSP00011','安全管理','BSP00011','-1','0','platform/img/safety.png');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,MODULE_CODE,APP_CODE,IS_LEAF,ICON) VALUES('BSP00012','其他构件','BSP00012','-1','0','platform/img/other.png');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,MODULE_CODE,APP_CODE,IS_LEAF,ICON) VALUES('BSP00013','个人设置','BSP00013','-1','0','platform/img/personal.png');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000102','组织视角管理','service/bsp/organ','1','BSP00010','BSP000102','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000101','组织结构规则维护','service/bsp/organtyperule','1','BSP00010','BSP000101','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000100','组织类型维护','service/bsp/organType','1','BSP00010','BSP000100','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000110','功能管理','service/bsp/function','1','BSP00011','BSP000110','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000112','角色管理','service/bsp/role','1','BSP00011','BSP000112','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000113','用户管理','service/bsp/user','1','BSP00011','BSP000113','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000114','角色组管理','service/bsp/rolegroup','1','BSP00011','BSP000114','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000115','全局策略','service/bsp/globalpolicy','1','BSP00011','BSP000115','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000120','菜单分类管理','service/bsp/menu','1','BSP00012','BSP000120','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000121','业务流水号管理','service/bsp/bizid','1','BSP00012','BSP000121','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000122','工作日历管理','service/bsp/workcalendar','1','BSP00012','BSP000122','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000123','字典管理','service/bsp/dict','1','BSP00012','BSP000123','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000130','修改我的密码','service/bsp/userinfo','1','BSP00013','BSP000130','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000118','用户行为审计',NULL,NULL,'BSP00011','','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP0001180','在线用户','service/bsp/audit/online','1','BSP00011','BSP000118','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP0001181','操作日志','service/bsp/audit','1','BSP00011','BSP000119','-1');


INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000131','管理我的委托','service/bsp/proxypermissionlist','1','BSP00013','BSP000131','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('BSP000132','权限委托','service/bsp/userproxylist','1','BSP00013','BSP000132','-1');
----菜单结构
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP00000000000000000000000001','1','BSP00010','BSP00010',0,'BSP00010','组织结构管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSPSTRU00000000000000000000010','1','BSP000100','BSP00010',0,'BSP00010#BSP000100','组织结构管理#组织类型维护');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSPSTRU00000000000000000000011','1','BSP000102','BSP00010',1,'BSP00010#BSP000102','组织结构管理#组织视角管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSPSTRU00000000000000000000012','1','BSP000101','BSP00010',2,'BSP00010#BSP000101','组织结构管理#组织结构规则维护');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP00000000000000000000000002','1','BSP00011','BSP00011',1,'BSP00011','安全管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000020','1','BSP000110','BSP00011',0,'BSP00011#BSP000110','安全管理#功能管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000021','1','BSP000112','BSP00011',2,'BSP00011#BSP000112','安全管理#角色管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000022','1','BSP000113','BSP00011',3,'BSP00011#BSP000113','安全管理#用户管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000023','1','BSP000114','BSP00011',4,'BSP00011#BSP000114','安全管理#角色组管理');

INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000025','1','BSP000115','BSP00011',5,'BSP00011#BSP000130','安全管理#全局策略');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP00000000000000000000000003','1','BSP00012','BSP00012',2,'BSP00012','其他构件');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000030','1','BSP000120','BSP00012',0,'BSP00012#BSP000120','其他构件#菜单分类管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSPID0000000000000000000000031','1','BSP000121','BSP00012',1,'BSP00012#BSP000121','其他构件#业务流水号管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSPID0000000000000000000000032','1','BSP000122','BSP00012',2,'BSP00012#BSP000122','其他构件#工作日历管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSPID0000000000000000000000033','1','BSP000123','BSP00012',3,'BSP00012#BSP000123','其他构件#字典管理');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP00000000000000000000000004','1','BSP00013','BSP00013',4,'BSP00013','个人设置');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000040','1','BSP000130','BSP00013',0,'BSP00013#BSP000130','个人设置#修改我的密码');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000047','1','BSP000118','BSP00011',8,'BSP00011#BSP000118','安全管理#用户行为审计');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP0000000000000000000000470','1','BSP0001180','BSP000118',0,'BSP00011#BSP000118#BSP0001180','安全管理#用户行为审计#在线用户');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP0000000000000000000000471','1','BSP0001181','BSP000118',1,'BSP00011#BSP000118#BSP0001181','安全管理#用户行为审计#操作日志');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000041','1','BSP000131','BSP00013',0,'BSP00013#BSP000131','个人设置#管理我的委托');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('BSP000000000000000000000000042','1','BSP000132','BSP00013',0,'BSP00013#BSP000132','个人设置#权限委托');

----权限初始化
INSERT INTO PUB_ROLE_OPERATION SELECT 'SUPERADMIN',OPERATION_CODE FROM PUB_OPERATIONS ;
