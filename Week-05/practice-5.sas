DATA emp;
	input ID Name $ Department $ Salary;
	datalines;
	1 Ali IT 7000
	2 Ayse HR 8000
	3 Mehmet Sales 9000
	4 Ece Sales 12000
	5 Can IT 3000
	6 Zeynep HR 7500 
	7 Bora IT .
;
RUN;

PROC SQL;
	SELECT Name, Department, Salary
	FROM emp;
QUIT;

PROC SQL;
	SELECT Name, Department, Salary
	FROM emp
	WHERE Salary IS NOT NULL;
QUIT;

PROC SQL; 
	SELECT Name, Department, Salary
	FROM emp
	WHERE Salary IS NOT NULL
	ORDER BY Salary DESC;
QUIT;

PROC SQL;
	SELECT Department,
		COUNT(*) AS EmpCount,  /* kişi sayma*/
		AVG(Salary) AS AvgSalary /* maaşları toplar kişiye bölme */
	FROM emp 
	WHERE Salary IS NOT NULL
	GROUP BY Department
	ORDER BY AvgSalary DESC;
QUIT;

/* 
bu, her departmanın:
- kaç kişi olduğunu
- ortalama maaşını
- ortalamaya göre sıralı şekilde verilecek
*/