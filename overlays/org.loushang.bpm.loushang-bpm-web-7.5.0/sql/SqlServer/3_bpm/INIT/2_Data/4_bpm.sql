
INSERT INTO WF_PROPERTY_CONFIG(ID,PROPERTY_KEY,PROPERTY_VALUE,PROPERTY_DESCRIPTION) VALUES('propertyconfig123','DB_TYPE','2','MYSQL');

##默认生成一条记录
INSERT INTO  WF_SYS_SUBJECT_DEF(ID,SUBJECT_KEY,SUBJECT_ALIAS,SUBJECT_ORDER,SUBJECT_WIDTH,IS_QUERY_CONDITION)
VALUES('8a228bf229cbe1cc0129cbe1cc530001','default_sys_subject','标题',0,'150','1');

##流程插件定义
INSERT INTO WF_INFO_PROC_PLUGIN_DEF (PLUGIN_NAME, PLUGIN_TYPE, PLUGIN_PATH, XML_PARSER, PARSER_TYPE)
	VALUES ('默认Jsp表单', 'wfd_jspform','jsp/workflow/infoprocessmodel/xpdl/JspFormFlowDesigner.html', 'org.loushang.workflow.infoprocessmodel.transform.xpdl.jspform.JspFormXmlParserAndLoader','0');

INSERT INTO WF_INFO_PROC_PLUGIN_DEF (PLUGIN_NAME, PLUGIN_TYPE, PLUGIN_PATH, XML_PARSER, PARSER_TYPE)
	VALUES ('业务主键Jsp表单', 'wfd_jspformwithpk','jsp/workflow/infoprocessmodel/xpdl/JspFormWithPKFlowDesigner.html', 'org.loushang.workflow.infoprocessmodel.transform.xpdl.jspformwithpk.JspFormWithPKXmlParserAndLoader','0');

INSERT INTO WF_INFO_PROC_PLUGIN_DEF (PLUGIN_NAME, PLUGIN_TYPE, PLUGIN_PATH, XML_PARSER, PARSER_TYPE) 
	VALUES ('自定义业务关联', 'wfd_bizform','jsp/workflow/infoprocessmodel/xpdl/BizFormFlowDesigner.html', 'org.loushang.workflow.infoprocessmodel.transform.xpdl.bizform.BizFormXmlParserAndLoader','0');

INSERT INTO WF_INFO_PROC_PLUGIN_DEF (PLUGIN_NAME, PLUGIN_TYPE, PLUGIN_PATH, XML_PARSER, PARSER_TYPE) 
	VALUES ('BPMN默认Jsp表单', 'wfd_bpmn_jspform','jsp/workflow/infoprocessmodel/bpmn/JspFormBusinessProcessDesigner.html', 'org.loushang.workflow.infoprocessmodel.transform.bpmn.bpmnjspform.BPMNJspFormXmlParserAndLoader','0');

INSERT INTO WF_INFO_PROC_PLUGIN_DEF (PLUGIN_NAME, PLUGIN_TYPE, PLUGIN_PATH, XML_PARSER, PARSER_TYPE,ITEM_TYPE,JS_PATH,JS_OBJECT,FILE_PARSER)
	VALUES ('自定义表单插件', 'wfd_bizform_html','jsp/workflow/infoprocessmodel/bizform/wfdesigner.jsp?lineType=1', '','0','1','jsp/workflow/infoprocessmodel/bizform/wform.js','WFBizForm','org.loushang.workflow.infoprocessmodel.bizform.cmd.FormExchange');
INSERT INTO WF_INFO_PROC_PLUGIN_DEF (PLUGIN_NAME, PLUGIN_TYPE, PLUGIN_PATH, XML_PARSER, PARSER_TYPE,ITEM_TYPE,JS_PATH,JS_OBJECT,FILE_PARSER)
	VALUES ('默认新增插件', 'wfd_form_html','jsp/workflow/infoprocessmodel/form/wfdesigner.jsp?lineType=1', '','0','1','jsp/workflow/infoprocessmodel/form/wform.js','WForm','org.loushang.workflow.infoprocessmodel.form.cmd.FormExchange');
##流程定义页面按钮
INSERT INTO WF_INFO_PROC_PAGE_BUTTON_DEF (ID, DISPLAY_NAME, DISPLAY_ORDER, DESCRIPTION, PLUGIN_TYPE, NEED_SET_PROC_TYPE, IS_VISIBLE)
    VALUES ('1_bpm_form', '默认新增', 1,'默认新增', 'wfd_form_html', '1', '1');

INSERT INTO WF_INFO_PROC_PAGE_BUTTON_DEF (ID, DISPLAY_NAME, DISPLAY_ORDER, DESCRIPTION, PLUGIN_TYPE, NEED_SET_PROC_TYPE, IS_VISIBLE)
    VALUES ('2_bpm_bizform', '自定义新增', 2,'自定义新增', 'wfd_bizform_html', '0', '0');

INSERT INTO WF_INFO_PROC_PAGE_BUTTON_DEF (ID, DISPLAY_NAME, DISPLAY_ORDER, DESCRIPTION, PLUGIN_TYPE, NEED_SET_PROC_TYPE, IS_VISIBLE)
    VALUES ('3_bpm_form_xpdl', 'JSP默认新增', 3,'JSP默认新增', 'wfd_jspform', '1', '0');

INSERT INTO WF_INFO_PROC_PAGE_BUTTON_DEF (ID, DISPLAY_NAME, DISPLAY_ORDER, DESCRIPTION, PLUGIN_TYPE, NEED_SET_PROC_TYPE, IS_VISIBLE)
    VALUES ('4_bpm_formpk_xpdl', '业务主键JSP新增', 4,'业务主键JSP新增', 'wfd_jspformwithpk', '1', '0');

INSERT INTO WF_INFO_PROC_PAGE_BUTTON_DEF (ID, DISPLAY_NAME, DISPLAY_ORDER, DESCRIPTION, PLUGIN_TYPE, NEED_SET_PROC_TYPE, IS_VISIBLE)
    VALUES ('5_bpm_bizform_xpdl', '自定义新增(xpdl)', 5,'自定义新增(xpdl)', 'wfd_bizform', '1', '0');

INSERT INTO WF_INFO_PROC_PAGE_BUTTON_DEF (ID, DISPLAY_NAME, DISPLAY_ORDER, DESCRIPTION, PLUGIN_TYPE, NEED_SET_PROC_TYPE, IS_VISIBLE)
    VALUES ('7_bpm_form_bpmn', '新增', 7,'BPMN默认Jsp表单新增', 'wfd_bpmn_jspform', '0', '0');

##流程监控配置0：使用旧的概要、详细图模式（虚环节图标是圆角矩形）；1：使用新图（没有概要图，可能有泳道图，虚环节图标是菱形，名称为网关），默认为0
INSERT INTO WF_MONITOR_PROPERTY_CONFIG (ID,PROPERTY_KEY,PROPERTY_VALUE,PROPERTY_DESCRIPTION) 
	VALUES ('processMonitorViewerConfig','PROCESS_MONITOR_VIEWER_CONFIG','0','使用旧的概要、详细图模式（虚环节图标是圆角矩形）');

INSERT INTO WF_PART_URL_DEF(ID, NAME, DISPLAY_ORDER, IS_VISIBLE, PART_URL, PART_CATEGORY)
	VALUES ('unit','组织机构',0,'1','jsp/workflow/infoprocessmodel/html/property/task/participantrule/commonly-unit.jsp','0');
INSERT INTO WF_PART_URL_DEF(ID, NAME, DISPLAY_ORDER, IS_VISIBLE, PART_URL, PART_CATEGORY)
	VALUES ('unitall','组织机构下所有人',1,'0','jsp/workflow/infoprocessmodel/html/property/task/participantrule/commonly-unitall.jsp','0');
INSERT INTO WF_PART_URL_DEF(ID, NAME, DISPLAY_ORDER, IS_VISIBLE, PART_URL, PART_CATEGORY)
	VALUES ('role','角色',2,'1','jsp/workflow/infoprocessmodel/html/property/task/participantrule/commonly-role.jsp','0');
INSERT INTO WF_PART_URL_DEF(ID, NAME, DISPLAY_ORDER, IS_VISIBLE, PART_URL, PART_CATEGORY)
	VALUES ('organtype','组织类型',3,'0','jsp/workflow/infoprocessmodel/html/property/task/participantrule/commonly-type.jsp','0');
INSERT INTO WF_PART_URL_DEF(ID, NAME, DISPLAY_ORDER, IS_VISIBLE, PART_URL, PART_RULE, PART_CATEGORY)
	VALUES ('context','上下文相关',4,'1','jsp/workflow/infoprocessmodel/html/property/task/participantrule/contextpart.jsp','08,18,19,21,25,31', '0');
    
##注册表单默认任务列表转向URL
INSERT INTO WF_TASK_LIST_FORWARD_URL(ID,APP_CODE,RELATIVE_PATH,FORWARD_TYPE,FORWARD_VALUE,IS_ENABLED) VALUES('jspformDefaultUrl','','jsp/workflow/tasklist/jspformforward.jsp','0','','0');
