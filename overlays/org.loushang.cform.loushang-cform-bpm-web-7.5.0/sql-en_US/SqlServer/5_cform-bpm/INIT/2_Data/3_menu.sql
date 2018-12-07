--菜单项
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,MODULE_CODE,APP_CODE,IS_LEAF) VALUES('CFORM10','Process Form Management','CFORM10','-1','0');

INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('CFORM1000','Form operation definition','jsp/cform/btn/querybtn.jsp','1','CFORM10','CFORM1000','-1');
INSERT INTO PUB_MENU_ITEM(MENU_ID,MENU_NAME,REQUEST_ACTION,IS_LEAF,MODULE_CODE,FUNCTION_CODE,APP_CODE) VALUES('CFORM1002','Task URL definition','jsp/cform/procdef/tasklistforwardurldef.jsp','1','CFORM10','CFORM1002','-1');

--菜单结构
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('CFORM10','1','CFORM10','CFORM',10,'CFORM#CFORM10','CForm#Process Form Management');

INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('CFORM1000','1','CFORM1000','CFORM10',1,'CFORM#CFORM10#CFORM1000','CForm#Process Form Management#Form operation definition');
INSERT INTO PUB_MENU_STRU(MENU_STRU_ID,MENU_TYPE_ID,MENU_ID,PARENT_MENU_ID,SEQ,MENU_PATH,PATH_NAME) VALUES ('CFORM1002','1','CFORM1002','CFORM10',2,'CFORM#CFORM10#CFORM1002','CForm#Process Form Management#Task URL definition');