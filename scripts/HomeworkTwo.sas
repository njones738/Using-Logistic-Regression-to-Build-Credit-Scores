libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

/* Import the un-merged dataframes from the read-only server,
       Then merge the dataframes into one by variable: Matchkey. */
data testcpr;
	set cd4330.cpr;
run;
data testperf;
	set cd4330.perf;
run;
/* Proc contents data = testperf; run; */
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

/* Impute the Dataset */
Data class.run_macro (drop= CASHAMT CASHBAL CHGOFFID CYCLEDT LATEFEE NUMCASH NUMPAY NUMPUR OPENDATE OVLIMFEE PAYAMT PAYDUE PURAMT PURBAL TBAL);
	set class.Merged;
run;/**/

/* Copy and print for fresh macro statement
Data frame;
	set ;
run;

%IMPV3 (DSN= , VARS= , EXCLUDE= , PCTREM= , MSTD= );

Proc contents data = testout; run;
*/

%IMPV3 (DSN= class.run_macro,                                      /* Input for Dataset                 */
       VARS= _ALL_,                                                /* Input for Variable selection      */
    EXCLUDE= matchkey crelim delqid goodbad,                       /* Input for Variable exclusion      */
     PCTREM= 0.6,                                                   /* Input for limit of recoded values */
       MSTD= 4                                                     /* Input for Max Std Dev.            */
       );
Proc contents data = class.run_macro; run;/**/
/*       
Proc surveyselect data=class.run_macro out=class.the_sample sampsize=10000 method=srs 
		seed=123456789;
Run;/**/
