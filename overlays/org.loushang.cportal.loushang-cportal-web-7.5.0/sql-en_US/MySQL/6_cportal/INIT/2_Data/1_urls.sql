##页面管理
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('CPORTAL01000','Page Definition','CPORTAL0100','00','1',0);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('CPORTAL010000','Page Definition','jsp/cportal/page/querypage.jsp','CPORTAL01000','CPORTAL0100',0,'http');
    
INSERT INTO PUB_OPERATIONS (OPERATION_CODE,OPERATION_NAME,FUNCTION_CODE,OPERATION_TYPE_CODE,IS_DEFAULT,SEQ) VALUES ('CPORTAL01001','Widget Definition','CPORTAL0101','00','1',1);
INSERT INTO PUB_URLS (URL_CODE,URL_NAME,URL_CONTENT,OPERATION_CODE,FUNCTION_CODE,SEQ,ACCESS_TYPE) VALUES('CPORTAL010010','Widget Definition','jsp/cportal/widget/querywidget.jsp','CPORTAL01001','CPORTAL0101',0,'http');