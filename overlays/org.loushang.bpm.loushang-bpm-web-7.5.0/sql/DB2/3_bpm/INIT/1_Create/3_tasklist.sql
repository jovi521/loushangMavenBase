----------------------------------物理表----------------------------------
 --待办任务列表
CREATE TABLE WF_DAI_BAN_TASK
(
            ID VARCHAR (32) NOT NULL ,
            ORGAN_ID VARCHAR (32) NOT NULL ,
            ORGAN_NAME VARCHAR (100) NOT NULL ,
            CREATE_TIME CHAR (17) NOT NULL ,
            ACTIVITY_ID VARCHAR (32) ,
            ACT_DEF_UNIQUE_ID VARCHAR (32) ,
            ACT_DEF_ID VARCHAR (32) ,
            ACT_DEF_NAME VARCHAR (100) ,
            ACT_LIMIT_TIME CHAR(17) ,
            ACT_WARN_TIME CHAR(17) ,
            PROCESS_ID VARCHAR (32) ,
            PROC_DEF_UNIQUE_ID VARCHAR (32) ,
            PROC_DEF_ID VARCHAR (32) ,
            PROC_DEF_NAME VARCHAR (100) ,
            PROC_CREATE_TIME CHAR (17) ,
            PROC_CREATOR_ID VARCHAR (32) ,
            PROC_CREATOR_NAME VARCHAR (100) ,
            PRE_ACT_DEF_NAMES VARCHAR (255) ,
            PRE_ORGAN_NAMES VARCHAR (255) ,
            PRIMARY_KEY VARCHAR (32) ,
            PROCESS_TYPE VARCHAR (32) ,
            IS_VISIBLE CHAR (1),
            SYS_SUBJECT VARCHAR(512),
            PROC_SUBJECT VARCHAR(512),
            TYPE_SUBJECT VARCHAR(512),
            SUBJECT VARCHAR(255) ,
            APP_CODE VARCHAR(30) ,
            RELATIVE_PATH VARCHAR(512) ,
            INTERNAL_ID VARCHAR(100)

);
ALTER TABLE WF_DAI_BAN_TASK
    ADD CONSTRAINT WFDAIBANTASK_PK 
    PRIMARY KEY (ID);

--已办任务列表
CREATE TABLE WF_YI_BAN_TASK
(
            ID VARCHAR (32) NOT NULL ,
            ORGAN_ID VARCHAR (32) NOT NULL ,
            ORGAN_NAME VARCHAR (100) NOT NULL ,
            CREATE_TIME CHAR (17) NOT NULL ,
            END_TIME CHAR (17) ,
            ACTIVITY_ID VARCHAR (32) ,
            ACT_DEF_UNIQUE_ID VARCHAR (32) ,
            ACT_DEF_ID VARCHAR (32) ,
            ACT_DEF_NAME VARCHAR (100) ,
            PROCESS_ID VARCHAR (32) ,
            PROC_DEF_UNIQUE_ID VARCHAR (32) ,
            PROC_DEF_ID VARCHAR (32) ,
            PROC_DEF_NAME VARCHAR (100) ,
            PROC_CREATE_TIME CHAR (17) ,
            PROC_END_TIME CHAR (17) ,
            PROC_CREATOR_ID VARCHAR (32) ,
            PROC_CREATOR_NAME VARCHAR (100) ,
            IS_PROC_END CHAR (1)  WITH DEFAULT ' ',
            ACTIVE_ACT_DEF_NAMES VARCHAR (255) ,
            ACTIVE_ORGAN_NAMES VARCHAR (255) ,
            PRIMARY_KEY VARCHAR (32) ,
            PROCESS_TYPE VARCHAR (32),
            SYS_SUBJECT VARCHAR(512),
            PROC_SUBJECT VARCHAR(512),
            TYPE_SUBJECT VARCHAR(512),
            SUBJECT VARCHAR(255) ,
            APP_CODE VARCHAR(30) ,
            RELATIVE_PATH VARCHAR(512) ,
            INTERNAL_ID VARCHAR(100)
);
ALTER TABLE WF_YI_BAN_TASK
    ADD CONSTRAINT WFYIBANTASK_PK 
    PRIMARY KEY (ID);

--办结任务列表
CREATE TABLE WF_END_TASK
(
            ID VARCHAR (32) NOT NULL ,
            ORGAN_ID VARCHAR (32) NOT NULL ,
            ORGAN_NAME VARCHAR (100) NOT NULL ,
            CREATE_TIME CHAR (17) NOT NULL ,
            END_TIME CHAR (17) ,
            ACTIVITY_ID VARCHAR (32) ,
            ACT_DEF_UNIQUE_ID VARCHAR (32) ,
            ACT_DEF_ID VARCHAR (32) ,
            ACT_DEF_NAME VARCHAR (100) ,
            PROCESS_ID VARCHAR (32) ,
            PROC_DEF_UNIQUE_ID VARCHAR (32) ,
            PROC_DEF_ID VARCHAR (32) ,
            PROC_DEF_NAME VARCHAR (100) ,
            PROC_CREATE_TIME CHAR (17) ,
            PROC_END_TIME CHAR (17) ,
            PRIMARY_KEY VARCHAR (32) ,
            PROCESS_TYPE VARCHAR (32),
            SYS_SUBJECT VARCHAR(512),
            PROC_SUBJECT VARCHAR(512),
            TYPE_SUBJECT VARCHAR(512),
            SUBJECT VARCHAR(255),
            TASK_URL VARCHAR(400) ,
            APP_CODE VARCHAR(30) ,
            RELATIVE_PATH VARCHAR(512) ,
            INTERNAL_ID VARCHAR(100)
);
ALTER TABLE WF_END_TASK
    ADD CONSTRAINT WFENDTASK_PK 
    PRIMARY KEY (ID);

----------------------------------试图----------------------------------
--待办任务视图
CREATE VIEW WF_DAIBAN_TASK_VIEW AS 
SELECT WF_DAI_BAN_TASK.ID AS ID, WF_DAI_BAN_TASK.ORGAN_ID, WF_DAI_BAN_TASK.ORGAN_NAME, WF_DAI_BAN_TASK.CREATE_TIME, 
WF_DAI_BAN_TASK.ACTIVITY_ID, WF_DAI_BAN_TASK.ACT_DEF_UNIQUE_ID, WF_DAI_BAN_TASK.ACT_DEF_ID, WF_DAI_BAN_TASK.ACT_DEF_NAME, WF_DAI_BAN_TASK.ACT_LIMIT_TIME, WF_DAI_BAN_TASK.ACT_WARN_TIME, 
WF_DAI_BAN_TASK.PROCESS_ID, WF_DAI_BAN_TASK.PROC_DEF_UNIQUE_ID, WF_DAI_BAN_TASK.PROC_DEF_ID, WF_DAI_BAN_TASK.PROC_DEF_NAME, WF_DAI_BAN_TASK.PROC_CREATE_TIME, 
WF_DAI_BAN_TASK.PRE_ACT_DEF_NAMES, WF_DAI_BAN_TASK.PRE_ORGAN_NAMES, 
WF_TRIP_PROXY_ASSIGNMENT.ORIGINAL_ORGAN_ID, WF_TRIP_PROXY_ASSIGNMENT.ORIGINAL_ORGAN_NAME, 
WF_DAI_BAN_TASK.PRIMARY_KEY, WF_DAI_BAN_TASK.PROCESS_TYPE, WF_DAI_BAN_TASK.IS_VISIBLE, WF_DAI_BAN_TASK.TYPE_SUBJECT, WF_DAI_BAN_TASK.SUBJECT, WF_DAI_BAN_TASK.APP_CODE, WF_DAI_BAN_TASK.RELATIVE_PATH, WF_DAI_BAN_TASK.INTERNAL_ID
FROM WF_DAI_BAN_TASK LEFT JOIN WF_TRIP_PROXY_ASSIGNMENT 
ON WF_DAI_BAN_TASK.ID=WF_TRIP_PROXY_ASSIGNMENT.ASSIGNMENT_ID;


--已办任务视图
CREATE VIEW WF_YIBAN_TASK_VIEW AS
SELECT WF_YI_BAN_TASK.ID AS ID, WF_YI_BAN_TASK.ORGAN_ID , WF_YI_BAN_TASK.ORGAN_NAME , WF_YI_BAN_TASK.CREATE_TIME , WF_YI_BAN_TASK.END_TIME , 
WF_YI_BAN_TASK.ACTIVITY_ID , WF_YI_BAN_TASK.ACT_DEF_UNIQUE_ID , WF_YI_BAN_TASK.ACT_DEF_ID , WF_YI_BAN_TASK.ACT_DEF_NAME , 
WF_YI_BAN_TASK.PROCESS_ID , WF_YI_BAN_TASK.PROC_DEF_UNIQUE_ID , WF_YI_BAN_TASK.PROC_DEF_ID , WF_YI_BAN_TASK.PROC_DEF_NAME , WF_YI_BAN_TASK.PROC_CREATE_TIME , 
WF_YI_BAN_TASK.ACTIVE_ACT_DEF_NAMES ,WF_YI_BAN_TASK.ACTIVE_ORGAN_NAMES , 
WF_TRIP_PROXY_ASSIGNMENT.ORIGINAL_ORGAN_ID ,WF_TRIP_PROXY_ASSIGNMENT.ORIGINAL_ORGAN_NAME , 
WF_YI_BAN_TASK.PRIMARY_KEY , WF_YI_BAN_TASK.PROCESS_TYPE , WF_YI_BAN_TASK.TYPE_SUBJECT, WF_YI_BAN_TASK.SUBJECT, WF_YI_BAN_TASK.SYS_SUBJECT, WF_YI_BAN_TASK.PROC_SUBJECT,
WF_YI_BAN_TASK.APP_CODE , WF_YI_BAN_TASK.RELATIVE_PATH , WF_YI_BAN_TASK.INTERNAL_ID, WF_ACTIVITY_LIMIT.LIMIT_TIME AS ACT_LIMIT_TIME, WF_ACTIVITY_WARN.WARN_TIME AS ACT_WARN_TIME
FROM WF_YI_BAN_TASK 
LEFT JOIN WF_TRIP_PROXY_ASSIGNMENT ON WF_YI_BAN_TASK.ID=WF_TRIP_PROXY_ASSIGNMENT.ASSIGNMENT_ID
LEFT JOIN WF_ACTIVITY_LIMIT ON WF_YI_BAN_TASK.ACTIVITY_ID=WF_ACTIVITY_LIMIT.ACTIVITY_ID 
LEFT JOIN WF_ACTIVITY_WARN ON WF_YI_BAN_TASK.ACTIVITY_ID=WF_ACTIVITY_WARN.ACTIVITY_ID
WHERE IS_PROC_END <> '1';

--办结任务视图
CREATE VIEW WF_END_TASK_VIEW AS
SELECT WF_YI_BAN_TASK.ID AS ID ,WF_YI_BAN_TASK.ORGAN_ID ,WF_YI_BAN_TASK.ORGAN_NAME ,WF_YI_BAN_TASK.CREATE_TIME ,WF_YI_BAN_TASK.END_TIME ,
WF_YI_BAN_TASK.ACTIVITY_ID ,WF_YI_BAN_TASK.ACT_DEF_UNIQUE_ID ,WF_YI_BAN_TASK.ACT_DEF_ID ,WF_YI_BAN_TASK.ACT_DEF_NAME ,
WF_YI_BAN_TASK.PROCESS_ID ,WF_YI_BAN_TASK.PROC_DEF_UNIQUE_ID ,WF_YI_BAN_TASK.PROC_DEF_ID ,WF_YI_BAN_TASK.PROC_DEF_NAME ,WF_YI_BAN_TASK.PROC_CREATE_TIME ,WF_YI_BAN_TASK.PROC_END_TIME ,
WF_TRIP_PROXY_ASSIGNMENT_END.ORIGINAL_ORGAN_ID ,WF_TRIP_PROXY_ASSIGNMENT_END.ORIGINAL_ORGAN_NAME ,
WF_YI_BAN_TASK.PRIMARY_KEY ,WF_YI_BAN_TASK.PROCESS_TYPE , WF_YI_BAN_TASK.TYPE_SUBJECT,  WF_YI_BAN_TASK.SUBJECT, WF_YI_BAN_TASK.SYS_SUBJECT, WF_YI_BAN_TASK.PROC_SUBJECT, 
WF_YI_BAN_TASK.APP_CODE ,WF_YI_BAN_TASK.RELATIVE_PATH ,WF_YI_BAN_TASK.INTERNAL_ID, WF_ACTIVITY_LIMIT_END.LIMIT_TIME AS ACT_LIMIT_TIME, WF_ACTIVITY_WARN_END.WARN_TIME AS ACT_WARN_TIME
FROM WF_YI_BAN_TASK 
LEFT JOIN WF_TRIP_PROXY_ASSIGNMENT_END ON WF_YI_BAN_TASK.ID=WF_TRIP_PROXY_ASSIGNMENT_END.ASSIGNMENT_ID
LEFT JOIN WF_ACTIVITY_LIMIT_END ON WF_YI_BAN_TASK.ACTIVITY_ID=WF_ACTIVITY_LIMIT_END.ACTIVITY_ID 
LEFT JOIN WF_ACTIVITY_WARN_END ON WF_YI_BAN_TASK.ACTIVITY_ID=WF_ACTIVITY_WARN_END.ACTIVITY_ID
WHERE IS_PROC_END = '1'
UNION ALL
SELECT WF_END_TASK.ID AS ID ,WF_END_TASK.ORGAN_ID ,WF_END_TASK.ORGAN_NAME ,WF_END_TASK.CREATE_TIME ,WF_END_TASK.END_TIME ,
WF_END_TASK.ACTIVITY_ID ,WF_END_TASK.ACT_DEF_UNIQUE_ID ,WF_END_TASK.ACT_DEF_ID ,WF_END_TASK.ACT_DEF_NAME ,
WF_END_TASK.PROCESS_ID ,WF_END_TASK.PROC_DEF_UNIQUE_ID ,WF_END_TASK.PROC_DEF_ID ,WF_END_TASK.PROC_DEF_NAME ,WF_END_TASK.PROC_CREATE_TIME ,WF_END_TASK.PROC_END_TIME ,
WF_TRIP_PROXY_ASSIGNMENT_END.ORIGINAL_ORGAN_ID ,WF_TRIP_PROXY_ASSIGNMENT_END.ORIGINAL_ORGAN_NAME ,
WF_END_TASK.PRIMARY_KEY ,WF_END_TASK.PROCESS_TYPE , WF_END_TASK.TYPE_SUBJECT, WF_END_TASK.SUBJECT, WF_END_TASK.SYS_SUBJECT, WF_END_TASK.PROC_SUBJECT,
WF_END_TASK.APP_CODE ,WF_END_TASK.RELATIVE_PATH ,WF_END_TASK.INTERNAL_ID, WF_ACTIVITY_LIMIT_END.LIMIT_TIME AS ACT_LIMIT_TIME, WF_ACTIVITY_WARN_END.WARN_TIME AS ACT_WARN_TIME
FROM WF_END_TASK 
LEFT JOIN WF_TRIP_PROXY_ASSIGNMENT_END ON WF_END_TASK.ID=WF_TRIP_PROXY_ASSIGNMENT_END.ASSIGNMENT_ID
LEFT JOIN WF_ACTIVITY_LIMIT_END ON WF_END_TASK.ACTIVITY_ID=WF_ACTIVITY_LIMIT_END.ACTIVITY_ID 
LEFT JOIN WF_ACTIVITY_WARN_END ON WF_END_TASK.ACTIVITY_ID=WF_ACTIVITY_WARN_END.ACTIVITY_ID;

--已办办结任务合并视图
CREATE VIEW WF_YIBAN_END_TASK_VIEW AS
SELECT WF_YIBAN_TASK_VIEW.ID ,WF_YIBAN_TASK_VIEW.ORGAN_ID ,WF_YIBAN_TASK_VIEW.ORGAN_NAME ,WF_YIBAN_TASK_VIEW.CREATE_TIME ,WF_YIBAN_TASK_VIEW.END_TIME ,
WF_YIBAN_TASK_VIEW.ACTIVITY_ID ,WF_YIBAN_TASK_VIEW.ACT_DEF_UNIQUE_ID ,WF_YIBAN_TASK_VIEW.ACT_DEF_ID ,WF_YIBAN_TASK_VIEW.ACT_DEF_NAME ,
WF_YIBAN_TASK_VIEW.PROCESS_ID ,WF_YIBAN_TASK_VIEW.PROC_DEF_UNIQUE_ID ,WF_YIBAN_TASK_VIEW.PROC_DEF_ID ,WF_YIBAN_TASK_VIEW.PROC_DEF_NAME ,WF_YIBAN_TASK_VIEW.PROC_CREATE_TIME ,
WF_YIBAN_TASK_VIEW.ACTIVE_ACT_DEF_NAMES ,WF_YIBAN_TASK_VIEW.ACTIVE_ORGAN_NAMES ,'' AS PROC_END_TIME , 
WF_YIBAN_TASK_VIEW.ORIGINAL_ORGAN_ID ,WF_YIBAN_TASK_VIEW.ORIGINAL_ORGAN_NAME , WF_YIBAN_TASK_VIEW.PRIMARY_KEY ,WF_YIBAN_TASK_VIEW.PROCESS_TYPE ,
WF_YIBAN_TASK_VIEW.SUBJECT ,WF_YIBAN_TASK_VIEW.SYS_SUBJECT , WF_YIBAN_TASK_VIEW.PROC_SUBJECT ,WF_YIBAN_TASK_VIEW.TYPE_SUBJECT, 
WF_YIBAN_TASK_VIEW.APP_CODE ,WF_YIBAN_TASK_VIEW.RELATIVE_PATH ,WF_YIBAN_TASK_VIEW.INTERNAL_ID , WF_YIBAN_TASK_VIEW.ACT_LIMIT_TIME , WF_YIBAN_TASK_VIEW.ACT_WARN_TIME
FROM WF_YIBAN_TASK_VIEW
UNION ALL
SELECT WF_END_TASK_VIEW.ID ,WF_END_TASK_VIEW.ORGAN_ID ,WF_END_TASK_VIEW.ORGAN_NAME ,WF_END_TASK_VIEW.CREATE_TIME ,WF_END_TASK_VIEW.END_TIME ,
WF_END_TASK_VIEW.ACTIVITY_ID ,WF_END_TASK_VIEW.ACT_DEF_UNIQUE_ID ,WF_END_TASK_VIEW.ACT_DEF_ID ,WF_END_TASK_VIEW.ACT_DEF_NAME ,
WF_END_TASK_VIEW.PROCESS_ID ,WF_END_TASK_VIEW.PROC_DEF_UNIQUE_ID ,WF_END_TASK_VIEW.PROC_DEF_ID ,WF_END_TASK_VIEW.PROC_DEF_NAME ,WF_END_TASK_VIEW.PROC_CREATE_TIME ,
'' AS ACTIVE_ACT_DEF_NAMES ,'' AS ACTIVE_ORGAN_NAMES ,WF_END_TASK_VIEW.PROC_END_TIME , WF_END_TASK_VIEW.ORIGINAL_ORGAN_ID ,WF_END_TASK_VIEW.ORIGINAL_ORGAN_NAME ,
WF_END_TASK_VIEW.PRIMARY_KEY ,WF_END_TASK_VIEW.PROCESS_TYPE ,WF_END_TASK_VIEW.SUBJECT ,WF_END_TASK_VIEW.SYS_SUBJECT , WF_END_TASK_VIEW.PROC_SUBJECT , 
WF_END_TASK_VIEW.TYPE_SUBJECT, WF_END_TASK_VIEW.APP_CODE ,WF_END_TASK_VIEW.RELATIVE_PATH ,WF_END_TASK_VIEW.INTERNAL_ID , 
WF_END_TASK_VIEW.ACT_LIMIT_TIME , WF_END_TASK_VIEW.ACT_WARN_TIME
FROM WF_END_TASK_VIEW;


--监控任务视图
CREATE VIEW WF_MONITOR_TASK_VIEW AS
SELECT 
WF_DAIBAN_TASK_VIEW.PROCESS_ID, WF_DAIBAN_TASK_VIEW.PROCESS_TYPE, WF_DAIBAN_TASK_VIEW.PROC_DEF_UNIQUE_ID, WF_DAIBAN_TASK_VIEW.PROC_DEF_ID,
WF_DAIBAN_TASK_VIEW.PROC_DEF_NAME, WF_DAIBAN_TASK_VIEW.PROC_CREATE_TIME,WF_DAIBAN_TASK_VIEW.ACTIVITY_ID,WF_DAIBAN_TASK_VIEW.ACT_DEF_UNIQUE_ID,
WF_DAIBAN_TASK_VIEW.ACT_DEF_ID, WF_DAIBAN_TASK_VIEW.ACT_DEF_NAME, WF_DAIBAN_TASK_VIEW.ID AS ASSIGNMENT_ID, WF_DAIBAN_TASK_VIEW.ORGAN_ID,
WF_DAIBAN_TASK_VIEW.ORGAN_NAME, WF_DAIBAN_TASK_VIEW.CREATE_TIME AS ASS_CREATE_TIME, WF_DAIBAN_TASK_VIEW.ORIGINAL_ORGAN_ID , WF_DAIBAN_TASK_VIEW.ORIGINAL_ORGAN_NAME,
WF_PROCESS_MONITOR.ORGAN_ID AS MONITOR_ORGAN_ID, WF_DAIBAN_TASK_VIEW.SUBJECT, WF_DAIBAN_TASK_VIEW.TYPE_SUBJECT
FROM WF_DAIBAN_TASK_VIEW, WF_PROCESS_MONITOR
WHERE WF_DAIBAN_TASK_VIEW.PROCESS_ID=WF_PROCESS_MONITOR.PROCESS_ID AND WF_DAIBAN_TASK_VIEW.IS_VISIBLE='1';


--出差代理已办任务视图
CREATE VIEW WF_TRIP_PROXY_YIBAN_TASK_VIEW AS 
SELECT WF_YI_BAN_TASK.ID ,WF_YI_BAN_TASK.ORGAN_ID ,WF_YI_BAN_TASK.ORGAN_NAME ,WF_TRIP_PROXY_ASSIGNMENT.ORIGINAL_ORGAN_ID ,WF_TRIP_PROXY_ASSIGNMENT.ORIGINAL_ORGAN_NAME,
WF_YI_BAN_TASK.CREATE_TIME ,WF_YI_BAN_TASK.END_TIME ,
WF_YI_BAN_TASK.ACTIVITY_ID ,WF_YI_BAN_TASK.ACT_DEF_UNIQUE_ID ,WF_YI_BAN_TASK.ACT_DEF_ID ,WF_YI_BAN_TASK.ACT_DEF_NAME ,
WF_YI_BAN_TASK.PROCESS_ID ,WF_YI_BAN_TASK.PROC_DEF_UNIQUE_ID ,WF_YI_BAN_TASK.PROC_DEF_ID ,WF_YI_BAN_TASK.PROC_DEF_NAME ,
WF_YI_BAN_TASK.PROC_CREATE_TIME ,WF_YI_BAN_TASK.PROC_END_TIME ,WF_YI_BAN_TASK.PROC_CREATOR_ID , WF_YI_BAN_TASK.PROC_CREATOR_NAME ,WF_YI_BAN_TASK.IS_PROC_END ,
WF_YI_BAN_TASK.PROCESS_TYPE ,WF_YI_BAN_TASK.SUBJECT ,WF_YI_BAN_TASK.APP_CODE ,WF_YI_BAN_TASK.RELATIVE_PATH ,WF_YI_BAN_TASK.INTERNAL_ID
FROM WF_YI_BAN_TASK,WF_TRIP_PROXY_ASSIGNMENT 
WHERE WF_YI_BAN_TASK.ID=WF_TRIP_PROXY_ASSIGNMENT.ASSIGNMENT_ID 
UNION ALL 
SELECT WF_YI_BAN_TASK.ID ,WF_YI_BAN_TASK.ORGAN_ID ,WF_YI_BAN_TASK.ORGAN_NAME ,WF_TRIP_PROXY_ASSIGNMENT_END.ORIGINAL_ORGAN_ID ,WF_TRIP_PROXY_ASSIGNMENT_END.ORIGINAL_ORGAN_NAME,
WF_YI_BAN_TASK.CREATE_TIME ,WF_YI_BAN_TASK.END_TIME ,
WF_YI_BAN_TASK.ACTIVITY_ID ,WF_YI_BAN_TASK.ACT_DEF_UNIQUE_ID ,WF_YI_BAN_TASK.ACT_DEF_ID ,WF_YI_BAN_TASK.ACT_DEF_NAME ,
WF_YI_BAN_TASK.PROCESS_ID ,WF_YI_BAN_TASK.PROC_DEF_UNIQUE_ID ,WF_YI_BAN_TASK.PROC_DEF_ID ,WF_YI_BAN_TASK.PROC_DEF_NAME ,
WF_YI_BAN_TASK.PROC_CREATE_TIME ,WF_YI_BAN_TASK.PROC_END_TIME ,WF_YI_BAN_TASK.PROC_CREATOR_ID , WF_YI_BAN_TASK.PROC_CREATOR_NAME ,WF_YI_BAN_TASK.IS_PROC_END ,
WF_YI_BAN_TASK.PROCESS_TYPE ,WF_YI_BAN_TASK.SUBJECT ,WF_YI_BAN_TASK.APP_CODE ,WF_YI_BAN_TASK.RELATIVE_PATH ,WF_YI_BAN_TASK.INTERNAL_ID
FROM WF_YI_BAN_TASK,WF_TRIP_PROXY_ASSIGNMENT_END 
WHERE WF_YI_BAN_TASK.ID=WF_TRIP_PROXY_ASSIGNMENT_END.ASSIGNMENT_ID;

--20101013增加系统默认的标题
CREATE TABLE WF_PROC_SUBJECT(
	ID VARCHAR(32) NOT NULL PRIMARY KEY,
	PROCESS_ID VARCHAR(32) NOT NULL,
	SUBJECT VARCHAR(255) NOT NULL
);

--20110108增加流程类型任务页面按钮配置
CREATE TABLE WF_TYPE_TASK_LIST_PAGE_BTN_DEF(
	ID VARCHAR(32) NOT NULL PRIMARY KEY,
	PROC_TYPE_ID VARCHAR(32) NOT NULL,
	BTN_FUNC VARCHAR(100) NOT NULL,
	BTN_NAME VARCHAR(100) NOT NULL,
	JS_FILE_PATH VARCHAR(100) NOT NULL
);

