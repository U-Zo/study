
























CREATE INDEX EMP_ENAME_IDX
ON EMP(ENAME);

DROP USER user01;

GRANT UPDATE(DNAME)
ON DEPT
TO USER01;

SELECT * FROM DEPT
WHERE DEPTNO = 90;

REVOKE UPDATE
ON DEPT
FROM USER01;