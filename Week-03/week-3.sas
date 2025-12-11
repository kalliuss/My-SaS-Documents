/* week3: data cleaning & manipulation */

/* IF- ELSE - ELSE IF - AND */
DATA students3;
	input Name $ Age Grade;
	IF Grade >= 85 AND Age < 22 THEN Status = "Excellent";
	ELSE IF Grade >= 70 THEN Status = "Good";
	ELSE Status = "Low";
	datalines;
	Ali 20 90
	Ayse 23 35
	Mehmet 19 60
	Ece 21 78
;
RUN;

PROC PRINT data = students3;
RUN;

/* WHERE - Veri seti okunurken daha en başta filtreleme yapar
Bu yüzden daha hızlı çalışır, SQL'deki WHERE gibi davranır. */

/* MISSING 
Eksik değer yönetimi iş hayatında en çok yapılan
veri temizleme işidir.

sayısal missing -> .
karakter missin -> "" (boş)
*/

DATA sales_clean;
	input Name $ SalesAmount;
	/* missing kontrol */
	IF SalesAmount = . THEN Flag = "Missiing";
	ELSE IF SalesAmount < 3000 THEN Flag = "Low";
	ELSE Flag = "OK";
	datalines;
	Ali 5000
	Ayse .
	Mehmet 2500
	Ece 7000
	Can . 
;
RUN;

PROC PRINT data=sales_clean;
RUN;


/* SET + MERGE 

SET -> Veri setlerini alt alta birleştirir.
MERGE -> Veri setlerini yan yana birleştirir. (SQL JOIN GİBİ)
*/

DATA classA;
	input Name $ Grade;
	datalines;
	Ali 85
	Ayse 90
;
RUN;


DATA classB;
	input Name $ Grade;
	datalines;
	Mehmet 78
	Ece 88
;
RUN;

DATA all_students;
	SET classA classB;
RUN;

/* alt alta birleşti*/
PROC PRINT data=all_students;
RUN;

/* MERGE */

DATA info;
	input Name $ Age;
	datalines;
	Ali 20
	Ayse 21
	Mehmet 19
;
RUN;

DATA scores;
	input Name $ Score;
	datalines;
	Ali 88
	Ayse 92
	Mehmet 75
;
RUN;

PROC SORT data = info; BY Name; RUN;
PROC SORT data = scores; BY Name; RUN;


DATA merged;
	MERGE info scores;
	BY Name;
RUN;

PROC PRINT data = merged;
RUN;



