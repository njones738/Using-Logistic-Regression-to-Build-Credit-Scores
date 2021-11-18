libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

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

	if oddsTSBAL < 1 then
		oddsTSBAL=((1-avg_dep)/(avg_dep));
	loddsTSBAL=log(oddsTSBAL);
Run;

Proc Print data=summary;
Run;

*Code to merge the summary file values back into the dataset;

Proc sort data=summary;
	by ordTSBAL;
Run;

Proc sort data=&d1;
	by ordTSBAL;
Run;

Data &d1 (drop=_TYPE_ _FREQ_ avg_ind avg_dep);
	Merge summary &d1;
	by ordTSBAL;

	if matchkey=. then
		delete;
Run;

Proc Print data=&d1 (obs=200);
	Var TSBAL ordTSBAL oddsTSBAL loddsTSBAL;
Run;