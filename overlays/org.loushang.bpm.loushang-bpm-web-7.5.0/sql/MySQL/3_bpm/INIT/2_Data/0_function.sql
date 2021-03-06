
###
### Table: PUB_MODULES
###


INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
    ('WORKFLOW', '工作流', '-1', '0', '-1', 'WORKFLOW', '工作流', 0);

INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
    ('WORKFLOW01', '流程管理', 'WORKFLOW', '1', '-1', 'WORKFLOW#WORKFLOW01', '工作流#流程管理', 1);

INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_FORM_MGR', '表单管理', 'WORKFLOW', '1', '-1', 'WORKFLOW#WORKFLOW_FORM_MGR', '工作流#表单管理', 2);


INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES
	('WORKFLOW_PROC_ANALYSIS', '流程统计分析', 'WORKFLOW', '1', '-1', 'WORKFLOW#WORKFLOW_PROC_ANALYSIS', '工作流#流程统计分析', 8);

INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_CONFIG_PROCDEF', '流程定义配置', 'WORKFLOW_CONFIG_MGR', '1', '-1', 'WORKFLOW#WORKFLOW_CONFIG_MGR#WORKFLOW_CONFIG_PROCDEF', '工作流#配置管理#流程定义配置', 1);

INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_TASK_LIST', '任务列表', 'WORKFLOW', '1', '-1', 'WORKFLOW#WORKFLOW_TASK_LIST', '工作流#任务列表', 0);

INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
    ('WORKFLOW_CONFIG_MGR', '配置管理', 'WORKFLOW', '0', '-1', 'WORKFLOW#WORKFLOW_CONFIG_MGR', '工作流#配置管理', 4);

INSERT INTO PUB_MODULES (MODULE_CODE, MODULE_NAME, PARENT_MODULE_CODE, IS_LEAF_MODULE, APP_CODE, MODULE_PATH, MODULE_PATH_NAME, SEQ) VALUES 
   ('WORKFLOW_PROPERTY_CONFIG', '工作流属性配置', 'WORKFLOW_CONFIG_MGR', '1', '-1', 'WORKFLOW#WORKFLOW_CONFIG_MGR#WORKFLOW_PROPERTY_CONFIG', '工作流#配置管理#工作流属性配置', 1);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW0100', '流程定义', 'WORKFLOW01', 0);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW0101', '管理监控', 'WORKFLOW01', 1);
    
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE,FUNCTION_NAME,MODULE_CODE,SEQ) VALUES 
	('WF_BPMN_PROCESS_DESIGN','业务流程定义','WORKFLOW01',3);
    
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_CONFIG_PROCDEF_BTN', '插件按钮配置', 'WORKFLOW_CONFIG_PROCDEF', 0);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_FORM_MGR_JSP_DEF', '表单定义', 'WORKFLOW_FORM_MGR', 0);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_TASK_LIST_DEFAULT_NEW', '新建任务', 'WORKFLOW_TASK_LIST', 0);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_TASK_LIST_DEFAULT_DB', '待办任务', 'WORKFLOW_TASK_LIST', 1);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_TASK_LIST_DEFAULT_YB', '已办任务', 'WORKFLOW_TASK_LIST', 2);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_TASK_LIST_DEFAULT_END', '办结任务', 'WORKFLOW_TASK_LIST', 3);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_PROCESS_RESUME_EVENT', '流程恢复监听', 'WORKFLOW_PROPERTY_CONFIG', 0);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_PROC_PERMISSION_CONF', '流程定义权限控制', 'WORKFLOW_PROPERTY_CONFIG', 1);

INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_PLUGIN_TYPE_REGISTER', '插件类型注册', 'WORKFLOW_CONFIG_PROCDEF', 1);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES 
    ('WORKFLOW_PARTICIPANT_CONFIG', '参与者配置', 'WORKFLOW_CONFIG_PROCDEF', 1);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES
	('WORKFLOW_ALL_PROCESS_ANALYSIS', '流程效率分析', 'WORKFLOW_PROC_ANALYSIS', 0);
INSERT INTO PUB_FUNCTIONS (FUNCTION_CODE, FUNCTION_NAME, MODULE_CODE, SEQ) VALUES
	('WORKFLOW_ALL_PART_ANALYSIS', '人员绩效分析', 'WORKFLOW_PROC_ANALYSIS', 1);
   