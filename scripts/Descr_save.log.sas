libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

Data disc1;
	set class.merged;

/* Variable: TSBAL */
	if TSBAL <31000 then
		ORDTSBAL=1;
	else if TSBAL <38067 then
		ORDTSBAL=2;
	else if TSBAL <45134 then
		ORDTSBAL=3;
	else if TSBAL <52201 then
		ORDTSBAL=4;
	else
		ORDTSBAL=5;		
/* Variable: BRHIC */		
	if BRHIC <5250 then
		ORDBRHIC=1;
	else if BRHIC <15250 then
		ORDBRHIC=2;
	else if BRHIC <25250 then
		ORDBRHIC=3;
	else if BRHIC <35250 then
		ORDBRHIC=4;
	else
		ORDBRHIC=5;
/* Variable: RBAL */
	if RBAL <11000 then
		ORDRBAL=1;
	else if RBAL <16500 then
		ORDRBAL=2;
	else if RBAL <22000 then
		ORDRBAL=3;
	else if RBAL <27500 then
		ORDRBAL=4;
	else
		ORDRBAL=5;		
/* Variable: BRMINB */	
	if BRMINB <1100 then
		ORDBRMINB=1;
	else if BRMINB <2000 then
		ORDBRMINB=2;
	else if BRMINB <2900 then
		ORDBRMINB=3;
	else if BRMINB <3800 then
		ORDBRMINB=4;
	else if BRMINB <4700 then
		ORDBRMINB=5;
	else
		ORDBRMINB=6;	
/* Variable: BRMINH */
	if BRMINH <2350 then
		ORDBRMINH=1;
	else if BRMINH <2650 then
		ORDBRMINH=2;
	else if BRMINH <2950 then
		ORDBRMINH=3;
	else if BRMINH <3250 then
		ORDBRMINH=4;
	else
		ORDBRMINH=5;
/* Variable: BRMOSOPN */
	if BRMOSOPN <200 then
		ORDBRMOSOPN=1;
	else if BRMOSOPN <400 then
		ORDBRMOSOPN=2;
	else if BRMOSOPN <600 then
		ORDBRMOSOPN=3;
	else if BRMOSOPN <800 then
		ORDBRMOSOPN=4;
	else
		ORDBRMOSOPN=5;
/* Variable: DCMOSOPN */
	if DCMOSOPN <130 then
		ORDDCMOSOPN=1;
	else if DCMOSOPN <330 then
		ORDDCMOSOPN=2;
	else if DCMOSOPN <530 then
		ORDDCMOSOPN=3;
	else if DCMOSOPN <730 then
		ORDDCMOSOPN=4;
	else
		ORDDCMOSOPN=5;
run;

data disc1;
	set disc1;
/* Variable: FFMOSOPN */
	if FFMOSOPN <82 then
		ORDFFMOSOPN=1;
	else if FFMOSOPN <182 then
		ORDFFMOSOPN=2;
	else if FFMOSOPN <282 then
		ORDFFMOSOPN=3;
	else if FFMOSOPN <382 then
		ORDFFMOSOPN=4;
	else
		ORDFFMOSOPN=5;		
/* Variable: CRDPTH */	
	if CRDPTH <131 then
		ORDCRDPTH=1;
	else if CRDPTH <181 then
		ORDCRDPTH=2;
	else if CRDPTH <231then
		ORDCRDPTH=3;
	else if CRDPTH <281 then
		ORDCRDPTH=4;
	else if CRDPTH <331 then
		ORDCRDPTH=5;
	else
		ORDCRDPTH=6;		
/* Variable: FFAGE */
	if FFAGE <61 then
		ORDFFAGE=1;
	else if FFAGE <161 then
		ORDFFAGE=2;
	else if FFAGE <261 then
		ORDFFAGE=3;
	else if FFAGE <361 then
		ORDFFAGE=4;
	else
		ORDFFAGE=5;
/* Variable: FFAVGMOS */
	if FFAVGMOS <50 then
		ORDFFAVGMOS=1;
	else if FFAVGMOS <120 then
		ORDFFAVGMOS=2;
	else if FFAVGMOS <190 then
		ORDFFAVGMOS=3;
	else if FFAVGMOS <260 then
		ORDFFAVGMOS=4;
	else
		ORDFFAVGMOS=5;
/* Variable: AVGMOS */	
	if AVGMOS <36 then
		ORDAVGMOS=1;
	else if AVGMOS <72 then
		ORDAVGMOS=2;
	else if AVGMOS <108 then
		ORDAVGMOS=3;
	else if AVGMOS <144 then
		ORDAVGMOS=4;
	else
		ORDAVGMOS=5;
/* Variable: BRNEW */
	if BRNEW <35 then
		ORDBRNEW=1;
	else if BRNEW <45 then
		ORDBRNEW=2;
	else if BRNEW <55 then
		ORDBRNEW=3;
	else if BRNEW <65 then
		ORDBRNEW=4;
	else
		ORDBRNEW=5;
/* Variable: PRMINQS */
	if PRMINQS <10 then
		ORDPRMINQS=1;
	else if PRMINQS <15 then
		ORDPRMINQS=2;
	else if PRMINQS <20 then
		ORDPRMINQS=3;
	else if PRMINQS <25 then
		ORDPRMINQS=4;
	else
		ORDPRMINQS=5;
/* Variable: TROPENEX */
	if TROPENEX <15 then
		ORDTROPENEX=1;
	else if TROPENEX <20 then
		ORDTROPENEX=2;
	else if TROPENEX <25 then
		ORDTROPENEX=3;
	else if TROPENEX <30 then
		ORDTROPENEX=4;
	else if TROPENEX <35 then
		ORDTROPENEX=5;
	else
		ORDTROPENEX=6;
/* Variable: PRMINQ2 */
	if PRMINQ2 <5 then
		ORDPRMINQ2=1;
	else if PRMINQ2 <10 then
		ORDPRMINQ2=2;
	else if PRMINQ2 <15 then
		ORDPRMINQ2=3;
	else if PRMINQ2 <20 then
		ORDPRMINQ2=4;
	else
		ORDPRMINQ2=5;
/* Variable: TOPEN */
	if TOPEN <5 then
		ORDTOPEN=1;
	else if TOPEN <10 then
		ORDTOPEN=2;
	else if TOPEN <15 then
		ORDTOPEN=3;
	else if TOPEN <20 then
		ORDTOPEN=4;
	else
		ORDTOPEN=5;
/* Variable: BRCRATE1 */
	if BRCRATE1 <3 then
		ORDBRCRATE1=1;
	else if BRCRATE1 <7 then
		ORDBRCRATE1=2;
	else if BRCRATE1 <11 then
		ORDBRCRATE1=3;
	else if BRCRATE1 <15 then
		ORDBRCRATE1=4;
	else
		ORDBRCRATE1=5;
run;

data disc1;
	set disc1;
/* Variable: TADB25 */
	if TADB25 <3 then
		ORDTADB25=1;
	else if TADB25 <7 then
		ORDTADB25=2;
	else if TADB25 <11 then
		ORDTADB25=3;
	else if TADB25 <15 then
		ORDTADB25=4;
	else
		ORDTADB25=5;
/* Variable: BNKINQ2 */
	if BNKINQ2 <3 then
		ORDBNKINQ2=1;
	else if BNKINQ2 <7 then
		ORDBNKINQ2=2;
	else if BNKINQ2 <11 then
		ORDBNKINQ2=3;
	else if BNKINQ2 <15 then
		ORDBNKINQ2=4;
	else
		ORDBNKINQ2=5;
/* Variable: PFRATE1 */
	if PFRATE1 <6 then
		ORDPFRATE1=1;
	else if PFRATE1 <9 then
		ORDPFRATE1=2;
	else if PFRATE1 <12 then
		ORDPFRATE1=3;
	else if PFRATE1 <15 then
		ORDPFRATE1=4;
	else
		ORDPFRATE1=5;
/* Variable: TOPENB75 */
	if TOPENB75 <2 then
		ORDTOPENB75=1;
	else if TOPENB75 <5 then
		ORDTOPENB75=2;
	else if TOPENB75 <8 then
		ORDTOPENB75=3;
	else if TOPENB75 <11 then
		ORDTOPENB75=4;
	else
		ORDTOPENB75=5;
/* Variable: BADPR1 */
	if BADPR1 <2 then
		ORDBADPR1=1;
	else if BADPR1 <5 then
		ORDBADPR1=2;
	else if BADPR1 <8 then
		ORDBADPR1=3;
	else if BADPR1 <11 then
		ORDBADPR1=4;
	else
		ORDBADPR1=5;
/* Variable: FININQS */
	if FININQS <4 then
		ORDFININQS=1;
	else if FININQS <6 then
		ORDFININQS=2;
	else if FININQS <8 then
		ORDFININQS=3;
	else if FININQS <10 then
		ORDFININQS=4;
	else
		ORDFININQS=5;
/* Variable: LOCINQS */
	if LOCINQS <4 then
		ORDLOCINQS=1;
	else if LOCINQS <6 then
		ORDLOCINQS=2;
	else if LOCINQS <8 then
		ORDLOCINQS=3;
	else if LOCINQS <10 then
		ORDLOCINQS=4;
	else
		ORDLOCINQS=5;
/* Variable: TOPEN12 */
	if TOPEN12 <4 then
		ORDTOPEN12=1;
	else if TOPEN12 <6 then
		ORDTOPEN12=2;
	else if TOPEN12 <8 then
		ORDTOPEN12=3;
	else if TOPEN12 <10 then
		ORDTOPEN12=4;
	else
		ORDTOPEN12=5;
Run;

Data disc1;
	set disc1;
	
/* Variable: OT24PTOT */
	if OT24PTOT <.7 then
		ORDOT24PTOT=1;
	else if OT24PTOT <.9 then
		ORDOT24PTOT=2;
	else if OT24PTOT <1.1 then
		ORDOT24PTOT=3;
	else if OT24PTOT <1.3 then
		ORDOT24PTOT=4;
	else if OT24PTOT <1.5 then
		ORDOT24PTOT=5;
	else if OT24PTOT <1.7 then
		ORDOT24PTOT=6;
	else
		ORDOT24PTOT=7;	
/* Variable: RADB6 */
	if RADB6 <.5 then
		ORDRADB6=1;
	else if RADB6 <.7 then
		ORDRADB6=2;
	else if RADB6 <.9 then
		ORDRADB6=3;
	else if RADB6 <1.1 then
		ORDRADB6=4;
	else
		ORDRADB6=5;		
/* Variable: TPOPEN */
	if TPOPEN < 0.1 then
		ORDTPOPEN=1;
	else if TPOPEN < 0.2 then
		ORDTPOPEN=2;
	else if TPOPEN < 0.3 then
		ORDTPOPEN=3;
	else if TPOPEN < 0.4 then
		ORDTPOPEN=4;
	else if TPOPEN < 0.5 then
		ORDTPOPEN=5;
	else if TPOPEN < 0.6 then
		ORDTPOPEN=6;
	else
		ORDTPOPEN=7;	
/* Variable: BRPOPEN */
	if BRPOPEN < 0.1 then
		ORDBRPOPEN=1;
	else if BRPOPEN < 0.3 then
		ORDBRPOPEN=2;
	else if BRPOPEN < 0.5 then
		ORDBRPOPEN=3;
	else if BRPOPEN < 0.7 then
		ORDBRPOPEN=4;
	else
		ORDBRPOPEN=5;	
/* Variable: OBRPTAT */
	if OBRPTAT < 0.2 then
		ORDOBRPTAT=1;
	else if OBRPTAT < 0.4 then
		ORDOBRPTAT=2;
	else if OBRPTAT < 0.6 then
		ORDOBRPTAT=3;
	else if OBRPTAT < 0.8 then
		ORDOBRPTAT=4;
	else
		ORDOBRPTAT=5;	
/* Variable: OT6PTOT */
	if OT6PTOT < 0.4 then
		ORDOT6PTOT=1;
	else if OT6PTOT < 0.5 then
		ORDOT6PTOT=2;
	else if OT6PTOT < 0.6 then
		ORDOT6PTOT=3;
	else if OT6PTOT < 0.7 then
		ORDOT6PTOT=4;
	else
		ORDOT6PTOT=5;			
run;
/* ----------------------------------------- */
/* ----------------------------------------- */
/* ----------------------------------------- */

Proc means data=disc1;
	var TSBAL;
	class ORDTSBAL;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTSBAL;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTSBAL;
	title"ORDTSBAL";
	run;
quit;

Proc means data=disc1;
	var BRHIC;
	class ORDBRHIC;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRHIC;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRHIC;
	title"ORDBRHIC";
	run;
quit;
Proc means data=disc1;
	var RBAL;
	class ORDRBAL;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDRBAL;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDRBAL;
	title"ORDRBAL";
	run;
quit;

Proc means data=disc1;
	var BRMINB;
	class ORDBRMINB;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRMINB;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRMINB;
	title"ORDBRMINB";
	run;
quit;

Proc means data=disc1;
	var BRMINH;
	class ORDBRMINH;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRMINH;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRMINH;
	title"ORDBRMINH";
	run;
quit;

Proc means data=disc1;
	var BRMOSOPN;
	class ORDBRMOSOPN;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRMOSOPN;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRMOSOPN;
	title"ORDBRMOSOPN";
	run;
quit;

Proc means data=disc1;
	var DCMOSOPN;
	class ORDDCMOSOPN;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDDCMOSOPN;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDDCMOSOPN;
	title"ORDDCMOSOPN";
	run;
quit;

Proc means data=disc1;
	var FFMOSOPN;
	class ORDFFMOSOPN;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDFFMOSOPN;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDFFMOSOPN;
	title"ORDFFMOSOPN";
	run;
quit;

Proc means data=disc1;
	var CRDPTH;
	class ORDCRDPTH;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDCRDPTH;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDCRDPTH;
	title"ORDCRDPTH";
	run;
quit;

Proc means data=disc1;
	var FFAGE;
	class ORDFFAGE;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDFFAGE;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDFFAGE;
	title"ORDFFAGE";
	run;
quit;

Proc means data=disc1;
	var FFAVGMOS;
	class ORDFFAVGMOS;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDFFAVGMOS;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDFFAVGMOS;
	title"ORDFFAVGMOS";
	run;
quit;

Proc means data=disc1;
	var AVGMOS;
	class ORDAVGMOS;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDAVGMOS;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDAVGMOS;
	title"ORDAVGMOS";
	run;
quit;

Proc means data=disc1;
	var BRNEW;
	class ORDBRNEW;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRNEW;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRNEW;
	title"ORDBRNEW";
	run;
quit;

Proc means data=disc1;
	var PRMINQS;
	class ORDPRMINQS;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDPRMINQS;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDPRMINQS;
	title"ORDPRMINQS";
	run;
quit;

Proc means data=disc1;
	var TROPENEX;
	class ORDTROPENEX;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTROPENEX;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTROPENEX;
	title"ORDTROPENEX";
	run;
quit;

Proc means data=disc1;
	var PRMINQ2;
	class ORDPRMINQ2;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDPRMINQ2;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDPRMINQ2;
	title"ORDPRMINQ2";
	run;
quit;

Proc means data=disc1;
	var TOPEN;
	class ORDTOPEN;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTOPEN;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTOPEN;
	title"ORDTOPEN";
	run;
quit;

Proc means data=disc1;
	var BRCRATE1;
	class ORDBRCRATE1;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRCRATE1;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRCRATE1;
	title"ORDBRCRATE1";
	run;
quit;

Proc means data=disc1;
	var TADB25;
	class ORDTADB25;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTADB25;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTADB25;
	title"ORDTADB25";
	run;
quit;

Proc means data=disc1;
	var BNKINQ2;
	class ORDBNKINQ2;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBNKINQ2;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBNKINQ2;
	title"ORDBNKINQ2";
	run;
quit;

Proc means data=disc1;
	var PFRATE1;
	class ORDPFRATE1;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDPFRATE1;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDPFRATE1;
	title"ORDPFRATE1";
	run;
quit;

Proc means data=disc1;
	var TOPENB75;
	class ORDTOPENB75;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTOPENB75;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTOPENB75;
	title"ORDTOPENB75";
	run;
quit;

Proc means data=disc1;
	var BADPR1;
	class ORDBADPR1;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBADPR1;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBADPR1;
	title"ORDBADPR1";
	run;
quit;

Proc means data=disc1;
	var FININQS;
	class ORDFININQS;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDFININQS;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDFININQS;
	title"ORDFININQS";
	run;
quit;

Proc means data=disc1;
	var LOCINQS;
	class ORDLOCINQS;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDLOCINQS;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDLOCINQS;
	title"ORDLOCINQS";
	run;
quit;

Proc means data=disc1;
	var TOPEN12;
	class ORDTOPEN12;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTOPEN12;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTOPEN12;
	title"ORDTOPEN12";
	run;
quit;

Proc means data=disc1;
	var TPOPEN;
	class ORDTPOPEN;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDTPOPEN;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTPOPEN;
	title"ORDTPOPEN";
	run;
quit;

Proc means data=disc1;
	var OT24PTOT;
	class ORDOT24PTOT;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDOT24PTOT;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDOT24PTOT;
	title"ORDOT24PTOT";
	run;
quit;

Proc means data=disc1;
	var RADB6;
	class ORDRADB6;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDRADB6;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDRADB6;
	title"ORDRADB6";
	run;
quit;




Proc means data=disc1;
	var BRPOPEN;
	class ORDBRPOPEN;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDBRPOPEN;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRPOPEN;
	title"ORDBRPOPEN";
	run;
quit;

Proc means data=disc1;
	var OBRPTAT;
	class ORDOBRPTAT;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDOBRPTAT;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDOBRPTAT;
	title"ORDOBRPTAT";
	run;
quit;

Proc means data=disc1;
	var OT6PTOT;
	class ORDOT6PTOT;
run;

Proc means data=disc1;
	Var goodbad;
	class ORDOT6PTOT;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDOT6PTOT;
	title"ORDOT6PTOT";
	run;
quit;

/*          */   
data class.merged;
	set work.disc1;
run;/**/





































