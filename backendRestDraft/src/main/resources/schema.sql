CREATE TABLE
    USER
    (
        id UUID PRIMARY KEY,
        username VARCHAR(255),
        password VARCHAR(255),
        firstname VARCHAR(255),
        lastname VARCHAR(255),
        email VARCHAR(255),
        address VARCHAR(255),
        phone VARCHAR(255)
    );
CREATE TABLE
    ROLE
    (
        id UUID PRIMARY KEY,
        role VARCHAR(255)
    );
CREATE TABLE
    USER_ROLES
    (
        user_id UUID REFERENCES USER(id),
        role_id UUID REFERENCES role(id),
        PRIMARY KEY(user_id, role_id)
    );
CREATE TABLE
    CACHEDS3BUCKET
    (
        ID UUID NOT NULL PRIMARY KEY,
        CREATED TIMESTAMP,
        LAST_MODIFIED TIMESTAMP,
        NAME VARCHAR(255)
    );
CREATE TABLE
    CACHEDS3OBJECT
    (
        NAME VARCHAR(255) NOT NULL,
        CREATED TIMESTAMP,
        LAST_MODIFIED TIMESTAMP,
        BUCKET_ID UUID NOT NULL,
        PRIMARY KEY(BUCKET_ID,NAME),
        CONSTRAINT CACHEDS3OBJECT_TO_CACHEDS3BUCKET FOREIGN KEY(BUCKET_ID) REFERENCES
        CACHEDS3BUCKET(ID)
    );
CREATE TABLE
    CACHEDS3WORD_COUNT_PAIR
    (
        WORD VARCHAR(255) NOT NULL,
        COUNT INTEGER,
        BUCKET_ID UUID NOT NULL,
        PRIMARY KEY(BUCKET_ID,WORD),
        CONSTRAINT CACHEDS3WORD_COUNT_PAIR_TO_CACHEDS3BUCKET FOREIGN KEY(BUCKET_ID) REFERENCES
        CACHEDS3BUCKET(ID)
    );