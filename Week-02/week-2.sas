
/* length */
DATA cities;
	LENGTH City $ 20;
	input City $;
	datalines;
	Ankara
	Adana
	Cankiri
	Istanbul
;
RUN;
/* length şu demektir 
LENGTH City $ 20; 
City için 20 karakterlik yer ayır.
Sas bazen kısa alan ayırdığı için veri kesilmemesi adına
böyle önlem alınabilir. */

PROC PRINT data = cities;
RUN;

/* Label 
 Kullanıcı dostu rapolar oluşturmak 
için kullanılır. Bu, veri setinin yapısını değiştirmez -
sadece raporlarda görüntüleme adını değiştirir. 
*/

/*
LABEL Grade = "Student Grade Score";
*/

/* FORMAT 
- Değeri nasıl göstereceğini belirler

FORMAT Salary dollar12.;
FORMAT Date date9.;

! format veriyi değiştirmez - sadece görüntüleme şeklini değiştirir.

*/


DATA employees;
	LENGTH Name $ 20;
	LENGTH Department $ 15;
	input Name $ Department $ Salary;
	LABEL Salary = "Annual Salary";
	FORMAT Salary dollar12.;
	datalines;
	Ahmet IT 75000
	Ayse HR 68000
	Mehmet Sales 82000
;
RUN;

PROC PRINT data = employees label;
RUN;

/* Proc Print Prof tercih edilen */
PROC PRINT data=employees label noobs;
	var Name Department Salary;
RUN;

/*
label - LABEL Komutuyla verdiğimiz açıklamaları kullanılır
noobs - Satır numarlarını kaldırır
var - Hangi sütunların yazdırılacağını seçer
*/

/*PROC CONTENTS - Veri Seti Yapısını Görme */
/*
Bu çok önemli. SAS’ta veri seti hakkında tüm bilgileri gösterir:

Değişken adları

Değişken türleri

Uzunluklar (length)

Formatlar

Label’lar

Gözlem (satır) sayısı
*/

PROC CONTENTS data=employees;
RUN; 

/* PROC SORT - Veri Sıralama */

PROC SORT data=employees out=emp_sorted;
   by Salary;
RUN;

PROC PRINT data = emp_sorted;
RUN;


	