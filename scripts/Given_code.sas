libname class "/gpfs/user_home/os_home_dirs/njones71/Binary";

data testcpr;
	set cd4330.cpr;
run;

data testperf;
	set cd4330.perf;
run;

proc freq data=testperf;
	tables delqid;
	*SINCE THE DEPENDENT VARIABLE AND THE PREDICTORS ARE IN DIFFERENT FILES
		WE NEED TO MERGE THEM;

proc sort data=testperf;
	by Matchkey delqid;
run;

proc sort data=testcpr;
	by Matchkey;
run;

proc contents data=testcpr;
run;

/*
Data badtest;
merge testcpr testperf;
run;
Proc print data=badtest (obs=100);
var matchkey delqid trades age;
run;
*/
*Let's try a different approach!;

proc sql;
	create table test1 as select matchkey, count(distinct delqid) as COUNT from 
		badtest group by matchkey having count>1;
quit;

Proc print data=test1 (obs=20);
run;

data merged;
	merge testcpr testperf;
	by Matchkey;

	if last.Matchkey;

	if delqid ne .;

	if age ne .;
run;

proc print data=merged (obs=20);
run;

proc contents data=merged;
run;

*THIS LOOKS GOOD.  LETS PUT IT IN OUR PERMANENT LIBRARY;

Data Class.Merged;
	set merged;
run;

*////////////////////////////////////////////////;
*/Establish binary Dependent variable////////////;
*/if there is no DELQID,what are you going to do?;
*QUESTION - If age is missing, I can tell you////


		that the whole observation is missing////////////;
*////////////////////////////////////////////////;

Data class.merged1;
	set class.Merge;

	if delqid <3 then
		goodbad=0;
	else
		goodbad=1;
run;

Proc freq data=class.merged1;
	tables goodbad;
run;

/* create a sample of 10k observations */
Proc surveyselect data=class.merged1 out=class.the_sample sampsize=10000 
		method=srs seed=123456789;
Run;

Proc contents data=class.the_sample;
Run;

data class.merged;
	set merged1;
run;

*/////////////////////////////////////////////////////////////////////////////////;
* checking and cleaning potential predictors - cleaning 7 predictors as an example;
*/////////////////////////////////////////////////////////////////////////////////;
*Note - at this point you have 338 potential predictors. You may want to consider cleaning all of them - or at least the
ones that are not dominated by missing/coded values.  Then, execute ttests, plots...dont forget about power issues;
*///Predictor 1 - Age///;
%let d1 = merged;

Proc univariate data=&d1 noprint;
	Var age;
	histogram;
Run;

/*
Proc freq data=&d1;			 Do NOT run
Tables age;
Run; */
Proc means data=&d1 mean median;
	var age;
	where age<99;
run;

*Imputing the median;

Data &d1;
	set &d1;

	if age=99 then
		age=47;
	else
		age=age;
run;

Proc means data=&d1 n min max mean median nmiss maxdec=2;
	var age;
Run;

/* -------------------------------------------------------------------------------------------------- */
/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/

	/*Variable Clustering as an option for Variable reduction;
*/*/*/*/*/*/*/

	/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/;
%let inputs = bnkinqs dcbal trades age rbal brage brnew;

proc reg data=class.merged;
	model goodbad=&inputs / vif;
	ods listing close;
	ods output clusterquality=summary rsquare=clusters;

proc varclus data=class.merged outtree=tree maxclusters=7;
	var &inputs;
run;

ods listing;

data _null_;
	set summary;
	call symput ('nvar', compress(NumberofClusters));
run;

proc print data=clusters noobs;
	where NumberofClusters=&nvar;
	var cluster variable rsquareratio;
run;

proc contents data=summary varnum;
run;

symbol v=square color=black i=join;

proc gplot data=summary;
	plot propvarexplained*numberofclusters;
	run;
quit;