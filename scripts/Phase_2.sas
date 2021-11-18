libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

/*
Proc contents data = class.merged; run;
Proc means data = class.merged nmiss median max; run;/**/
Proc univariate data=class.merged;
	var FFAVGMOS;
	histogram;
run;

Proc contents data=class.merged;
run;

Data disc1;
	set class.merged;

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
Run;
Proc univariate data=class.merged;
	var TSBAL;
	histogram;
run;
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
	run;
quit;

%let d1 = disc1;

Proc means data=&d1 nmiss;
run;

Proc Summary data=&d1 mean missing std;
	Class ORDTSBAL;
	Var TSBAL GOODBAD;
	Output out=summary mean=avg_ind avg_dep;
Run;

Proc print data=summary;
run;

Data summary;
	Set summary;
	oddsTSBAL=(avg_dep/(1-avg_dep));
	loddsTSBAL=log(avg_dep/(1-avg_dep));
	testTSBAL=((1-avg_dep)/(avg_dep));
Run;

Proc Print data=summary;
Run;

*Code to merge the summary file values back into the dataset;

Proc sort data=summary;
	by ORDTSBAL;
Run;

Proc sort data=&d1;
	by ORDTSBAL;
Run;

Data modelingfile (drop=_TYPE_ _FREQ_ avg_ind avg_dep);
	Merge summary &d1;
	by ORDTSBAL;

	if matchkey=. then
		delete;
Run;

Proc Print data=modelingfile (obs=200);
	Var TSBAL ORDTSBAL oddsTSBAL loddsTSBAL testTSBAL;
Run;