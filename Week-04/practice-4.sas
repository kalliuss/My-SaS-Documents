/*
Senaryo

Bir şirketin çalışan maaş verisi var.
Yönetim senden şunları istiyor:

Genel maaş seviyesi nedir?

Maaşlar dengeli mi?

Eksik veri problemi var mı?

Tipik maaş ne civarda?

Biz bunu PROC MEANS + FREQ + UNIVARIATE ile cevaplayacağız.
*/


DATA salary_analysis;
	input Name $ Department $ Salary;
	datalines;
	Ali IT 7000
	Ayse HR 8000
	Mehmet Sales .
	Ece Sales 12000
	Can IT 3000
	Zeynep HR 7500
;
RUN;

PROC PRINT data = salary_analysis;
RUN;

/* Sayısal özet */

PROC MEANS data = salary_analysis;
	var Salary;
/* salary e göre aldık ve salary 1 tane missing var 
o da mehmet ondan tabloda mehmeti saymadı ve n=5 aldı. */
RUN;

/* eksik veri analizi */

DATA salary_flagged;
	SET salary_analysis;
	IF Salary = . THEN SalaryFlag = "Missing";
	ELSE SalaryFlag = "Available";
RUN;

PROC FREQ data = salary_flagged;
	tables SalaryFlag;
RUN;

PROC UNIVARIATE data = salary_flagged;
	var Salary;
RUN;
