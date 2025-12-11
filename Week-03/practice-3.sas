DATA sales_info;
	input ID Name $ Department $ Age;
	datalines;
		1 Ali IT 25
		2 Ayse HR 30
		3 Mehmet Sales .
		4 Ece Sales 24
		5 Can IT 28
;
RUN;


DATA sales_scores;
	input ID Score;
	datalines;
		1 88
		2 92
		3 75
		4 .
		5 90
;
RUN;

DATA cleaned_info;
	SET sales_info;
	IF Age = "." THEN AgeFlag = "Missing"
;
RUN;

DATA cleaned_scores;
	SET sales_scores;
	IF Score = . THEN ScoreFlag = "Missing"
;
RUN;

PROC SORT data=cleaned_info; BY ID; RUN;
PROC SORT data=cleaned_scores; BY ID; RUN;


DATA final;
	MERGE cleaned_info cleaned_scores;
	BY ID;
RUN;

PROC PRINT data = final;
RUN;
