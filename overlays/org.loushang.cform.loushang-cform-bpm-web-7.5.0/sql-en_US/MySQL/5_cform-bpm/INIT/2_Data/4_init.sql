##云表单默认任务列表转向URL
INSERT INTO CF_TASK_LIST_FORWARD_URL(ID,APP_CODE,RELATIVE_PATH,FORWARD_TYPE,FORWARD_VALUE,TASK_TYPE) VALUES('cformDefaultUrl','','jsp/cform/tasklist/formforward.jsp','0','','-1');

##云表单默认操作类别
INSERT INTO CF_BTN_TYPE(ID,NAME,DESCRIPTION,IS_DISPLAY,DISPLAY_ORDER) VALUES('cfBtnType','System Default','System Default','1',0);

##本地操作初始化
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_createBtn','Create','cfBtnType','create()',0,'cf_createBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_createAndSendBtn','CreateAndSend','cfBtnType','createAndSend()',1,'cf_createAndSendBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_createAndSelectAndSendBtn','CreateAndSelectAndSend','cfBtnType','createAndSelectAndSend()',2,'cf_createAndSelectAndSendBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_sendBtn','Send','cfBtnType','send()',3,'cf_sendBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_jumpSendBtn','JumpSend','cfBtnType','jumpSend()',4,'cf_jumpSendBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_selectAndSendBtn','SelectAndSend','cfBtnType','selectAndSend()',5,'cf_selectAndSendBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_backBtn','Back','cfBtnType','back()',6,'cf_backBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_jumpBackBtn','JumpBack','cfBtnType','jumpBack()',7,'cf_jumpBackBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_revokeBtn','Revoke','cfBtnType','revoke()',8,'cf_revokeBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_suspendBtn','Suspend','cfBtnType','suspend()',9,'cf_suspendBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_resumeBtn','Resume','cfBtnType','resume()',10,'cf_resumeBtn');
INSERT INTO CF_BTN (ACTION_ID,ACTION_NAME,ACTION_TYPE,FUNCTION_NAME,DISPLAY_ORDER,CLASS_NAME) VALUES ('cf_terminateBtn','Terminate','cfBtnType','terminate()',11,'cf_terminateBtn');