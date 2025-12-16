/* bozuk veri seti */

DATA raw_data;
   input ID Name $ Age Salary;
   datalines;
   1 Ali 25 7000
   2 Ayse . 8000
   3 Mehmet 17 .
   4 Ece 45 12000
   5 Can 16 3000
;
RUN;

PROC PRINT data=raw_data;
RUN;

DATA cleaned;
	SET raw_data;
	
	/* Age Kontrol */
	IF Age = . THEN AgeFlag = "Missing";
	ELSE IF Age < 18 THEN AgeFlag = "Underage";
	ELSE AgeFlag = "OK";

	/* Salary Kontrolü */
	IF Salary = . THEN SalaryFlag = "Missing";
	ELSE IF Salary < 4000 THEN SalaryFlag = "Low";
	ELSE SalaryFlag = "OK";
RUN;

PROC PRINT data = cleaned;
RUN;