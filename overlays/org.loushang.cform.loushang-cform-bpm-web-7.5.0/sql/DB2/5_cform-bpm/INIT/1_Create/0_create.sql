--表单--操作按钮(兼容以前表结构)
CREATE TABLE CF_BTN
(
	ACTION_ID VARCHAR (32) NOT NULL,
	ACTION_NAME VARCHAR (32),
	ACTION_TYPE VARCHAR (32) NOT NULL,
	FUNCTION_NAME VARCHAR (100),
	DISPLAY_ORDER INTEGER,
	DESCRIPTION VARCHAR (100),
	CLASS_NAME VARCHAR (100)
);
ALTER TABLE CF_BTN
    ADD CONSTRAINT CF_BTN_PK
PRIMARY KEY (ACTION_ID);

--操作类别
CREATE TABLE CF_BTN_TYPE
(
        ID VARCHAR (32) NOT NULL,
        NAME VARCHAR (100) NOT NULL,
        DESCRIPTION VARCHAR (100),
        IS_DISPLAY CHAR(1) NOT NULL,
        DISPLAY_ORDER INTEGER
);
ALTER TABLE CF_BTN_TYPE
    ADD CONSTRAINT CF_BTN_TYPE_PK
PRIMARY KEY (ID);

--环节--表单关联
CREATE TABLE CF_ACT_FORM
(
    ID VARCHAR (32) NOT NULL,
    PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    ACT_DEF_UNIQUE_ID VARCHAR (32) NOT NULL,
    FORM_ID VARCHAR (30) NOT NULL,
    DEVICE_TYPE VARCHAR(32) NOT NULL,
    PERMISSION CHAR (2) NOT NULL
);
ALTER TABLE CF_ACT_FORM
    ADD CONSTRAINT CF_ACT_FORM_PK
PRIMARY KEY (ID);

--环节--表单域控制
CREATE TABLE CF_ACT_FORM_ACL
(
    ID VARCHAR (32) NOT NULL,
    PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    ACT_DEF_UNIQUE_ID VARCHAR (32) NOT NULL,
    FORM_ID VARCHAR (30) NOT NULL,
    FORM_ACL BLOB (10M) NOT NULL,
   	FORM_ACL_JSON BLOB (10M) NOT NULL
);
ALTER TABLE CF_ACT_FORM_ACL
    ADD CONSTRAINT CF_AFMA_PK 
PRIMARY KEY (ID);

--环节--操作按钮
CREATE TABLE CF_ACT_FORM_BTN
(
    ID VARCHAR (32) NOT NULL,
    PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    ACT_DEF_UNIQUE_ID VARCHAR (32) NOT NULL,
    FORM_ID VARCHAR (30) NOT NULL,
    BTN_DEF_ID VARCHAR (32) NOT NULL,
    TASK_TYPE CHAR (1) NOT NULL,
    DISPLAY_ORDER INTEGER
);
ALTER TABLE CF_ACT_FORM_BTN
    ADD CONSTRAINT CF_AFMB_PK 
PRIMARY KEY (ID);

--流程类型层次任务列表标题来源
CREATE TABLE CF_TYPE_SUBJECT_SC_FIELD_DEF
(
    ID VARCHAR (32) NOT NULL ,
    PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    ACT_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    TYPE_SUBJECT_DEF_ID VARCHAR (32) NOT NULL ,
    FORM_ID VARCHAR (30) NOT NULL ,
    FIELD_ID VARCHAR (30) NOT NULL 
);
ALTER TABLE CF_TYPE_SUBJECT_SC_FIELD_DEF
    ADD CONSTRAINT CF_TSSFD_PK 
    PRIMARY KEY (ID);

--流程定义层次任务列表标题来源
CREATE TABLE CF_PROC_SUBJECT_SC_FIELD_DEF
(
    ID VARCHAR (32) NOT NULL ,
    PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    ACT_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    PROC_SUBJECT_DEF_ID VARCHAR (32) NOT NULL ,
    FORM_ID VARCHAR (30) NOT NULL ,
    FIELD_ID VARCHAR (30) NOT NULL 
);
ALTER TABLE CF_PROC_SUBJECT_SC_FIELD_DEF
    ADD CONSTRAINT CF_PSSFD_PK 
    PRIMARY KEY (ID);

--任务列表转向url
CREATE TABLE CF_TASK_LIST_FORWARD_URL
(
    ID VARCHAR (32) NOT NULL,
    APP_CODE VARCHAR(30) ,
    RELATIVE_PATH VARCHAR(512) NOT NULL,
    FORWARD_TYPE CHAR(1) NOT NULL,
    FORWARD_VALUE VARCHAR(32),
    TASK_TYPE VARCHAR(2) NOT NULL WITH DEFAULT '-1'
);
ALTER TABLE CF_TASK_LIST_FORWARD_URL
    ADD CONSTRAINT CF_TLFU_PK 
PRIMARY KEY (ID);

--流程实例--表单实例主键关联
CREATE TABLE CF_PROC_FORM_DATA
(
    ID VARCHAR (32) NOT NULL,
    PROCESS_ID VARCHAR (32) NOT NULL,
    DATA_ID VARCHAR (32) NOT NULL,
    FORM_ID VARCHAR (30) NOT NULL,
    MODEL_ID VARCHAR (30) NOT NULL
);
ALTER TABLE CF_PROC_FORM_DATA
    ADD CONSTRAINT CF_PFMD_PK 
PRIMARY KEY (ID);

--流程默认标题关联表单域定义
CREATE TABLE CF_SUBJECT_SC_FIELD_DEF
(
   ID VARCHAR (32) NOT NULL,
   PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL,
   FORM_ID VARCHAR (30) NOT NULL,
   FIELD_ID VARCHAR (255) NOT NULL,
   FIELD_JOIN VARCHAR (32)
);
ALTER TABLE CF_SUBJECT_SC_FIELD_DEF
    ADD CONSTRAINT CF_SSFD_PK
PRIMARY KEY (ID);

--CForm业务模型定义
CREATE TABLE CF_PROC_DEF_MODEL
(
    ID VARCHAR(32) NOT NULL,
    PROC_DEF_UNIQUE_ID VARCHAR (32) NOT NULL ,
    PROC_DEF_ID VARCHAR(32) NOT NULL,
    PROC_DEF_NAME VARCHAR (100),
    PLUGIN_TYPE VARCHAR(32) NOT NULL,
    CREATE_TIME CHAR (17) NOT NULL,
    MODEL_CONTENT BLOB (10M),
    IS_HISTORY CHAR (1) WITH DEFAULT '0'
);
--设置主键
ALTER TABLE CF_PROC_DEF_MODEL  
  ADD CONSTRAINT  CF_PROC_MODEL_PK  
  PRIMARY KEY (ID);
  
--委派id表单数据id关联
CREATE TABLE CF_ASSIGN_FORM_DATA (
  ID varchar(32) NOT NULL,
  ASSIGNMENT_ID varchar(32) NOT NULL,
  DATA_ID varchar(32) NOT NULL,
  FORM_ID varchar(32) NOT NULL,
  IS_CREATE char(1) NOT NULL,
  PROCESS_ID varchar(32) NOT NULL,
  IS_BASIC char(1) NOT NULL
);
ALTER TABLE CF_ASSIGN_FORM_DATA
    ADD CONSTRAINT CF_ASSIGN_FORM_DATA_PK
PRIMARY KEY (ID);