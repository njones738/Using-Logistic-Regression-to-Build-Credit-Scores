libname class "/gpfs/user_home/os_home_dirs/njones71/Binary/class_DataFrame";

/* Import 
data testcpr;
	set cd4330.cpr;
run;
data testperf;
	set cd4330.perf;
run;/**/

/* Sort
proc sort data=testperf;
	by Matchkey delqid;
run;
proc sort data=testcpr;
	by Matchkey;
run;/**/
/* Merger 
data work.merged;
	merge testcpr testperf;
	by Matchkey;
	   if last.Matchkey;
	   if delqid ne .;
	   if age ne .;
run;

Data class.merged;
	set work.merged;
run;

/*proc contents data=class.merged; run;/**/

/* Create goodbad 
Data class.merged;
	set class.merged;
	if delqid <3 then
		goodbad=0;
	else
		goodbad=1;
run;/**/

/* Visuals & Contents
proc contents data=class.merged; run;
proc means data=class.merged; run;
proc sgplot data=class.merged; histogram delqid; title 'Histogram of delqid'; run;
proc sgplot data=class.merged; histogram LOCINQS; title 'Histogram of LOCINQS'; run;
proc freq data=class.merged; table goodbad; run;/**/


/* Run Macro 
Data work.runmacro (drop= AGE CASHAMT CASHBAL CHGOFFID CYCLEDT LATEFEE NUMCASH NUMPAY NUMPUR OPENDATE OVLIMFEE PAYAMT PAYDUE PURAMT PURBAL TBAL);
	set class.merged;
run;
%IMPV3 (DSN= work.runmacro,                                      
       VARS= _ALL_,                                                
    EXCLUDE= matchkey crelim delqid goodbad,                      
     PCTREM= 0.4284506154028257,                                           
       MSTD= 4                                                     
       );
proc means data=work.runmacroout max; run;
/*Proc contents data = work.runmacroout; run;/* VARS LEFT: 204 */


/* Set Macro output to merged 
data class.merged;
	set work.runmacroout;
	drop DCCRATE2 DCCRATE3 DCCRATE4 DCR324 FFCRATE2 FFCRATE3 FFCRATE4 FFRATE45 FFR324 FFR4524 DCR23 FFR23;
run;/* VARS LEFT: 192 */
/*Proc contents data = class.merged; run;/* VARS LEFT: 192 */

/* Check */
proc means data=class.merged max; run;
Proc contents data = class.merged; run;/**/
/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
/*Variable Clustering as an option for Variable reduction;*/*/*/*/*/*/*/
/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/;

/* Set inputs that have data 
%let inputs = OT3PTOT OT6PTOT BKP BKPOP BRCRATE2 BRCRATE3 DCRATE3 DCRATE45 DCR224 DCR4524 FFRATE2 FFRATE3 FFR224 FFR7924 ORRATE3 PFRATE2 PFRATE3 PFRATE45 TPCTSAT BRPCTSAT DCPCTSAT FFPCTSAT FFN90P24 TPOPEN BRPOPEN FFR39P24 OBRPTAT  OT12PTOT TADB RADB6 BRADB CRATE2 CRATE3 BRCRATE4 BRRATE3 BRR324 DCCRATE7 DCRATE2 DCRATE79 DCR7924 FFCRATE7 FFRATE79 PFRATE79 DCN90P24 FFR39 FFR49 FFR29P24 DCR39P24 BRR23 FFCR39 DCCR49 FFCR49 OT24PTOT BRADBM CRATE45 TR324 BRRATE45 BRR224 BRR4524 BRR7924 DCR39 PFR39 DCR49 PFR49 FFR29 DCR29P24 DCCR39 TOPEN3 TRATE3 TR4524 BRCRATE7 BRRATE2 BRRATE79 PFR29 DCR29 DCCR1BAL FFCR1BAL TRR23 TRATE45 TR224 BRLAAGE BRN90P24 CPAF29 BRCR49 TOPEN6 FFCRATE1 FFRATE1 FFR124 BRR49 BRR39P24 BRCR39 BINQ12 COLLS TRATE2 FFTRADES BRR29P24 FFOPENEX DELQID DCRATE1 DCR124 BRR39 WCRATE BRWCRATE DCTRADES DCWCRATE DCCRATE1 FFWCRATE DCOPENEX TR7924 BRBAL75 BRR29 TOPEN12 LOCINQS BRBAL50 TN90P24 FININQS NMPRBD BADPR2 TR39P24 BROPENB0 BADPR1 BRCR1BAL CRATE79 TRATE79 TOPENB75 TR39PR24 TR29P24 TRCR39 TRCR49 PFRATE1 TRR49 TOPENB50 BROPEN PFTRADES TRR39 BNKINQ2 TOPEN24 BRR124 INQ12 TADB25 TRR29 BRRATE1 TCR1BAL INQAGE LAAGE TOPENB0 BRCRATE1 BRTRADES BROPENEX BNKINQS ROPEN TOPEN TR124 PRMINQ2 TRATE1 CRATE1 TMINAGE TROPENEX DCLAAGE TRADES FFLAAGE PRMINQS BRNEW BRAVGMOS AVGMOS FFAVGMOS DCAVGMOS BRAGE FFAGE DCAGE CRDPTH FFMOSOPN DCMOSOPN BRMOSOPN RAVGBAL MOSOPEN BRMINH BRMINB BRMAXB BRMAXH BRBAL RBAL6 RBAL BRHIC TSBAL RHIC6 TSHIC;/**/

/* Variable Clustering 
ods listing close;
ods output clusterquality = summary rsquare=clusters;

proc varclus data = class.merged outtree = tree maxclusters=100;
var &inputs;
run;
ods listing;

data _null_;
set class.sum;
call symput ('nvar',compress(NumberofClusters));
run;

proc print data = class.clust noobs;
where NumberofClusters = 78;
var cluster variable rsquareratio;
run;

proc contents data=summary varnum;
 run;

symbol v=square color=black i=join;
proc gplot data=summary;
 plot propvarexplained*numberofclusters;
run;
quit;/**/

/*            
data class.clust;
	set work.CLUSTERS;
run;

data class.sum;
	set work.SUMMARY;
run;

data class.tre;
	set work.tree;
run;/**/

/* Check 
proc means data=class.merged max Q3 median min; run;
Proc contents data = class.merged; run;/**/

/* Set results of Variable Clustering 
data class.merged;
	set class.merged;
	keep matchkey crelim delqid goodbad ;
run;/**/

/* VIF 
%let inputs = TRCR49 BROPENEX BRCR39 TOPEN12 TROPENEX DCRATE79 FFCR49 BRR324 FFCRATE1 BRCR1BAL DCOPENEX PFR49 RADB6 BRR4524 BRRATE2 PFRATE1 DCAVGMOS RBAL CRDPTH LOCINQS FFOPENB0 FFN90P24 BADPR1 PRMINQS BRHIC DCR4524 OT6PTOT FFPOPEN BRR23 BRR39P24 DCR29P24 LAAGE BRMINB BRCRATE2 OT24PTOT DCR224 DCWCRATE COLLS DCLAAGE ROPEN TPOPEN FFRATE3 DCRATE2 BKPOP PFRATE45 TOPENB75 PFRATE3 FFRATE2 PFRATE2 OPFPTAT BNKINQ2 OFFPTAT BRPOPEN PRMINQ2 DCRATE3 FFR224 OBRPTAT BINQ12 ORRATE3 DCCR1BAL FFMOSOPN BKP BRCRATE4 FININQS FFLAAGE FFWCRATE PFOPEN TOPEN6 CPAF29 TSBAL DCR49 FFAVGMOS FFAGE BRCRATE3 BRNEW BRMINH TADB25 BRRATE79;

proc reg data=class.merged;
	model goodbad = &inputs / vif;
	
proc contents data=class.merged; run;/* VARS LEFT: 78 + matchkey crelim delqid goodbad */



/* ------------------------------------------------------------------------------------------------- */
/* For the report 
proc means data=work.merged; 
	var BKPOP LOCINQS FFAVGMOS CRDPTH TSBAL;
run;
proc means data=class.merged;
	var BKPOP LOCINQS FFAVGMOS CRDPTH TSBAL;
run;

proc sgplot data=work.merged;
	histogram LOCINQS / binwidth=1;
	title 'Histogram of LOCINQS';
run;
proc sgplot data=class.merged;
	histogram LOCINQS / binwidth=1;
	title 'Histogram of LOCINQS';
run;/**/

















