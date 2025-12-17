/* HAFTA 5 - SQL BASICS (SAS içinde SQL)

1 Select
2 Where
3 Order By
4 Group By (aggregate mantığına giriş)

SAS'ta SQL şöyle yazılır: 
	
	PROC SQL;
		SQL KOMUTLARI
	QUIT;
 ! run değil

SELECT: veri görüntüleme

	PROC SQL;
		SELECT *
		FROM salary_analysis;
	QUIT;
! proc print gibi davranır ancak sql söz dizimiyle

	- belirli kolonları seçme:
			PROC SQL;
			   SELECT Name, Department, Salary
			   FROM salary_analysis;
			QUIT;	
		!hangi kolonları istiyorsan onları açıkça belirtirsin
	

WHERE: hangi satırların geleceğini belirler

	PROC SQL;
	   SELECT Name, Department, Salary
	   FROM salary_analysis
	   WHERE Salary >= 7000;
	QUIT;
! Maaşı 7000 ve üzeri olanları getiririr. Missing (.) olanları otomatik dışlar

	- birden fazla koşul;
		PROC SQL;
		   SELECT Name, Department, Salary
		   FROM salary_analysis
		   WHERE Department = "Sales" AND Salary >= 7000;
		QUIT;
	
	- OR kullanımı
		WHERE Department = "IT" OR Department = "HR";


ORDER BY: gelen sonuçları sıralamak için kullanılır
	ORDER BY sorgu sonucunu sıralar
	PROC SORT veri setinin kendisini sıralar

	- artan sıralama ;
		PROC SQL;
		   SELECT Name, Department, Salary
		   FROM salary_analysis
		   ORDER BY Salary;
		QUIT;
	! maaşlar küçükten büyüğe sıralandı

	- azalan sıralama; 
		PROC SQL;
		   SELECT Name, Department, Salary
		   FROM salary_analysis
		   ORDER BY Salary DESC;
		QUIT;
	! En yüksek maaş en üste gelir, büyükten küçüğe

	- birden fazla kolona göre sıralama
		PROC SQL;
		   SELECT Name, Department, Salary
		   FROM salary_analysis
		   ORDER BY Department, Salary DESC;
		QUIT;
	! önce departmana göre sıralar aynı departmandikleri de salary'ye göre sıralar


SELECT - NEYİ ALACAM
WHERE - HANGİLERİNİ ALACAM
ORDER BY - NASIL SIRALAYACAĞIM

GROUP BY: Özetleme / Aggregation - Bu veriyi gruplara ayırıp özetlersek ne görürüz ?

	 GROUP BY mantığı (çok sade)

		Örneğin:
		
		Departmanlara göre ortalama maaş
		
		Departmanlara göre kaç kişi var
		
		Departmanlara göre toplam satış
		
		Bunu tek tek satırlarla değil, toplu sonuçla görmek isteriz.


- departmana göre ort maaş
	PROC SQL;
	   SELECT Department,
	          AVG(Salary) AS AvgSalary
	   FROM salary_analysis
	   GROUP BY Department;
	QUIT;

- aynı department olanları gruplar
- her grup için ortalama maaş hesaplar

- departmana göre kişi sayısı 
	PROC SQL;
	   SELECT Department,
	          COUNT(*) AS EmployeeCount  // count(*) gruptakş satır sayısı
	   FROM salary_analysis
	   GROUP BY Department;
	QUIT;

- WHERE + GROUP BY birlikte

	PROC SQL;
	   SELECT Department,
	          AVG(Salary) AS AvgSalary
	   FROM salary_analysis
	   WHERE Salary IS NOT NULL
	   GROUP BY Department;
	QUIT;

	- Önce filtreler
	- Sonra gruplar
	- Sonra özetler










