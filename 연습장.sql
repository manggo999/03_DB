-- <문제1> 부서코드가 노옹철 사원과 같은 소속의 직원의 이름, 부서코드 조회

-- 1) 노옹철 부서코드 조회(서브쿼리)

SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철'; -- 조회결과 : 'D9'

-- 2) 부서코드가 'D9'인 직원의 이름, 부서코드 조회(메인쿼리)
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
-- AND EMP_NAME != '노옹철'; (노옹철 이름을 제외하고 싶다면)

-- 위의 2개의 단계를 하나의 쿼리로!!
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
				   FROM EMPLOYEE
                   WHERE EMP_NAME = '노옹철'); 
                   -- SELECT EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철' 
                   -- 드래그 후 ALT + X 하면 'D9'이 출력된다.

------------------------------------------------------------------------------------------
                  
                  
-- <문제2> 전 직원의 평균 급여보다 많은 급여를 받고 있는 
--         직원의 사번, 이름 직급코드, 급여조회

-- 1) 전 직원의 평균 급여 조회(서브쿼리)
SELECT CEIL(AVG(SALARY)) -- CEIL 지저분한 소수점 제거
FROM EMPLOYEE; -- 조회 결과 : 3047663

-- 2) 직원 중 급여가 3,047,662원 이상인 
--    사원들의 사번, 이름 직급코드, 급여 조회(메인쿼리)
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3047663;

-- 3) 하나의 쿼리로!
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT CEIL(AVG(SALARY)) 
                 FROM EMPLOYEE); -- SELECT CEIL(AVG(SALARY)) FROM EMPLOYEE = 3047663


---------------------------------------------------------------------------------------------

-- <문제3> 전 직원의 급여 평균보다 많은(초과) 급여를 받는 
--         직원의 이름, 직급명, 부서명, 급여를 직급 순으로 정렬하여 조회
                 
-- 1) 전 직원의 급여 평균
SELECT CEIL(AVG(SALARY))
FROM EMPLOYEE; -- 3047663

-- 2) 3047663원 보다 많은 급여를 받는 직원
SELECT EMP_NAME, AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY > 3047663;




