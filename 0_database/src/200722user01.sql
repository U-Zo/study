













SELECT * FROM DEPT;
SELECT * FROM SCOTT.DEPT;

UPDATE SCOTT.DEPT
SET LOC = 'AAA';

UPDATE SCOTT.DEPT
SET DNAME = '�λ�'
WHERE DEPTNO = 40;

ROLLBACK;