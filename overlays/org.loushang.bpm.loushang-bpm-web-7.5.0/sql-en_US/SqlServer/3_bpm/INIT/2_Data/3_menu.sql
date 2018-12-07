
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF, ICON) VALUES 
    ('WORKFLOW', 'BPM', NULL, NULL, NULL, 'WORKFLOW', '-1', NULL, 'platform/img/bpm.png');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW01', 'Workflow Management', NULL, NULL, NULL, 'WORKFLOW01', '-1', NULL);

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW02', 'Statistic Analysis', NULL, NULL, NULL, 'WORKFLOW02', '-1', NULL);


INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW0101', 'Management', 'jsp/workflow/manage/queryprocessdefadmin.jsp', NULL, 'WORKFLOW0101', 'WORKFLOW01', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW0100', 'Workflow Definition', 'jsp/workflow/infoprocessmodel/query.jsp', NULL, 'WORKFLOW0100', 'WORKFLOW01', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW0102', 'Workflow Type', 'jsp/workflow/processtype/query.jsp', NULL, 'WORKFLOW0102', 'WORKFLOW01', '-1', '1');
    	
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00009', 'Task List', NULL, NULL, NULL, 'WORKFLOW_TASK_LIST', '-1', '0');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00011', 'Create Task', 'jsp/workflow/tasklist/querynew.jsp', NULL, 'WORKFLOW_TASK_LIST_DEFAULT_NEW', 'WORKFLOW_TASK_LIST', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00012', 'To-Do Task', 'jsp/workflow/tasklist/querydaiban.jsp', NULL, 'WORKFLOW_TASK_LIST_DEFAULT_DB', 'WORKFLOW_TASK_LIST', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00013', 'Done Task', 'jsp/workflow/tasklist/queryyiban.jsp', NULL, 'WORKFLOW_TASK_LIST_DEFAULT_YB', 'WORKFLOW_TASK_LIST', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00014', 'End Task', 'jsp/workflow/tasklist/queryend.jsp', NULL, 'WORKFLOW_TASK_LIST_DEFAULT_END', 'WORKFLOW_TASK_LIST', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00036', 'Configuration', NULL, NULL, NULL, 'WORKFLOW_CONFIG_MGR', '-1', '0');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00043', 'Workflow Definition', NULL, NULL, NULL, 'WORKFLOW_CONFIG_PROCDEF', '-1', '0');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00044', 'Plugin Button', 'jsp/workflow/infoprocessmodel/procdefpagebuttonconf.jsp', NULL, 'WORKFLOW_CONFIG_PROCDEF_BTN', 'WORKFLOW_CONFIG_PROCDEF', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00045', 'Workflow Attribute', NULL, NULL, NULL, 'WORKFLOW_CONFIG_PROCDEF', '-1', '0');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00046', 'Event Listener', 'jsp/workflow/config/eventlistenerconfig.jsp', NULL, 'WORKFLOW_PROCESS_RESUME_EVENT', 'WORKFLOW_PROPERTY_CONFIG', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00047', 'Workflow Permit', 'jsp/workflow/infoprocessmodel/procdefpermissionconfig.jsp', NULL, 'WORKFLOW_PROC_PERMISSION_CONF', 'WORKFLOW_CONFIG_PROCDEF', '-1', '1');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00052', 'Form Management', NULL, NULL, NULL, 'WORKFLOW_FORM_MGR', '-1', '0');

INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00059', 'Form Definition', 'jsp/workflow/jspform/form_query.jsp', NULL, 'WORKFLOW_FORM_MGR_JSP_DEF', 'WORKFLOW_FORM_MGR', '-1', '1');
    
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_00060', 'Plugin Register', 'jsp/workflow/infoprocessmodel/processplugintyperegister.jsp', NULL, 'WORKFLOW_PLUGIN_TYPE_REGISTER', 'WORKFLOW_CONFIG_PROCDEF', '-1', '1');
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES 
    ('WORKFLOW_MENU_PART', 'Participants config', 'jsp/workflow/infoprocessmodel/parturldef.jsp', NULL, 'WORKFLOW_PARTICIPANT_CONFIG', 'WORKFLOW_CONFIG_PROCDEF', '-1', '1');
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES
	('WORKFLOW_PROC_ANALYSIS', 'Statistic Analysis', NULL, NULL, NULL, 'WORKFLOW01', '-1', NULL);
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES
	('WORKFLOW_ALL_PROCESS_ANALYSIS', 'Workflow Analysis', 'jsp/workflow/analysis/performance/allprocessperformancecompare.jsp', NULL, 'WORKFLOW_ALL_PROCESS_ANALYSIS', 'WORKFLOW_PROC_ANALYSIS', '-1', '1');
INSERT INTO PUB_MENU_ITEM (MENU_ID, MENU_NAME, REQUEST_ACTION, TARGET, FUNCTION_CODE, MODULE_CODE, APP_CODE, IS_LEAF) VALUES
	('WORKFLOW_ALL_PART_ANALYSIS', 'Organ Analysis', 'jsp/workflow/analysis/performance/allparticipantperformancecompare.jsp', NULL, 'WORKFLOW_ALL_PART_ANALYSIS', 'WORKFLOW_PROC_ANALYSIS', '-1', '1');

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW00000000000000000000', '1', 'WORKFLOW', 'WORKFLOW', 'WORKFLOW', 'Workflow', 0);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW000000000000000000001', '1', 'WORKFLOW01', 'WORKFLOW', 'WORKFLOW#WORKFLOW01', 'Workflow#Workflow Management', 1);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW0000000000000000000010', '1', 'WORKFLOW0100', 'WORKFLOW01', 'WORKFLOW#WORKFLOW01#WORKFLOW0100', 'Workflow#Workflow Management#Workflow Definition', 1);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW0000000000000000000011', '1', 'WORKFLOW0101', 'WORKFLOW01', 'WORKFLOW#WORKFLOW01#WORKFLOW0101', 'Workflow#Workflow Management#Management', 2);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW0000000000000000000012', '1', 'WORKFLOW0102', 'WORKFLOW01', 'WORKFLOW#WORKFLOW01#WORKFLOW0102', 'Workflow#Workflow Management#Workflow Type', 0);
    
INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00009', '1', 'WORKFLOW_MENU_00009', 'WORKFLOW', 'WORKFLOW#WORKFLOW_MENU_00009', 'Workflow#Task List', 0);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00011', '1', 'WORKFLOW_MENU_00011', 'WORKFLOW_MENU_00009', 'WORKFLOW#WORKFLOW_MENU_00009#WORKFLOW_MENU_00011', 'Workflow#Task List#Create Task', 1);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00012', '1', 'WORKFLOW_MENU_00012', 'WORKFLOW_MENU_00009', 'WORKFLOW#WORKFLOW_MENU_00009#WORKFLOW_MENU_00012', 'Workflow#Task List#To-Do Task', 2);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00013', '1', 'WORKFLOW_MENU_00013', 'WORKFLOW_MENU_00009', 'WORKFLOW#WORKFLOW_MENU_00009#WORKFLOW_MENU_00013', 'Workflow#Task List#Done Task', 3);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00014', '1', 'WORKFLOW_MENU_00014', 'WORKFLOW_MENU_00009', 'WORKFLOW#WORKFLOW_MENU_00009#WORKFLOW_MENU_00014', 'Workflow#Task List#End Task', 4);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00036', '1', 'WORKFLOW_MENU_00036', 'WORKFLOW', 'WORKFLOW#WORKFLOW_MENU_00036', 'Workflow#Configuration', 4);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00043', '1', 'WORKFLOW_MENU_00043', 'WORKFLOW_MENU_00036', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00043', 'Workflow#Configuration#Workflow Definition', 2);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00044', '1', 'WORKFLOW_MENU_00044', 'WORKFLOW_MENU_00043', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00043#WORKFLOW_MENU_00044', 'Workflow#Configuration#Workflow Definition#Plugin Button', 1);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00045', '1', 'WORKFLOW_MENU_00045', 'WORKFLOW_MENU_00036', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00045', 'Workflow#Configuration#Workflow Attribute', 3);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00046', '1', 'WORKFLOW_MENU_00046', 'WORKFLOW_MENU_00045', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00045#WORKFLOW_MENU_00046', 'Workflow#Configuration#Workflow Attribute#Workflow resume monitoring', 1);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00047', '1', 'WORKFLOW_MENU_00047', 'WORKFLOW_MENU_00045', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00045#WORKFLOW_MENU_00047', 'Workflow#Configuration#Workflow Attribute#Workflow Permit', 2);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00052', '1', 'WORKFLOW_MENU_00052', 'WORKFLOW', 'WORKFLOW#WORKFLOW_MENU_00052', 'Workflow#Form Management', 2);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00059', '1', 'WORKFLOW_MENU_00059', 'WORKFLOW_MENU_00052', 'WORKFLOW#WORKFLOW_MENU_00052#WORKFLOW_MENU_00059', 'Workflow#Form Management#Form Definition', 1);
    
INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_00060', '1', 'WORKFLOW_MENU_00060', 'WORKFLOW_MENU_00043', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00043#WORKFLOW_MENU_00060', 'Workflow#Configuration#Workflow Definition#Plugin Register', 2);
INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_MENU_PART', '1', 'WORKFLOW_MENU_PART', 'WORKFLOW_MENU_00043', 'WORKFLOW#WORKFLOW_MENU_00036#WORKFLOW_MENU_00043#WORKFLOW_MENU_PART', 'Workflow#Configuration#Workflow Definition#Participants config', 2);

INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES
	('WORKFLOW_PROC_ANALYSIS', '1', 'WORKFLOW_PROC_ANALYSIS', 'WORKFLOW', 'WORKFLOW#WORKFLOW_PROC_ANALYSIS', 'Workflow#Statistic Analysis', 8);
INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES
	('WORKFLOW_ALL_PROCESS_ANALYSIS', '1', 'WORKFLOW_ALL_PROCESS_ANALYSIS', 'WORKFLOW_PROC_ANALYSIS', 'WORKFLOW#WORKFLOW_PROC_ANALYSIS#WORKFLOW_ALL_PROCESS_ANALYSIS', 'Workflow#Statistic Analysis#Workflow Analysis', 0);
INSERT INTO PUB_MENU_STRU (MENU_STRU_ID, MENU_TYPE_ID, MENU_ID, PARENT_MENU_ID, MENU_PATH, PATH_NAME, SEQ) VALUES
	('WORKFLOW_ALL_PART_ANALYSIS', '1', 'WORKFLOW_ALL_PART_ANALYSIS', 'WORKFLOW_PROC_ANALYSIS', 'WORKFLOW#WORKFLOW_PROC_ANALYSIS#WORKFLOW_ALL_PART_ANALYSIS', 'Workflow#Statistic Analysis#Organ Analysis', 1);
