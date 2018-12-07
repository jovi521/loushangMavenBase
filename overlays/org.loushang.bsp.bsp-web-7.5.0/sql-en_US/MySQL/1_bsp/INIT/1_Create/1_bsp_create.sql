##BSP所有的数据库初始化脚本
####创建BSP中的相关表以及视图

####组织结构
###业务流水号表
CREATE TABLE PUB_IDTABLE (
	ID_ID VARCHAR(30) NOT NULL ,
	ID_VALUE INT NOT NULL ,
	ID_NAME VARCHAR(50) NOT NULL ,
	ID_PREFIX VARCHAR(60) ,
	IS_PREFIX CHAR(1) NOT NULL ,
	ID_LENGTH INT NOT NULL,
	IS_SUFFIX CHAR(1)  ,
	ID_SUFFIX VARCHAR(60) ,
	IS_GLOBAL CHAR(1)  NOT NULL,
	ORGAN_ID VARCHAR(30),
	ID_TYPE CHAR(2),
	ID_DATE CHAR(8)
);

###组织类型
CREATE TABLE PUB_ORGAN_TYPE
(
     ORGAN_TYPE VARCHAR (10) NOT NULL  ,
     TYPE_NAME VARCHAR (60) NOT NULL ,
     PARENT_TYPE VARCHAR (10) NOT NULL ,
     IN_USE CHAR (1) DEFAULT '1' NOT NULL,
     CTIME TIMESTAMP
);

##业务组织视角
CREATE TABLE PUB_STRU_TYPE
(
     STRU_TYPE VARCHAR (10) NOT NULL  ,
     TYPE_NAME VARCHAR (60) NOT NULL ,
     ROOT_ID VARCHAR (30) NOT NULL ,
     IS_DEFAULT CHAR (1) DEFAULT '0' NOT NULL ,
     NOTE VARCHAR (250) ,
     IN_USE CHAR (1) DEFAULT '1' NOT NULL,
     CTIME TIMESTAMP
);

##业务组织机构规则
CREATE TABLE PUB_STRU_RULE
(
     RULE_ID VARCHAR (20) NOT NULL ,
     STRU_TYPE VARCHAR (10) NOT NULL ,
     SRC_REF VARCHAR (10) NOT NULL ,
     TARGET_REF VARCHAR (10) NOT NULL ,
     RULE_NOTE VARCHAR (250)
);

##组织实体
CREATE TABLE PUB_ORGAN
(
     ORGAN_ID VARCHAR (30) NOT NULL ,
     ORGAN_CODE VARCHAR (30) NOT NULL ,
     ORGAN_NAME VARCHAR (80) NOT NULL ,
     SHORT_NAME VARCHAR (40) ,
     ORGAN_TYPE VARCHAR (10) NOT NULL ,
     IN_USE CHAR (1) DEFAULT '1' NOT NULL,
     CTIME TIMESTAMP
) ;
##机构明细
CREATE TABLE PUB_ORG_DETAIL
(
     ORGAN_ID VARCHAR (30) NOT NULL ,
     MG_ORGAN_ID VARCHAR (30) NOT NULL ,
     IN_USE CHAR (1) DEFAULT '1' NOT NULL,
     CTIME TIMESTAMP
);
##岗位表
CREATE TABLE PUB_POSITION
(
    POSITION_CODE VARCHAR(30) NOT NULL PRIMARY KEY,
    POSITION_NAME VARCHAR(80) NOT NULL,
    ORGAN_TYPE VARCHAR(10),
    P_POSITION_CODE VARCHAR(30),
    IN_USE CHAR(1) DEFAULT '1' NOT NULL,
    CTIME TIMESTAMP,
    DEP_ID VARCHAR(30)
);
###组织结构表
CREATE TABLE PUB_STRU
(
     STRU_ID VARCHAR (30) NOT NULL ,
     ORGAN_ID VARCHAR (30),
     STRU_TYPE VARCHAR (10) NOT NULL ,
     PARENT_ID VARCHAR (30) ,
     STRU_LEVEL INT NOT NULL ,
     STRU_PATH VARCHAR (1000) NOT NULL ,
     STRU_ORDER INT DEFAULT 1 NOT NULL ,
     IS_LEAF CHAR (1) DEFAULT '0' NOT NULL ,
     IN_USE CHAR (1) DEFAULT '1' NOT NULL,
     POSITION_CODE VARCHAR(30),
     CTIME TIMESTAMP,
     STRU_NAME VARCHAR(80),
     STRU_CODE VARCHAR(30)
);
##组织结构扩展
CREATE TABLE PUB_STRU_EXT
(
	ID VARCHAR (30) NOT NULL ,
	TYPE CHAR (2) NOT NULL,
	SRC_ID VARCHAR (30) NOT NULL,
	TARGET_ID VARCHAR (30) NOT NULL,
	STRU_TYPE VARCHAR (10) NOT NULL ,
	STRU_ID VARCHAR (30) NOT NULL
);

###权限相关
##数据类型表
CREATE TABLE PUB_DATA_TYPE
(
	DATA_TYPE_CODE VARCHAR(10) NOT NULL,
	DATA_TYPE_NAME VARCHAR(30) NOT NULL,
	IS_ORGAN CHAR(1) NOT NULL,
	SOURCE_TABLE VARCHAR(30) ,
	SOURCE_TABLE_DES VARCHAR(30) ,
	SEL_COL VARCHAR(30) ,
	SEL_COL_DES VARCHAR(60) ,
	DISP_COL VARCHAR(30) ,
	DISP_COL_DES VARCHAR(60) ,
	IS_USE_WHERE CHAR(1) default '0' ,
	WHERE_CONDITION VARCHAR(600) ,
	NOTE VARCHAR(30)
);

##组织参数类型表
CREATE TABLE PUB_ORGAN_PARMS_TYPE
(
	ORGAN_PARMS_NAME VARCHAR(30) NOT NULL,
	ORGAN_PARMS_DES VARCHAR(250) NOT NULL,
	DATA_SOURCE CHAR(1) default '0' NOT NULL,
	ENUM_NAME VARCHAR(30) ,
	ENUM_DES VARCHAR(30) ,
	SOURCE_TABLE_NAME VARCHAR(30) ,
	SOURCE_TABLE_DES VARCHAR(30) ,
	SEL_COL VARCHAR(30) ,
	SEL_COL_DES VARCHAR(60) ,
	DISP_COL VARCHAR(30) ,
	DISP_COL_DES VARCHAR(60) ,
	IS_USE_WHERE CHAR(1) default '0' ,
	WHERE_CONDITION VARCHAR(600) ,
	NOTE VARCHAR(250)
);

##组织参数表
CREATE TABLE PUB_ORGAN_PARMS
(
	ORGAN_ID VARCHAR(30) NOT NULL,
	PARMS_NAME VARCHAR(30) NOT NULL,
	PARMS_VALUE VARCHAR(250) NOT NULL,
	NOTE VARCHAR(250)
);

####################用户########################
####用户类型
CREATE TABLE PUB_USER_TYPE
(
    USER_TYPE_CODE VARCHAR(10) NOT NULL,
    USER_TYPE_NAME VARCHAR(60) NOT NULL,
    DESCRIPTION VARCHAR(200),
    IS_USE  CHAR(1) NOT NULL
);

CREATE TABLE PUB_USERS
(
    USER_ID VARCHAR (30) NOT NULL ,
 	USER_TYPE_CODE VARCHAR (10),
    USER_NAME VARCHAR (30) NOT NULL ,
    PASSWORD VARCHAR (128) NOT NULL ,
    ACCOUNT_STATUS CHAR (2) DEFAULT '11' NOT NULL ,
    IS_SYS CHAR (1) DEFAULT '0' NOT NULL ,
    CREATE_TIME CHAR (17) NOT NULL ,
    LOCK_TIME CHAR (17) ,
    EXPIRED_TIME CHAR (17) ,
    PWD_UPT_TIME CHAR (17) ,
	PWD_TIME CHAR (17),
    ID_NUM INT
);

####用户员工对应表
CREATE TABLE PUB_USER_EMPLOYEE(
	USER_ID VARCHAR(30) NOT NULL,
	CORPORATION_ID VARCHAR(30) NOT NULL,
	DEPARTMENT_ID VARCHAR(30) NOT NULL,
	EMPLOYEE_ID VARCHAR(30)
);
####用户策略
CREATE TABLE PUB_USER_POLICY(
    USER_ID VARCHAR (30) NOT NULL ,
    IS_USE_IP CHAR(1) NOT NULL,
    IP_POLICY_VALUE VARCHAR(200) ,
    MAX_SESSION_NUMBER INTEGER
);
###用户认证管理
CREATE TABLE PUB_USER_AUTH(
    ID  VARCHAR(30) NOT NULL PRIMARY KEY,
    AUTH_TYPE CHAR(2) NOT NULL,
    AUTH_VALUE VARCHAR(60) NOT NULL,
    USER_ID   VARCHAR(30) NOT NULL,
    IS_USE CHAR(1) NOT NULL
);
###用户数据权限 LIUCHH　20130904　增加是否默认值  IS_DEFAULT
CREATE TABLE PUB_USER_DATA(
    ID  VARCHAR(30) NOT NULL PRIMARY KEY,
    USER_ID VARCHAR(30) NOT NULL,
    ORGAN_TYPE VARCHAR(10) NOT NULL,
    CODE VARCHAR(30),
    NAME VARCHAR(80),
    STRU_TYPE VARCHAR(10),
    IS_SCOPE CHAR(1),
    IS_DEFAULT VARCHAR(1)  DEFAULT  '0'
);
###组织权限
CREATE TABLE PUB_USER_DATA_PERMIT
(
    USER_DATA_PERMIT_ID VARCHAR (30) NOT NULL PRIMARY KEY ,
	USER_ID VARCHAR (30) NOT NULL ,
 	OBJECT_VALUE VARCHAR (30) NOT NULL ,
	OBJECT_NAME VARCHAR (80),
    DATA_TYPE_CODE VARCHAR (10) NOT NULL ,
    IS_DEFAULT CHAR (1) DEFAULT '0' NOT NULL ,
    STRU_ID VARCHAR (30) ,
    STRU_TYPE VARCHAR (10) ,
    SCOPE_TYPE VARCHAR (1) ,
    SCOPE_VALUE VARCHAR (30) ,
	SCOPE_NAME VARCHAR (80),
    START_TIME CHAR (17) ,
    END_TIME CHAR (17)
) ;
###在线用户  liuchh 20130828 为适应存放各类服务器端生成的session_id 长度，将SESSION_ID扩大到VARCHAR(100)
CREATE TABLE PUB_ONLINE
(
    SESSION_ID VARCHAR(100) NOT NULL PRIMARY KEY,
    USER_ID VARCHAR (30) NOT NULL ,
    USER_NAME VARCHAR(30),
    CORPORATION_ID VARCHAR(30),
    LOGIN_TIME CHAR(17),
    LOGOUT_TIME CHAR(17),
    REMOTEADDR  VARCHAR(80)
);
-- 添加字段服务端sessionId
ALTER TABLE PUB_ONLINE ADD SVR_SESSION_ID varchar(100) NOT NULL;
-- 添加字段认证客户端类别clientType(如0-Browser, 1-App)
ALTER TABLE PUB_ONLINE ADD CLIENT_TYPE varchar(2);
########################################################菜单######################################
##系统菜单类型
CREATE TABLE PUB_MENU_TYPE(
	MENU_TYPE_ID VARCHAR(10) NOT NULL,
	MENU_TYPE_NAME VARCHAR(60) NOT NULL,
	IS_SYS CHAR(1) NOT NULL,
	IS_SYS_DEFAULT CHAR(1) NOT NULL
);
####菜单项
CREATE TABLE PUB_MENU_ITEM(
	MENU_ID VARCHAR(30) NOT NULL,
	MENU_NAME VARCHAR(60) NOT NULL,
	REQUEST_ACTION VARCHAR(256),
	TARGET VARCHAR(30),
	FUNCTION_CODE VARCHAR(30),
	MODULE_CODE VARCHAR(30),
	APP_CODE VARCHAR(30),
	IS_LEAF CHAR(1),
	ICON  VARCHAR(200)
);
####菜单结构
CREATE TABLE PUB_MENU_STRU(
	MENU_STRU_ID VARCHAR(30) NOT NULL,
	MENU_TYPE_ID VARCHAR(10) NOT NULL,
	MENU_ID VARCHAR(30) NOT NULL,
	PARENT_MENU_ID VARCHAR(30) NOT NULL,
	MENU_PATH VARCHAR(600) ,
	PATH_NAME VARCHAR(600) ,
	SEQ INT
);
############################################角色和角色组###########################################
##################角色组##########
CREATE TABLE PUB_ROLE_GROUP(
	ROLE_GROUP_ID VARCHAR(30) NOT NULL,
	ROLE_GROUP_NAME VARCHAR(60) NOT NULL,
	CORPORATION VARCHAR(30) NOT NULL,
	DESCRIPTION VARCHAR(150)
);
#############角色组应用范围######
CREATE TABLE PUB_ROLE_GROUP_SCOPE(
	ROLE_GROUP_ID VARCHAR(30) NOT NULL,
	SCOPE_VALUE VARCHAR(30) NOT NULL
);
##########角色表################
 CREATE TABLE PUB_ROLES(
 	ROLE_ID VARCHAR(30) not null,
 	ROLE_NAME VARCHAR(60) not null,
 	RELATION_ID VARCHAR(30) ,
 	ROLE_GROUP_ID VARCHAR(30) ,
 	DESCRIPTION VARCHAR(150),
    ROLE_CODE VARCHAR(30),
    ORGAN_TYPE VARCHAR(10),
    IS_GLOBAL CHAR(1),
    CTIME TIMESTAMP
 );
##########角色继承表#################
CREATE TABLE PUB_ROLE_PRIVS(
	ROLE_ID VARCHAR(30) not null,
	GRANTED_ROLE VARCHAR(30) not null
);
##########不相容角色集表##############
CREATE TABLE PUB_CONF_ROLESET(
	SET_ID VARCHAR(30) not null,
	SET_NAME VARCHAR(30),
	CARDINALITY INT,
	CORPORATION_ID VARCHAR(30)
);
##########不相容角色表################
CREATE TABLE PUB_CONF_ROLES(
	ROLE_ID VARCHAR(30) not null,
	SET_ID VARCHAR(30) not null
);
###################################################应用、模块、功能、操作########################################################
#########应用#########
CREATE TABLE PUB_APPS(
 	APP_CODE VARCHAR(30) not null,
 	APP_NAME VARCHAR(60) not null,
 	TRANSPORT VARCHAR(10) ,
 	SERVER_HOST VARCHAR(30) ,
 	PORT VARCHAR(6) ,
 	CONTEXT VARCHAR(60) ,
 	URI VARCHAR(100) ,
 	SEQ INTEGER ,
 	NOTE VARCHAR(300),
 	APP_URL VARCHAR(256),
 	ICON VARCHAR(256),
 	TARGET VARCHAR(30)
);
########模块###########
CREATE TABLE PUB_MODULES(
 	MODULE_CODE VARCHAR(30) not null,
 	MODULE_NAME VARCHAR(60) not null,
 	PARENT_MODULE_CODE VARCHAR(30) not null,
 	IS_LEAF_MODULE CHAR(1) not null,
 	APP_CODE VARCHAR(30) ,
 	MODULE_PATH VARCHAR(300) not null,
 	MODULE_PATH_NAME VARCHAR(300) not null,
 	SEQ INTEGER not null,
    IS_MENU CHAR(1),
    URL VARCHAR(200),
    ICON VARCHAR(200),
    TARGET VARCHAR(30)
);
########功能#############
CREATE TABLE PUB_FUNCTIONS(
 	FUNCTION_CODE VARCHAR(30) not null,
 	FUNCTION_NAME VARCHAR(60) not null,
 	MODULE_CODE VARCHAR(30) not null,
 	SEQ INTEGER not null,
    ORGAN_TYPE VARCHAR(10),
    IS_MENU CHAR(1),
    URL VARCHAR(500),
    ICON VARCHAR(200),
    F_TYPE CHAR(1),
    TARGET VARCHAR(30),
    CP_MENU_ID INTEGER,
    DESCRIPTION  VARCHAR(200),
    STRU_TYPE VARCHAR(10)
);
#######操作##############
CREATE TABLE PUB_OPERATIONS(
 	OPERATION_CODE VARCHAR(30) not null,
 	OPERATION_NAME VARCHAR(60) not null,
 	FUNCTION_CODE VARCHAR(30) not null,
 	OPERATION_TYPE_CODE VARCHAR(30) not null,
 	IS_DEFAULT CHAR(1) not null,
 	SEQ INTEGER not null
);
#######URL##############
CREATE TABLE PUB_URLS(
 	URL_CODE VARCHAR(30) not null,
 	URL_NAME VARCHAR(60) not null,
 	URL_CONTENT VARCHAR(255) not null,
 	OPERATION_CODE VARCHAR(30) not null,
 	FUNCTION_CODE VARCHAR(30) not null,
 	ACCESS_TYPE VARCHAR(10) not null,
 	NOTE VARCHAR(50),
 	SEQ INTEGER not null
);
##############操作类型############
CREATE TABLE PUB_OPERATION_TYPE(
 	OPERATION_TYPE_CODE VARCHAR(30) not null,
 	OPERATION_TYPE_NAME VARCHAR(60) not null
);
#############用户角色分配规则#####
CREATE TABLE PUB_USER_ROLE(
 	RULE_ID VARCHAR(30) not null,
 	RULE_TYPE CHAR(2),
 	TARGET VARCHAR(30) not null,
 	ROLE_ID VARCHAR(30) not null
);

#######角色操作对应
CREATE TABLE PUB_ROLE_OPERATION(
 	ROLE_ID VARCHAR(30) not null,
 	OPERATION_CODE VARCHAR(30) not null
);

##创建视图
##################用户代理#############
CREATE TABLE PUB_USER_PROXY(
USER_ID VARCHAR(30) NOT NULL,
PROXY_TYPE CHAR(1) NOT NULL,
PROXY_USER_ID VARCHAR(30) NOT NULL,
PROXY_PERMISSION_ID VARCHAR(30) ,
START_TIME CHAR(17),
END_TIME CHAR(17)
);
##############代理权限###############
CREATE TABLE PUB_PROXY_PERMISSION(
  PROXY_PERMISSION_ID VARCHAR(30) NOT NULL,
  PROXY_PERMISSION_NAME VARCHAR(60) NOT NULL,
  PROXY_PERMISSION_CREATOR VARCHAR(30) NOT NULL,
  NOTE VARCHAR(250)
);
##############代理权限明细############
CREATE TABLE PUB_PROXY_PERMISSION_ITEM(
PROXY_PERMISSION_ITEM_ID  VARCHAR(30) NOT NULL,
ITEM_TYPE VARCHAR(2) NOT NULL,
PROXY_PERMISSION_ITEM_CONTENT VARCHAR(250) NOT NULL,
PROXY_PERMISSION_ID VARCHAR(30) NOT NULL,
NOTE VARCHAR(250)
);

#################全局策略###########
CREATE TABLE PUB_GLOBAL_POLICY(
 	PWD_MIN_LENGTH INTEGER NOT NULL,
 	PWD_MAX_LENGTH INTEGER NOT NULL,
 	IS_UPCASE CHAR(1) NOT NULL,
 	IS_LOWERCASE CHAR(1) NOT NULL,
 	IS_NUM CHAR(1) NOT NULL,
 	IS_SPECIALCHAR CHAR(1) NOT NULL,
 	IS_REPEAT CHAR(1) NOT NULL,
 	PWD_LIFE_TIME INTEGER NOT NULL,
 	LOGIN_ATTEMPTS INTEGER NOT NULL,
 	PWD_LOCK_TIME INTEGER NOT NULL,
 	PWD_GRACE_TIME INTEGER NOT NULL
);
###工作日历
CREATE TABLE PUB_ORGAN_WORKDAY
(
            SOLAR_DATE CHAR (8) NOT NULL ,
            ORGAN_ID VARCHAR (30) NOT NULL ,
            LUNAR_DATE VARCHAR (12) ,
            IS_WORKDAY CHAR DEFAULT '1' NOT NULL ,
            WEEK INT ,
            NOTE VARCHAR (250)
) ;
CREATE TABLE PUB_FIN_YEAR
(
            ID VARCHAR (30) NOT NULL ,
            ORGAN_ID VARCHAR (30) NOT NULL ,
            FIN_YEAR CHAR (4) NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) NOT NULL ,
            PERIOD_NUM INT NOT NULL 
);

CREATE TABLE PUB_FIN_MONTH
(
            ID VARCHAR (30) NOT NULL ,
            ORGAN_ID VARCHAR (30) NOT NULL ,
            FIN_YEAR CHAR (4) NOT NULL ,
            FIN_MONTH CHAR (6) NOT NULL ,
            BEGIN_DATE CHAR (8) NOT NULL ,
            END_DATE CHAR (8) NOT NULL ,
            SEQ INT NOT NULL ,
            IS_CLOSED CHAR (1) NOT NULL 
);
ALTER TABLE PUB_FIN_YEAR ADD CONSTRAINT PUBFINYEAR_PK PRIMARY KEY (ID);
ALTER TABLE PUB_FIN_MONTH ADD CONSTRAINT PUBFINMONTH_PK PRIMARY KEY (ID);
####创建BSP中的相关主键
####组织结构相关
 ALTER TABLE PUB_ORGAN_WORKDAY
    ADD CONSTRAINT PUBORGANWORKDAY_PK
    PRIMARY KEY (SOLAR_DATE,ORGAN_ID);

 ALTER TABLE PUB_ORGAN_TYPE
    ADD CONSTRAINT PUBORGANTYPE_PK
    PRIMARY KEY (ORGAN_TYPE);

 ALTER TABLE PUB_STRU_TYPE
    ADD CONSTRAINT PUBSTRUTYPE_PK
    PRIMARY KEY (STRU_TYPE);

 ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_PK
    PRIMARY KEY (RULE_ID);

 ALTER TABLE PUB_ORGAN
    ADD CONSTRAINT PUBORGAN_PK
    PRIMARY KEY (ORGAN_ID);

 ALTER TABLE PUB_STRU
    ADD CONSTRAINT PUBSTRU_PK
    PRIMARY KEY (STRU_ID);

 ALTER TABLE PUB_STRU_EXT
    ADD CONSTRAINT PUBSTRUEXT_PK
    PRIMARY KEY (ID);

#####权限相关


#################用户#########

ALTER TABLE PUB_USER_TYPE
	ADD CONSTRAINT PUBUSERTYPE_PK
	PRIMARY KEY (USER_TYPE_CODE);

ALTER TABLE PUB_USERS
	ADD CONSTRAINT PUBUSERS_PK
	PRIMARY KEY (USER_ID);

ALTER TABLE PUB_USER_EMPLOYEE
    ADD CONSTRAINT PUBUSEREMPLOYEE_PK
    PRIMARY KEY (USER_ID);

ALTER TABLE PUB_USER_POLICY
	ADD CONSTRAINT PUBUSERPOLICY_PK
	PRIMARY KEY (USER_ID);

##数据类型表
ALTER TABLE PUB_DATA_TYPE ADD CONSTRAINT PUB_DATA_TYPE_PK PRIMARY KEY (DATA_TYPE_CODE);
##组织参数类型表
ALTER TABLE PUB_ORGAN_PARMS_TYPE ADD CONSTRAINT PUB_OPT_PK PRIMARY KEY (ORGAN_PARMS_NAME);

##组织参数表
ALTER TABLE PUB_ORGAN_PARMS ADD CONSTRAINT PUB_ORGAN_PARMS_PK PRIMARY KEY (ORGAN_ID,PARMS_NAME);

########################################################菜单######################################
##菜单类型主键###
ALTER TABLE PUB_MENU_TYPE
ADD CONSTRAINT PUB_MENU_TYPE_PK
PRIMARY KEY (MENU_TYPE_ID);
##菜单项###
ALTER TABLE PUB_MENU_ITEM
ADD CONSTRAINT PUB_MENU_ITEM_PK
PRIMARY KEY (MENU_ID);
#######菜单结构##
ALTER TABLE PUB_MENU_STRU
ADD CONSTRAINT PUB_MENU_STRU_PK
PRIMARY KEY (MENU_STRU_ID);
######################################################角色、角色组#################################################
########角色组############
ALTER TABLE PUB_ROLE_GROUP
ADD CONSTRAINT PUB_ROLE_GROUP_PK
PRIMARY KEY (ROLE_GROUP_ID);
#########角色组应用范围######
ALTER TABLE PUB_ROLE_GROUP_SCOPE
ADD CONSTRAINT PUB_ROLE_GROU_S_PK
PRIMARY KEY (ROLE_GROUP_ID,SCOPE_VALUE);
###########角色
ALTER TABLE PUB_ROLES
ADD CONSTRAINT PUB_ROLES_PK
PRIMARY KEY (ROLE_ID);
###########角色继承########
ALTER TABLE PUB_ROLE_PRIVS
ADD CONSTRAINT PUB_ROLE_PRIVS_PK
PRIMARY KEY (ROLE_ID, GRANTED_ROLE);
###########不相容角色集########
ALTER TABLE PUB_CONF_ROLESET
ADD CONSTRAINT PUB_CONF_RS_PK
PRIMARY KEY (SET_ID);
###########不相容角色##########
ALTER TABLE PUB_CONF_ROLES
ADD CONSTRAINT PUB_CONF_ROLES_PK
PRIMARY KEY (ROLE_ID,SET_ID);
###################################################应用、模块、功能、操作########################################################
#########应用#########
ALTER TABLE PUB_APPS
ADD CONSTRAINT PUB_APPS_PK
PRIMARY KEY (APP_CODE);
#########模块#########
ALTER TABLE PUB_MODULES
ADD CONSTRAINT PUB_MODULES_PK
PRIMARY KEY (MODULE_CODE);
#########功能#########
ALTER TABLE PUB_FUNCTIONS
ADD CONSTRAINT PUB_FUNCTIONS_PK
PRIMARY KEY (FUNCTION_CODE);
#########操作#########
ALTER TABLE PUB_OPERATIONS
ADD CONSTRAINT PUB_OPERATIONS_PK
PRIMARY KEY (OPERATION_CODE);
#########操作URL#######
ALTER TABLE PUB_URLS
ADD CONSTRAINT PUB_URLS_PK
PRIMARY KEY (URL_CODE);
#########操作类型#######
ALTER TABLE PUB_OPERATION_TYPE
ADD CONSTRAINT PUB_O_TYPE_PK
PRIMARY KEY (OPERATION_TYPE_CODE);
#########用户角色分配规则#####
ALTER TABLE PUB_USER_ROLE
ADD CONSTRAINT PUB_USER_ROLE_PK
PRIMARY KEY (RULE_ID);
#########角色操作对应#####
ALTER TABLE PUB_ROLE_OPERATION
ADD CONSTRAINT PUB_ROLE_O_PK
PRIMARY KEY (ROLE_ID,OPERATION_CODE);

#################权限代理
ALTER TABLE PUB_USER_PROXY
   ADD CONSTRAINT  PUBUSERPROXY_PK
       PRIMARY KEY(USER_ID,PROXY_USER_ID,PROXY_TYPE);

ALTER TABLE PUB_PROXY_PERMISSION
   ADD CONSTRAINT PROXYPRE_PK
     PRIMARY KEY(PROXY_PERMISSION_ID);

ALTER TABLE PUB_PROXY_PERMISSION_ITEM
    ADD CONSTRAINT PROXYPREITEM_PK
      PRIMARY KEY(PROXY_PERMISSION_ITEM_ID);
#######################################创建BSP中的相关外键的SQL##############################

###组织结构相关
ALTER TABLE PUB_ORGAN
    ADD CONSTRAINT PUBORGAN_FK1 FOREIGN KEY (ORGAN_TYPE)
    REFERENCES PUB_ORGAN_TYPE (ORGAN_TYPE);

ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_FK1 FOREIGN KEY (SRC_REF)
    REFERENCES PUB_ORGAN_TYPE (ORGAN_TYPE);

ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_FK2 FOREIGN KEY (TARGET_REF)
    REFERENCES PUB_ORGAN_TYPE (ORGAN_TYPE);

ALTER TABLE PUB_STRU_RULE
    ADD CONSTRAINT PUBSTRURULE_FK3 FOREIGN KEY (STRU_TYPE)
    REFERENCES PUB_STRU_TYPE (STRU_TYPE);

ALTER TABLE PUB_STRU
    ADD CONSTRAINT PUBSTRU_FK2 FOREIGN KEY (STRU_TYPE)
    REFERENCES PUB_STRU_TYPE (STRU_TYPE);

ALTER TABLE PUB_STRU_EXT
    ADD CONSTRAINT PUBSTRUEXT_FK3 FOREIGN KEY (STRU_TYPE)
    REFERENCES PUB_STRU_TYPE (STRU_TYPE);

ALTER TABLE PUB_STRU_EXT
    ADD CONSTRAINT PUBSTRUEXT_FK4 FOREIGN KEY (STRU_ID)
    REFERENCES PUB_STRU (STRU_ID);


####权限相关

########################################################菜单######################################
##菜单结构###
ALTER TABLE PUB_MENU_STRU
    ADD CONSTRAINT PUB_MENU_STRU_FK1 FOREIGN KEY (MENU_TYPE_ID)
    REFERENCES PUB_MENU_TYPE(MENU_TYPE_ID);
ALTER TABLE PUB_MENU_STRU
    ADD CONSTRAINT PUB_MENU_STRU_FK2 FOREIGN KEY (MENU_ID)
    REFERENCES PUB_MENU_ITEM(MENU_ID);
###################################################应用、模块、功能、操作########################################################
########模块########
ALTER TABLE PUB_MODULES
ADD CONSTRAINT PUB_MODULES_FK1 FOREIGN KEY (APP_CODE)
REFERENCES PUB_APPS(APP_CODE);
########功能########
ALTER TABLE PUB_FUNCTIONS
ADD CONSTRAINT PUB_FUNCTIONS_FK1 FOREIGN KEY (MODULE_CODE)
REFERENCES PUB_MODULES(MODULE_CODE);
########操作########
ALTER TABLE PUB_OPERATIONS
ADD CONSTRAINT PUB_OPERATIONS_FK1 FOREIGN KEY (FUNCTION_CODE)
REFERENCES PUB_FUNCTIONS(FUNCTION_CODE);

ALTER TABLE PUB_OPERATIONS
ADD CONSTRAINT PUB_OPERATIONS_FK2 FOREIGN KEY (OPERATION_TYPE_CODE)
REFERENCES PUB_OPERATION_TYPE(OPERATION_TYPE_CODE);
########操作url########
ALTER TABLE PUB_URLS
ADD CONSTRAINT PUB_URLS_FK1 FOREIGN KEY (OPERATION_CODE)
REFERENCES PUB_OPERATIONS(OPERATION_CODE);

ALTER TABLE PUB_URLS
ADD CONSTRAINT PUB_URLS_FK2 FOREIGN KEY (FUNCTION_CODE)
REFERENCES PUB_FUNCTIONS(FUNCTION_CODE);
##########角色继承######
ALTER TABLE PUB_ROLE_PRIVS
ADD CONSTRAINT PUB_ROLE_PRIVS_FK1 FOREIGN KEY (GRANTED_ROLE)
REFERENCES PUB_ROLES(ROLE_ID);
##########不相容角色######
ALTER TABLE PUB_CONF_ROLES
ADD CONSTRAINT PUB_CONF_ROLES_FK1 FOREIGN KEY (ROLE_ID)
REFERENCES PUB_ROLES(ROLE_ID);

ALTER TABLE PUB_CONF_ROLES
ADD CONSTRAINT PUB_CONF_ROLES_FK2 FOREIGN KEY (SET_ID)
REFERENCES PUB_CONF_ROLESET(SET_ID);
####################用户角色分配规则#####
ALTER TABLE PUB_USER_ROLE
ADD CONSTRAINT PUB_USER_ROLE_FK1 FOREIGN KEY (ROLE_ID)
REFERENCES PUB_ROLES(ROLE_ID);
##############角色操作对应#######
ALTER TABLE PUB_ROLE_OPERATION
ADD CONSTRAINT PUB_ROLE_O_FK1 FOREIGN KEY (OPERATION_CODE)
REFERENCES PUB_OPERATIONS(OPERATION_CODE);
ALTER TABLE PUB_ROLE_OPERATION
ADD CONSTRAINT PUB_ROLE_O_FK2 FOREIGN KEY (ROLE_ID)
REFERENCES PUB_ROLES(ROLE_ID);

####################权限代理#########
ALTER TABLE PUB_USER_PROXY
    ADD CONSTRAINT USERPROXY_FK1 FOREIGN KEY (USER_ID)
    REFERENCES PUB_USERS (USER_ID);

ALTER TABLE PUB_USER_PROXY
    ADD CONSTRAINT USERPROXY_FK2 FOREIGN KEY (PROXY_USER_ID)
    REFERENCES PUB_USERS (USER_ID);

ALTER TABLE PUB_PROXY_PERMISSION_ITEM
    ADD CONSTRAINT PROXYPERMITEM_FK1 FOREIGN KEY (PROXY_PERMISSION_ID)
    REFERENCES PUB_PROXY_PERMISSION (PROXY_PERMISSION_ID);

CREATE UNIQUE INDEX IDTABLE_IDX ON PUB_IDTABLE
(ID_ID ASC,ORGAN_ID ASC);

####20100622 添加数据字典模块#######
CREATE TABLE PUB_DICT (
      DICT_CODE VARCHAR(32) NOT NULL ,
      DICT_NAME VARCHAR(60) NOT NULL,
      SET_MAN VARCHAR(30),
      SET_TIME VARCHAR(17),
      NOTE  VARCHAR(100),
      IN_USE CHAR(1)
);

CREATE TABLE PUB_DICT_ITEM(
     ITEM_CODE VARCHAR(32) NOT NULL,
     DICT_CODE VARCHAR(32) NOT NULL,
     ITEM_VALUE VARCHAR(100) NOT NULL,
     XH INT,
     PARENT_CODE VARCHAR(32),
     NOTE VARCHAR(100),
     IN_USE CHAR (1) DEFAULT '1' NOT NULL
);

ALTER TABLE PUB_DICT
  ADD CONSTRAINT PUB_DICT_PK PRIMARY KEY (DICT_CODE);

ALTER TABLE PUB_DICT_ITEM
  ADD CONSTRAINT PUB_DICT_ITEM_PK PRIMARY KEY (DICT_CODE, ITEM_CODE);

#######20100825 给PUB_URL 建立索引
CREATE UNIQUE INDEX URL_CONTENT_INDEX ON PUB_URLS (URL_CONTENT);

##20100906创建收藏菜单
CREATE TABLE PUB_COLLECTMENU(
	            MENU_ID VARCHAR(30)  NOT NULL ,
	            USER_ID VARCHAR (30) NOT NULL ,
	            NAME VARCHAR (50) ,
	            ALIAS VARCHAR(50),
	            PARENT_ID  VARCHAR (30),
	            URL VARCHAR (500) ,
	            TARGET VARCHAR (10),
		        MENU_ORDER INT
);
ALTER TABLE PUB_COLLECTMENU ADD CONSTRAINT PUB_COLLECTMENU_PK PRIMARY KEY (MENU_ID, USER_ID);

##20100913用户映射
CREATE TABLE PUB_USER_MAP
(
            USER_ID VARCHAR (250) NOT NULL ,
            MAP_VALUE VARCHAR (250) NOT NULL,
			TYPE_ID CHAR(2) NOT NULL
);
 ALTER TABLE PUB_USER_MAP
    ADD CONSTRAINT PubUserMap_PK
	PRIMARY KEY (USER_ID,TYPE_ID);

##20100926LDAP用户同步
CREATE TABLE PUB_LDAP_SYN_USERS (
	USER_ID VARCHAR(32) NOT NULL,
	USER_NAME VARCHAR(32),
	PASSWORD VARCHAR(30),
	MOBILE VARCHAR(30),
	EMAIL VARCHAR(30)
)
;
ALTER TABLE PUB_LDAP_SYN_USERS ADD CONSTRAINT PUBLDAPSYNUSERS_PK
	PRIMARY KEY (USER_ID);
##20101221 添加索引
##20120921 修改索引
CREATE INDEX QUERYROLE ON PUB_USER_ROLE (TARGET);

#################20110331应用集成框架EAI建表SQL开始#################

###用户映射表PUB_USER_SSO
CREATE TABLE PUB_USER_SSO(
  USER_ID VARCHAR(30) NOT NULL,
  APP_CODE VARCHAR(30 ) NOT NULL,
  APP_USER_ID VARCHAR(30) NOT NULL,
  CERTIFICATE VARCHAR(250),
  PRIMARY KEY(USER_ID,APP_CODE),
  FOREIGN KEY(USER_ID) REFERENCES PUB_USERS(USER_ID),
  FOREIGN KEY(APP_CODE) REFERENCES PUB_APPS(APP_CODE)

);

####服务补偿表PUB_USER_SSO
CREATE TABLE PUB_WEBSERVICE_COMPENSATION(
	 ID varchar(30) NOT NULL,
	 APP_CODE varchar(30) NOT NULL,
	 WEBSERVICE_ADDRESS varchar (30),
	 OPERATION varchar (30),
	 OBJECT_VALUE varchar (1024),
	 CREATE_TIME char (17)
);

###角色和应用关系表PUB_ROLE_EXT
CREATE TABLE PUB_ROLE_EXT(
ROLE_ID VARCHAR(30) not null,
APP_CODE VARCHAR(30) not null
);

##建立菜单类型映射表
CREATE TABLE PUB_MENU_TYPE_MAP
(
	SRC_TYPE VARCHAR(10) NOT NULL,
	MENU_TYPE_ID VARCHAR(10) NOT NULL	
);
ALTER TABLE PUB_MENU_TYPE_MAP
   ADD CONSTRAINT MENUTYPEMAP_PK
     PRIMARY KEY(SRC_TYPE);
ALTER TABLE PUB_WEBSERVICE_COMPENSATION
   ADD CONSTRAINT COMPENSATION_PK
     PRIMARY KEY(ID);

ALTER TABLE PUB_ROLE_EXT
   ADD CONSTRAINT  PUBROLEEXT_PK
       PRIMARY KEY(ROLE_ID,APP_CODE);

ALTER TABLE PUB_ROLE_EXT
    ADD CONSTRAINT PUBROLEEXT_FK1 FOREIGN KEY (ROLE_ID)
    REFERENCES PUB_ROLES (ROLE_ID);

ALTER TABLE PUB_ROLE_EXT
    ADD CONSTRAINT PUBROLEEXT_FK2 FOREIGN KEY (APP_CODE)
    REFERENCES PUB_APPS (APP_CODE);

    
#################20110331应用集成框架EAI建表SQL结束#################   

##############20110421用户表和用户类型表建立外键关联#################
ALTER TABLE PUB_USERS
    ADD CONSTRAINT PUBUSERS_FK2 FOREIGN KEY (USER_TYPE_CODE)
    REFERENCES PUB_USER_TYPE (USER_TYPE_CODE);

###安全审计日志PUB_SECURITY_AUDIT_LOG
CREATE TABLE PUB_SECURITY_AUDIT_LOG(
  LOG_ID VARCHAR(30) NOT NULL,
  USER_ID VARCHAR(30) NOT NULL,
  USER_NAME VARCHAR(30) NOT NULL,
  DEPARTMENT_ID VARCHAR(30),
  CORPORATION_ID VARCHAR(30),
  LOG_TIME CHAR(17) NOT NULL,
  LOGIN_IP VARCHAR(32) NOT NULL,
  SERVER_IP VARCHAR(32) NOT NULL,
  LOG_TYPE VARCHAR(150) NOT NULL,
  OPERATION_CODE VARCHAR(30),
  URL VARCHAR(500)
);

ALTER TABLE PUB_SECURITY_AUDIT_LOG
   ADD CONSTRAINT  PUBAUDITLOG_PK
       PRIMARY KEY(LOG_ID);

###给用户认证管理策略添加外键
ALTER TABLE PUB_USER_AUTH
    ADD CONSTRAINT USER_AUTH FOREIGN KEY (USER_ID)
    REFERENCES PUB_USERS (USER_ID);

    
###建立用户应用映射表
CREATE TABLE PUB_USER_APP (
       USER_ID VARCHAR(30),
       APP_ID VARCHAR(30)
);

ALTER TABLE PUB_USER_APP
    ADD CONSTRAINT USER_APP_FK1 FOREIGN KEY (USER_ID)
    REFERENCES PUB_USERS (USER_ID);

ALTER TABLE PUB_USER_APP
    ADD CONSTRAINT USER_APP_FK2 FOREIGN KEY (APP_ID)
    REFERENCES PUB_APPS (APP_CODE);
###增加索引
CREATE INDEX SEQ_IDX ON PUB_MENU_STRU(SEQ);
CREATE INDEX DPT_ID_IDX ON PUB_USER_EMPLOYEE (DEPARTMENT_ID);
CREATE INDEX EMPLOYEE_ID_IDX ON PUB_USER_EMPLOYEE (EMPLOYEE_ID);
CREATE INDEX ORGAN_ID_IDX ON PUB_STRU (ORGAN_ID);
CREATE INDEX PUD_CODE_IDX ON PUB_USER_DATA(CODE);

-- 用户中心
-- 用户基本属性
CREATE TABLE PUB_USER_BASE
(
	USER_ID       VARCHAR(30) NOT NULL,
	BIRTHDAY      VARCHAR(8),
	EMAIL         VARCHAR(100),
	ID_NO         VARCHAR(18),
	MOBILE        VARCHAR(15),
	TELEPHONE     VARCHAR(15),
	GENDER        CHAR(1),
	QQ            VARCHAR(10),
	HOME_ADDRESS  VARCHAR(200),
	WORK_ADDRESS  VARCHAR(200)
);

-- 用户密保
CREATE TABLE PUB_PWD_PROTECT
(
	USER_ID   VARCHAR(30) NOT NULL,
	QUESTION  VARCHAR(200),
	ANSWER    VARCHAR(200)
);

-- 主题（皮肤）
CREATE TABLE PUB_THEME
(
	THEME_ID   VARCHAR(30) NOT NULL,
	THEME_URL  VARCHAR(50),
	ICON       VARCHAR(100)
);

-- 用户主题（皮肤）
CREATE TABLE PUB_USER_THEME
(
	USER_ID   VARCHAR(30) NOT NULL,
	THEME_ID  VARCHAR(30)
);

-- 用户日程
CREATE TABLE PUB_USER_SCHEDULE
(
	USER_ID            VARCHAR(30) NOT NULL,
	SCHEDULE_ID        VARCHAR(30) NOT NULL,
	SCHEDULE_NAME      VARCHAR(200),
	PLACE              VARCHAR(200),
	BEGIN_TIME         CHAR(17),
	END_TIME           CHAR(17),
	DESCRIPTION        VARCHAR(200),
	REMIDER_INTERVAL   INT,
	REMIDER_TIME_UNIT  VARCHAR(4)
);

-- 用户日程参与者
CREATE TABLE PUB_SCHEDULE_ACTOR
(
	SCHEDULE_ID  VARCHAR(30) NOT NULL,
	ORGAN_ID     VARCHAR(30) NOT NULL,
	ORGAN_TYPE   VARCHAR(10)
);

-- 用户密码修改历史
CREATE TABLE PUB_PWD_HISTORY
(
	USER_ID    VARCHAR(30) NOT NULL,
	PASSWORD   VARCHAR(200) NOT NULL,
	UPDT_TIME  VARCHAR(17) NOT NULL
);

ALTER TABLE PUB_PWD_PROTECT ADD CONSTRAINT PK_PUB_PSWD_PROTECT 
	PRIMARY KEY (USER_ID);

ALTER TABLE PUB_USER_THEME ADD CONSTRAINT PK_PUB_USER_THEME 
	PRIMARY KEY (USER_ID);

ALTER TABLE PUB_SCHEDULE_ACTOR ADD CONSTRAINT PK_PUB_SCHEDULE_ACTOR 
	PRIMARY KEY (SCHEDULE_ID, ORGAN_ID);

ALTER TABLE PUB_USER_SCHEDULE ADD CONSTRAINT PK_PUB_USER_SCHEDULE 
	PRIMARY KEY (USER_ID, SCHEDULE_ID);

ALTER TABLE PUB_PWD_HISTORY ADD CONSTRAINT PK_PUB_PSWD_HISTORY 
	PRIMARY KEY (USER_ID, PASSWORD);

ALTER TABLE PUB_THEME ADD CONSTRAINT PK_PUB_THEME 
	PRIMARY KEY (THEME_ID);

ALTER TABLE PUB_USER_BASE ADD CONSTRAINT PK_PUB_USER_BASE 
	PRIMARY KEY (USER_ID);
