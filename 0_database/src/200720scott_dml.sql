















INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(90, '인사과', '서울');
INSERT INTO DEPT(LOC, DNAME, DEPTNO)
VALUES('서울', '인사과', 70);
INSERT INTO DEPT
VALUES(80, '인사과', '서울');
INSERT INTO DEPT
VALUES(70, 인사과, 서울);
SELECT * FROM DEPT;

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('인사과', '서울');
-------------- NULL 입력 -----------
-- 묵시적 방법
INSERT INTO DEPT(DEPTNO, DNAME)
VALUES(91, '인사과');
-- 명시적 방법
INSERT INTO DEPT
VALUES(92, '인사과', NULL);
-------------- 특정 데이터 입력 ---------------
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR,
    HIREDATE, SAL, COMM, DEPTNO)
VALUES(9000, USER, '연구원', 7839, SYSDATE, 5000, NULL, 90);
SELECT * FROM EMP;

INSERT INTO EMP(EMPNO, ENAME, JOB, MGR,
    HIREDATE, SAL, COMM, DEPTNO)
VALUES(9001, '홍길동', 'MANAGER', 7839, '2000/01/01',
    2000, NULL, 30);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR,
    HIREDATE, SAL, COMM, DEPTNO)
VALUES(9002, '임꺽정', 'MANAGER', 7839,
    TO_DATE('1999-12-13', 'YYYY/MM/DD'), 2000, NULL, 30);
SELECT * FROM EMP;
--------- 다중 행 입력 -----------
CREATE TABLE COPY_EMP
AS
SELECT EMPNO, ENAME FROM EMP
WHERE 1 = 2; -- 테이블의 컬럼만 복사
SELECT * FROM COPY_EMP;
-- 다중 행 입력
INSERT INTO COPY_EMP(EMPNO, ENAME)
SELECT EMPNO, ENAME FROM EMP;
SELECT * FROM COPY_EMP;
-------- 다중 테이블 다중 행 입력 ---------
CREATE TABLE SAL_HISTORY
AS
SELECT EMPNO, HIREDATE, SAL
FROM EMP
WHERE 1 = 2;

CREATE TABLE MGR_HISTORY
AS
SELECT EMPNO, MGR, SAL
FROM EMP
WHERE 1 = 2;

INSERT ALL
INTO SAL_HISTORY VALUES(EMPNO, HIREDATE, SAL)
INTO MGR_HISTORY VALUES(EMPNO, MGR, SAL)
SELECT EMPNO, HIREDATE, MGR, SAL
FROM EMP;

DROP TABLE SAL_HISTORY;
DROP TABLE MGR_HISTORY;

CREATE TABLE SAL_HISTORY
AS
SELECT EMPNO, HIREDATE, SAL
FROM EMP
WHERE 1 = 2;

CREATE TABLE MGR_HISTORY
AS
SELECT EMPNO, MGR, SAL
FROM EMP
WHERE 1 = 2;
-- INSERT ALL
INSERT ALL
WHEN SAL < 2500 THEN
    INTO SAL_HISTORY VALUES(EMPNO, HIREDATE, SAL)
WHEN SAL > 2500 THEN
    INTO MGR_HISTORY VALUES(EMPNO, MGR, SAL)
SELECT EMPNO, HIREDATE, SAL, MGR
FROM EMP;

SELECT * FROM SAL_HISTORY;
SELECT * FROM MGR_HISTORY;

DROP TABLE SAL_HISTORY;
DROP TABLE MGR_HISTORY;

CREATE TABLE SAL_HISTORY
AS
SELECT EMPNO, HIREDATE, SAL
FROM EMP
WHERE 1 = 2;

CREATE TABLE MGR_HISTORY
AS
SELECT EMPNO, MGR, SAL
FROM EMP
WHERE 1 = 2;

CREATE TABLE TEST_HISTORY
AS
SELECT EMPNO, SAL
FROM EMP
WHERE 1 = 2;
-- INSERT FIRST
INSERT FIRST
WHEN SAL = 800 THEN
    INTO SAL_HISTORY VALUES(EMPNO, HIREDATE, SAL)
WHEN SAL < 2500 THEN
    INTO MGR_HISTORY VALUES(EMPNO, MGR, SAL)
ELSE
    INTO TEST_HISTORY VALUES(EMPNO, SAL)
SELECT EMPNO, HIREDATE, SAL, MGR
FROM EMP;

SELECT * FROM SAL_HISTORY;
SELECT * FROM MGR_HISTORY;
SELECT * FROM TEST_HISTORY;
------------ UPDATE ----------
UPDATE DEPT
SET DNAME = '경리과', LOC = '부산'
WHERE DEPTNO = 90;
SELECT * FROM DEPT;

SELECT JOB, SAL
FROM EMP
WHERE EMPNO = 7844 OR EMPNO = 7900;

UPDATE EMP
SET JOB = (
    SELECT JOB
    FROM EMP
    WHERE EMPNO = 7900
), SAL = (
    SELECT SAL
    FROM EMP
    WHERE EMPNO = 7844
)
WHERE EMPNO = 9001;

SELECT JOB, SAL
FROM EMP
WHERE EMPNO = 9001;
----------------- DELETE ------------
DELETE FROM DEPT
WHERE DEPTNO = 91;
SELECT * FROM DEPT;

DELETE FROM EMP
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPT
    WHERE DNAME = '경리과' -- DEPTNO: 90
);
SELECT * FROM EMP;
------------ MERGE ----------------
CREATE TABLE PT_01 (
    판매번호 VARCHAR2(8),
    제품번호 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);

CREATE TABLE PT_02 (
    판매번호 VARCHAR2(8),
    제품번호 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);

CREATE TABLE P_TOTAL (
    판매번호 VARCHAR2(8),
    제품번호 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);

INSERT INTO PT_01 VALUES('20150101', '1000', 10, 500);
INSERT INTO PT_01 VALUES('20150102', '1001', 10, 400);
INSERT INTO PT_01 VALUES('20150103', '1002', 10, 300);
INSERT INTO PT_02 VALUES('20150201', '1003', 5, 500);
INSERT INTO PT_02 VALUES('20150202', '1004', 5, 400);
INSERT INTO PT_02 VALUES('20150203', '1005', 5, 300);
COMMIT;

SELECT * FROM PT_01;
SELECT * FROM PT_02;
SELECT * FROM P_TOTAL;

MERGE INTO P_TOTAL TOTAL
USING PT_01 P01
ON (TOTAL.판매번호 = P01.판매번호)
WHEN MATCHED THEN
    UPDATE SET TOTAL.수량 = P01.수량
WHEN NOT MATCHED THEN
    INSERT VALUES(P01.판매번호, P01.제품번호, P01.수량, P01.금액);

MERGE INTO P_TOTAL TOTAL
USING PT_02 P02
ON (TOTAL.판매번호 = P02.판매번호)
WHEN MATCHED THEN
    UPDATE SET TOTAL.수량 = P02.수량
WHEN NOT MATCHED THEN
    INSERT VALUES(P02.판매번호, P02.제품번호, P02.수량, P02.금액);

SELECT * FROM P_TOTAL;
COMMIT;

MERGE INTO P_TOTAL TOTAL
USING PT_02 P02
ON (TOTAL.판매번호 = P02.판매번호)
WHEN MATCHED THEN
    UPDATE SET TOTAL.수량 = P02.수량 + TOTAL.수량
WHEN NOT MATCHED THEN
    INSERT VALUES(P02.판매번호, P02.제품번호, P02.수량, P02.금액);

SELECT * FROM P_TOTAL;

CREATE TABLE EMP_M2
AS
SELECT EMPNO, JOB, SAL
FROM EMP
WHERE 1=2;

MERGE INTO EMP_M2 M2
USING EMP E
ON (M2.EMPNO = E.EMPNO)
WHEN MATCHED THEN
    UPDATE SET
        M2.JOB = E.JOB,
        M2.SAL = E.SAL
    WHERE E.JOB = 'CLERK'
WHEN NOT MATCHED THEN
    INSERT (M2.EMPNO, M2.JOB, M2.SAL)
    VALUES (E.EMPNO, E.JOB, E.SAL)
    WHERE E.JOB = 'CLERK';
    
SELECT * FROM EMP_M2;

CREATE TABLE EMP_M3
AS
SELECT EMPNO, JOB, SAL
FROM EMP;

MERGE INTO EMP_M3 M3
USING EMP E
ON (M3.EMPNO = E.EMPNO)
WHEN MATCHED THEN
    UPDATE SET
    M3.JOB = E.JOB,
    M3.SAL = E.SAL + 1000
    DELETE WHERE (M3.JOB = 'CLERK')
WHEN NOT MATCHED THEN
    INSERT (M3.EMPNO, M3.JOB, M3.SAL)
    VALUES (E.EMPNO, E.JOB, E.SAL + 500);
SELECT * FROM EMP_M3;

DELETE FROM PT_02
WHERE 제품번호 = 1004;

UPDATE PT_02
SET 제품번호 = 1006
WHERE 판매번호 = 20150203;

SELECT * FROM PT_02;

UPDATE PT_01
SET 판매번호 = 20150104
WHERE 제품번호 = 1002;

SELECT * FROM PT_01;

DELETE FROM PT_02
WHERE 금액 = 500;
SELECT * FROM PT_02;

SELECT * FROM DEPT;
DELETE FROM DEPT
WHERE DEPTNO = 92;
ROLLBACK;
COMMIT;

DELETE FROM EMP;
SELECT * FROM EMP;
ROLLBACK;

SELECT * FROM DEPT;
UPDATE DEPT
SET DNAME = '인사과'
WHERE DEPTNO = 90;

CREATE TABLE DEPT_2(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(10),
    LOC VARCHAR2(10)
);

CREATE TABLE DEPT_3(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(10),
    LOC VARCHAR2(10)
);

DESC EMP;

CREATE TABLE DEF_TABLE(
    NUM NUMBER(2),
    WRITEDAY DATE
);

CREATE TABLE DEF_TABLE2(
    NUM NUMBER(2),
    WRITEDAY DATE DEFAULT SYSDATE
);

INSERT INTO DEF_TABLE(NUM)
VALUES(1);

INSERT INTO DEF_TABLE2(NUM)
VALUES(1);

SELECT * FROM DEF_TABLE2;

CREATE TABLE DEPTA
AS
SELECT * FROM DEPT;

SELECT * FROM DEPTA;

CREATE TABLE DEPTB(NO, NAME)
AS
SELECT DEPTNO, DNAME
FROM DEPT;
SELECT COUNT(*) FROM DEPTB;

CREATE TABLE DEPTC
AS
SELECT * FROM DEPT
WHERE 1 = 2;

SELECT * FROM DEPTC;

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(NULL, 'AAA', '서울');