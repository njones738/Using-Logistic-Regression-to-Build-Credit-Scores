libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

/* Import the un-merged dataframes from the read-only server,
       Then merge the dataframes into one by variable: Matchkey.
data testcpr;
	set cd4330.cpr;
run;
data testperf;
	set cd4330.perf;
run;
data merged;
	merge testcpr testperf;
	by Matchkey;
	   if last.Matchkey;
	   if delqid ne .;
	   if age ne .;
run;
Data class.Merged;
	set merged;
run;
/* End of import */

/* Create work frame of cpr and perf */
Data work.Merged_working;
	set class.Merged;
run;

/* let statement: rename( Merged_working to d1 ) */
%let d1 = Merged_working;

/* Before:: Imputing the median :: Means procedure */
Proc means data=&d1 n min max mean median nmiss maxdec=2;
	var ATMINB BRMOSOPN CRDPTH CUMINB CUMINH CUMAXB DCMINB DCMOSOPN DCAGE FFMOSOPN FFAGE MOSOPEN TMINAGE TOPENB50 INQAGE;
Run;

/* Histogram, Frequency, and Means procedures for BEACON 
Proc univariate data=&d1 noprint;
	Var BEACON;                       /* Beacon is missing. 
	histogram;
Run;
Proc means data=&d1 mean median;
	var BEACON;
run;
Proc freq data=&d1;
	Tables BEACON;
Run; 
Proc means data=&d1 mean median;
	var BEACON;
	where BEACON<99;
run; */

/* Imputing the median */
Data &d1;
	set &d1;
	if ATMINB > 9999994 
	  then ATMINB=214;
	else
	  ATMINB=ATMINB;
	if BRMOSOPN > 9999995 
	  then BRMOSOPN=322;
	else
	  BRMOSOPN=BRMOSOPN;	  	  
	if CRDPTH > 9995
	  then CRDPTH = 131;
	else
	  CRDPTH = CRDPTH;	  
	if CUMINB > 9999994
	  then CUMINB = 3345;
	else
	  CUMINB = CUMINB;	  
	if CUMINH > 9999993
	  then CUMINH = 5198;
	else
	  CUMINH = CUMINH;	  
	if CUMAXB > 9999994
	  then CUMAXB = 5254;
	else
	  CUMAXB = CUMAXB;	  
	if DCMINB > 9999994
	  then DCMINB = 78;
	else
	  DCMINB = DCMINB;	  
	if DCMOSOPN > 9999995
	  then DCMOSOPN = 129;
	else
	  DCMOSOPN = DCMOSOPN;  
	if DCAGE > 9995
	  then DCAGE = 85;
	else
	  DCAGE = DCAGE;  
	if FFMOSOPN > 9999995
	  then FFMOSOPN = 81;
	else
	  FFMOSOPN = FFMOSOPN;	  
	if FFAGE > 9995
	  then FFAGE = 60;
	else
	  FFAGE = FFAGE;	  
	if MOSOPEN > 9999995
	  then MOSOPEN = 888;
	else
	  MOSOPEN = MOSOPEN;	  
	if TMINAGE > 9995
	  then TMINAGE = 6;
	else
	  TMINAGE = TMINAGE;
	if TOPENB50 > 98
	  then TOPENB50 = 4;
	else
	  TOPENB50 = TOPENB50;	  
	if INQAGE > 9998
	  then INQAGE = 4;
	else
	  INQAGE = INQAGE;
run;


/* After:: Imputing the median :: Means procedure */
Proc means data=&d1 n min max mean median nmiss maxdec=2;
	var ATMINB BRMOSOPN CRDPTH CUMINB CUMINH CUMAXB DCMINB DCMOSOPN DCAGE FFMOSOPN FFAGE MOSOPEN TMINAGE TOPENB50 INQAGE;
Run;
Proc means data=class.merged n min max mean median nmiss maxdec=2;
	var ATMINB BRMOSOPN CRDPTH CUMINB CUMINH CUMAXB DCMINB DCMOSOPN DCAGE FFMOSOPN FFAGE MOSOPEN TMINAGE TOPENB50 INQAGE;
Run;

proc univariate data=&d1;
	var INQAGE;
	histogram;
run;