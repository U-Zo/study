

















CREATE SEQUENCE EMP_SEQ
INCREMENT BY 1
START WITH 100
MAXVALUE 9999
NOCACHE
NOCYCLE;

SELECT * FROM USER_SEQUENCES;

INSERT INTO EMP
VALUES (EMP_SEQ.NEXTVAL, 'WOOJO', '�λ�', NULL,
    SYSDATE, 2500, 300, 40);

SELECT * FROM EMP;

SELECT EMP_SEQ.CURRVAL FROM DUAL;
ALTER SEQUENCE EMP_SEQ
INCREMENT BY 1;

SELECT EMP_SEQ.NEXTVAL FROM DUAL;

ALTER SEQUENCE EMP_SEQ
INCREMENT BY 2
MAXVALUE 10000
NOCACHE
NOCYCLE;

SELECT EMP_SEQ.CURRVAL FROM DUAL;
INSERT INTO EMP
VALUES (EMP_SEQ.NEXTVAL, 'WOOJO', '�λ�', NULL,
    SYSDATE, 2500, 300, 40);
SELECT * FROM EMP;

DROP SEQUENCE EMP_SEQ;

CREATE SEQUENCE DEPT_DEPTNO_SEQ
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 100
    MINVALUE 5
    CYCLE
    NOCACHE;

SELECT DEPT_DEPTNO_SEQ.NEXTVAL, DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;
DESC DEPT;

INSERT INTO DEPT
VALUES (DEPT_DEPTNO_SEQ.NEXTVAL, '����', '����');

SELECT * FROM EMP;

SELECT * FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = 'ü���а�';
SELECT * FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '�����а�';

SELECT * FROM EMP
WHERE ENAME = 'SMITH';

CREATE INDEX EMP_ENAME_IDX
ON EMP(ENAME);

SELECT * FROM EMP
WHERE ENAME = 'SMITH';

-- USER01 ���� DEPT ���̺��� SELECT ���� �ο�
GRANT SELECT
ON DEPT
TO USER01;
-- Ư�� �÷��� UPDATE ���� �ο�
GRANT UPDATE(DNAME)
ON DEPT
TO USER01;