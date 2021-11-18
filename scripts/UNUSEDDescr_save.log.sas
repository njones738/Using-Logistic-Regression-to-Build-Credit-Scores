libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

Data disc_UNUSED;
	set class.merged;
	
/* Variable: BRCR1BAL */
	if BRCR1BAL <4 then
		ORDBRCR1BAL=1;
	else if BRCR1BAL <7 then
		ORDBRCR1BAL=2;
	else if BRCR1BAL <10 then
		ORDBRCR1BAL=3;
	else if BRCR1BAL <13 then
		ORDBRCR1BAL=4;
	else
		ORDBRCR1BAL=5;
/* Variable: FFLAAGE */
	if FFLAAGE <8 then
		ORDFFLAAGE=1;
	else if FFLAAGE <24 then
		ORDFFLAAGE=2;
	else if FFLAAGE <40 then
		ORDFFLAAGE=3;
	else if FFLAAGE <56 then
		ORDFFLAAGE=4;
	else
		ORDFFLAAGE=5;
/* Variable: DCLAAGE */
	if DCLAAGE <8 then
		ORDDCLAAGE=1;
	else if DCLAAGE <16 then
		ORDDCLAAGE=2;
	else if DCLAAGE <24 then
		ORDDCLAAGE=3;
	else if DCLAAGE <32 then
		ORDDCLAAGE=4;
	else
		ORDDCLAAGE=5;
/* Variable: LAAGE */
	if LAAGE <3 then
		ORDLAAGE=1;
	else if LAAGE <7 then
		ORDLAAGE=2;
	else if LAAGE <11 then
		ORDLAAGE=3;
	else if LAAGE <15 then
		ORDLAAGE=4;
	else
		ORDLAAGE=5;
/* Variable: TRCR49 */
	if TRCR49 <2 then
		ORDTRCR49=1;
	else if TRCR49 <5 then
		ORDTRCR49=2;
	else if TRCR49 <8 then
		ORDTRCR49=3;
	else if TRCR49 <11 then
		ORDTRCR49=4;
	else
		ORDTRCR49=5;
run;

Proc means data=disc_UNUSED;
	var BRCR1BAL;
	class ORDBRCR1BAL;
run;

Proc means data=disc_UNUSED;
	Var goodbad;
	class ORDBRCR1BAL;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDBRCR1BAL;
	title"ORDBRCR1BAL";
	run;
quit;

Proc means data=disc_UNUSED;
	var FFLAAGE;
	class ORDFFLAAGE;
run;

Proc means data=disc_UNUSED;
	Var goodbad;
	class ORDFFLAAGE;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDFFLAAGE;
	title"ORDFFLAAGE";
	run;
quit;

Proc means data=disc_UNUSED;
	var DCLAAGE;
	class ORDDCLAAGE;
run;

Proc means data=disc_UNUSED;
	Var goodbad;
	class ORDDCLAAGE;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDDCLAAGE;
	title"ORDDCLAAGE";
	run;
quit;

Proc means data=disc_UNUSED;
	var LAAGE;
	class ORDLAAGE;
run;

Proc means data=disc_UNUSED;
	Var goodbad;
	class ORDLAAGE;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDLAAGE;
	title"ORDLAAGE";
	run;
quit;

Proc means data=disc_UNUSED;
	var TRCR49;
	class ORDTRCR49;
run;

Proc means data=disc_UNUSED;
	Var goodbad;
	class ORDTRCR49;
	output out=test mean=meangoodbad;
Run;

symbol v=square color=black i=join;

Proc gplot data=test;
	plot meangoodbad*ORDTRCR49;
	title"ORDTRCR49";
	run;
quit;























































