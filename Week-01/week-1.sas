DATA students;

	input Name $ Age Grade; 
	datalines;  /* Aşağıdaki satırlar ham veri, bunları oku ve veri setine ekle */
	Ali 20 85
	Ayse 21 90
	Mehmet 19 78
	Ece 22 88
;
RUN;

PROC PRINT data = students;
RUN;

DATA students_v2;
	SET students; /* veri setini aktardırk */
	IF Grade >= 85  THEN Status = "Başarılı";
	ELSE Status = "Gelişmekte";
RUN;

PROC PRINT data = students_v2;
RUN;

DATA age_students;
	SET students_v2;
	IF Age <= 20 THEN Durum = "Genç";
	ELSE Durum = "Birey";
	IF Age > 25 THEN Durum = "Yetişkin";
RUN;

PROC PRINT data = age_students;
RUN;

DATA test;
	SET students;
	Total = Age + Grade;
	IF Age > 20 THEN Flag = 1;
	ELSE Flag = 0;
RUN;

PROC PRINT data = test;
RUN;