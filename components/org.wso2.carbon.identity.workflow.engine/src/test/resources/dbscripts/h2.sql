CREATE TABLE IF NOT EXISTS WF_REQUEST (
    UUID VARCHAR (45),
    CREATED_BY VARCHAR (255),
    TENANT_ID INTEGER DEFAULT -1,
    OPERATION_TYPE VARCHAR (50),
    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP,
    STATUS VARCHAR (30),
    REQUEST BLOB,
    PRIMARY KEY (UUID)
);

CREATE TABLE IF NOT EXISTS WF_WORKFLOW(
    ID VARCHAR (45),
    WF_NAME VARCHAR (45),
    DESCRIPTION VARCHAR (255),
    TEMPLATE_ID VARCHAR (45),
    IMPL_ID VARCHAR (45),
    TENANT_ID INTEGER DEFAULT -1,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS WF_WORKFLOW_APPROVAL_RELATION (
    TASK_ID VARCHAR(45) NOT NULL,
    EVENT_ID VARCHAR(45) NOT NULL,
    WORKFLOW_ID VARCHAR(45) NOT NULL,
    APPROVER_TYPE VARCHAR(45) NOT NULL,
    APPROVER_NAME VARCHAR(255) NOT NULL,
    TASK_STATUS VARCHAR(255),
    CONSTRAINT PK_WF_WORKFLOW_RELATION_CONSTRAINT PRIMARY KEY (TASK_ID, APPROVER_TYPE, APPROVER_NAME)
);

CREATE TABLE IF NOT EXISTS WF_WORKFLOW_APPROVAL_STATE (
    EVENT_ID VARCHAR(45) NOT NULL,
    WORKFLOW_ID VARCHAR(45) NOT NULL,
    CURRENT_STEP INTEGER,
    CONSTRAINT PK_WF_APPROVAL_STATE_CONSTRAINT PRIMARY KEY (EVENT_ID, WORKFLOW_ID)
);

