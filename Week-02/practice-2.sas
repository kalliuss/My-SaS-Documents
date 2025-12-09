DATA sales;
	LENGTH Employee $ 15 Department $ 12;
	input Employee $ Department $ SalesAmount;
	LABEL SalesAmount = "Monthly Sales (USD)";
	FORMAT SalesAmount dollar10.;
	datalines;
	Ali IT 5400
	Ayse HR 6200
	Mehmet Sales 8900
	Ece Sales 7100
	Can IT 4500
;
RUN;

/* Performans sınıfı ekleyelim */
DATA sales2;
	SET sales;
	IF SalesAmount >= 8000 THEN Performance = "High";
	ELSE IF SalesAmount >= 6000 THEN Performance ="Medium";
	ELSE Performance = "Low";
RUN;

/* en yüksekten en düşeğe sıralama */

PROC SORT data = sales2 out = salesSorted;
	by descending SalesAmount;
RUN;


/* Yapıyı göster */
PROC CONTENTS data = salesSorted;
RUN;

/* Son rapor */
PROC PRINT data = salesSorted label;
RUN;