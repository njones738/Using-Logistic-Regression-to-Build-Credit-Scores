/* --------------------------------------------------------------------------------------------------------------------------------------- */
/* ------ LEAST-VARIABLE MODEL------------------------------------------------------------------------------------------------------------ */
/* --------------------------------------------------------------------------------------------------------------------------------------- */
Proc Logistic data=class.train des outest=betas 
		outmodel=class.scoringdata_LEAST plots=ROC;
	model GOODBAD=RADB6 BRR23 BRR4524 /selection=stepwise CTABLE pprob=(0 to 1 
		by .0001) LACKFIT RISKLIMITS;
	output out=output_LEAST p=predicted;
	score data=class.valid out=class.score_LEAST;
Run;
data test_LEAST; set class.score_LEAST; if P_1 ge 0.2008 then preds=1; else preds=0;run;
proc freq data=test_LEAST;	table goodbad*preds / norow nocol;run;
data probs1_LEAST; set test_LEAST(keep=preds GOODBAD crelim); crelim2=crelim/2; if preds=1 AND GOODBAD=0 then outcometype="ERROR2"; else if preds=0 AND GOODBAD=1 then outcometype="ERROR1"; else if preds=1 AND GOODBAD=1 then outcometype="VALID1"; else outcometype="VALID2"; if outcometype="ERROR1" then profit=-crelim2; else if outcometype="ERROR2" then profit=0; else if outcometype="VALID2" then profit=250; else if outcometype="VALID1" then profit=0; run;
PROC REPORT DATA=probs1_LEAST nowd; COLUMN outcometype pct n profit pper1000; DEFINE outcometype /group width=8; DEFINE profit /format=dollar15.2; define pper1000 / computed format=dollar15.2; compute before; overall=n; endcomp; compute pper1000; pper1000=(profit.sum/n)*1000; endcomp; compute before outcometype; totaln=n; endcomp; compute pct; pct=(totaln/overall); if _break_='_RBREAK_' then pct=(overall/overall); endcomp; rbreak after/summarize dol;RUN;quit;


/* Transactional Analysis */
Proc sort data=class.score_BEST;	by matchkey;run;
Data tranrev (drop=trandate trancode);	set CD4330.tran;run;
Proc sort data=tranrev;	by matchkey;run;
Data tranmaster;merge tranrev class.score_BEST;by matchkey;if matchkey=. then delete;run;
Proc freq data=tranmaster order=freq;tables transic*goodbad/ nocol nopercent;run;
Proc means data=tranmaster;var tranamt;class transic;run;

/* -------------------------------------------------------------------------------------- */
/* --------------------------------------Cluste analysis------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------- */

%let inputs = FFRATE3 oddsTADB25 testodseqBRCRATE1 loddsTOPENB75 testodseqFFMOSOPN 
		OBRPTAT loddsTSBAL oddsTSBAL oddsBRMINH FFRATE2 odseqFFMOSOPN lodseqBNKINQ2 
		oddsFFAGE loddsTOPEN12 odseqTOPENB75 ORDFININQS DCRATE2 ORDTOPEN12 TOPEN6 
		loddsPRMINQS loddsBNKINQ2 TRCR49 ordeqBRMOSOPN BADPR1 TSBAL ORDPRMINQS 
		oddsBNKINQ2 AVGMOS BINQ12 BNKINQ2 BRCR39 BRCR1BAL BRCRATE1 BRCRATE2 BRCRATE3 
		BRCRATE4 BRMINB BRMINH BRMOSOPN BRNEW BRPOPEN BRR23 BRR324 BRR4524 BRR39P24 
		BRRATE2 BRRATE79 COLLS CPAF29 CRDPTH DCCR1BAL DCMOSOPN DCOPENEX DCR49 DCR224 
		DCR4524 DCR29P24 DCRATE79 DCWCRATE FFAGE FFCR49 FFCR1BAL FFLAAGE FFPCTSAT 
		FFR29 FFR224 FFWCRATE LOCINQS ORDAVGMOS ORDBRMINB ORDBRNEW ORDOT6PTOT 
		ORDRADB6 OT24PTOT OT6PTOT PFR49 PFRATE1 PFRATE2 PFRATE3 PFRATE45 PRMINQ2 
		RADB6 TADB25 TOPEN TOPENB75 TPOPEN loddsBRMINB loddsBRMINH loddsBRPOPEN 
		loddsCRDPTH loddsDCMOSOPN loddsOBRPTAT loddsOT24PTOT loddsRADB6 loddsRBAL 
		lodseqBRCRATE1 lodseqBRHIC lodseqBRMOSOPN lodseqBRPOPEN lodseqRADB6 
		lodseqTADB25 lodseqTOPEN lodseqTOPENB75 lodseqTROPENEX lodseqTSBAL oddsAVGMOS 
		oddsBRMINB oddsOBRPTAT oddsOT24PTOT oddsRADB6 odseqBRHIC odseqBRMOSOPN 
		odseqTOPEN ordeqBADPR1 ordeqBNKINQ2 ordeqBRCRATE1 ordeqBRHIC ordeqBRPOPEN 
		ordeqFFMOSOPN ordeqLOCINQS ordeqOBRPTAT ordeqPRMINQ2 ordeqTOPEN ordeqTOPENB75 
		ordeqTROPENEX ordeqTSBAL testodseqBADPR1 testodseqBRHIC testodseqTADB25 
		testodseqTSBAL;
Proc stdize data=class.score_full method=range out=temp;var &inputs;run;
proc fastclus data=temp maxc=4 maxiter=10 out=clus;
	var FFRATE3 oddsTADB25 testodseqBRCRATE1 loddsTOPENB75 testodseqFFMOSOPN 
		OBRPTAT loddsTSBAL oddsTSBAL oddsBRMINH FFRATE2 odseqFFMOSOPN lodseqBNKINQ2 
		oddsFFAGE loddsTOPEN12 odseqTOPENB75 ORDFININQS DCRATE2 ORDTOPEN12 TOPEN6 
		loddsPRMINQS loddsBNKINQ2 TRCR49 ordeqBRMOSOPN BADPR1 TSBAL ORDPRMINQS 
		oddsBNKINQ2 AVGMOS BINQ12 BNKINQ2 BRCR39 BRCR1BAL BRCRATE1 BRCRATE2 BRCRATE3 
		BRCRATE4 BRMINB BRMINH BRMOSOPN BRNEW BRPOPEN BRR23 BRR324 BRR4524 BRR39P24 
		BRRATE2 BRRATE79 COLLS CPAF29 CRDPTH DCCR1BAL DCMOSOPN DCOPENEX DCR49 DCR224 
		DCR4524 DCR29P24 DCRATE79 DCWCRATE FFAGE FFCR49 FFCR1BAL FFLAAGE FFPCTSAT 
		FFR29 FFR224 FFWCRATE LOCINQS ORDAVGMOS ORDBRMINB ORDBRNEW ORDOT6PTOT 
		ORDRADB6 OT24PTOT OT6PTOT PFR49 PFRATE1 PFRATE2 PFRATE3 PFRATE45 PRMINQ2 
		RADB6 TADB25 TOPEN TOPENB75 TPOPEN loddsBRMINB loddsBRMINH loddsBRPOPEN 
		loddsCRDPTH loddsDCMOSOPN loddsOBRPTAT loddsOT24PTOT loddsRADB6 loddsRBAL 
		lodseqBRCRATE1 lodseqBRHIC lodseqBRMOSOPN lodseqBRPOPEN lodseqRADB6 
		lodseqTADB25 lodseqTOPEN lodseqTOPENB75 lodseqTROPENEX lodseqTSBAL oddsAVGMOS 
		oddsBRMINB oddsOBRPTAT oddsOT24PTOT oddsRADB6 odseqBRHIC odseqBRMOSOPN 
		odseqTOPEN ordeqBADPR1 ordeqBNKINQ2 ordeqBRCRATE1 ordeqBRHIC ordeqBRPOPEN 
		ordeqFFMOSOPN ordeqLOCINQS ordeqOBRPTAT ordeqPRMINQ2 ordeqTOPEN ordeqTOPENB75 
		ordeqTROPENEX ordeqTSBAL testodseqBADPR1 testodseqBRHIC testodseqTADB25 
		testodseqTSBAL;run;
proc freq data=clus;tables cluster*goodbad;run;
proc candisc data=clus anova out=can;
	class cluster;
	var FFRATE3 oddsTADB25 testodseqBRCRATE1 loddsTOPENB75 testodseqFFMOSOPN 
		OBRPTAT loddsTSBAL oddsTSBAL oddsBRMINH FFRATE2 odseqFFMOSOPN lodseqBNKINQ2 
		oddsFFAGE loddsTOPEN12 odseqTOPENB75 ORDFININQS DCRATE2 ORDTOPEN12 TOPEN6 
		loddsPRMINQS loddsBNKINQ2 TRCR49 ordeqBRMOSOPN BADPR1 TSBAL ORDPRMINQS 
		oddsBNKINQ2 AVGMOS BINQ12 BNKINQ2 BRCR39 BRCR1BAL BRCRATE1 BRCRATE2 BRCRATE3 
		BRCRATE4 BRMINB BRMINH BRMOSOPN BRNEW BRPOPEN BRR23 BRR324 BRR4524 BRR39P24 
		BRRATE2 BRRATE79 COLLS CPAF29 CRDPTH DCCR1BAL DCMOSOPN DCOPENEX DCR49 DCR224 
		DCR4524 DCR29P24 DCRATE79 DCWCRATE FFAGE FFCR49 FFCR1BAL FFLAAGE FFPCTSAT 
		FFR29 FFR224 FFWCRATE LOCINQS ORDAVGMOS ORDBRMINB ORDBRNEW ORDOT6PTOT 
		ORDRADB6 OT24PTOT OT6PTOT PFR49 PFRATE1 PFRATE2 PFRATE3 PFRATE45 PRMINQ2 
		RADB6 TADB25 TOPEN TOPENB75 TPOPEN loddsBRMINB loddsBRMINH loddsBRPOPEN 
		loddsCRDPTH loddsDCMOSOPN loddsOBRPTAT loddsOT24PTOT loddsRADB6 loddsRBAL 
		lodseqBRCRATE1 lodseqBRHIC lodseqBRMOSOPN lodseqBRPOPEN lodseqRADB6 
		lodseqTADB25 lodseqTOPEN lodseqTOPENB75 lodseqTROPENEX lodseqTSBAL oddsAVGMOS 
		oddsBRMINB oddsOBRPTAT oddsOT24PTOT oddsRADB6 odseqBRHIC odseqBRMOSOPN 
		odseqTOPEN ordeqBADPR1 ordeqBNKINQ2 ordeqBRCRATE1 ordeqBRHIC ordeqBRPOPEN 
		ordeqFFMOSOPN ordeqLOCINQS ordeqOBRPTAT ordeqPRMINQ2 ordeqTOPEN ordeqTOPENB75 
		ordeqTROPENEX ordeqTSBAL testodseqBADPR1 testodseqBRHIC testodseqTADB25 
		testodseqTSBAL; title2 ’Canonical Discriminant Analysis of Iris Clusters’; run;
legend1 frame cframe=white label=none cborder=black position=center value=(justify=center); axis1 label=(angle=90 rotate=0) minor=none; axis2 minor=none;
proc gplot data=Can; plot Can2*Can1=Cluster/frame cframe=white legend=legend1 vaxis=axis1 haxis=axis2; title2 ’Plot of Canonical Variables Identified by Cluster’; run;
data test_BEST; set work.clus; if P_1 ge 0.2163 then preds=1; else preds=0; where cluster=4; run;
proc freq data=test_BEST; table goodbad*preds / norow nocol; run;
data probs1_BEST; set test_BEST(keep=preds GOODBAD crelim); crelim2=crelim/2; if preds=1 AND GOODBAD=0 then outcometype="ERROR2"; else if preds=0 AND GOODBAD=1 then outcometype="ERROR1"; else if preds=1 AND GOODBAD=1 then outcometype="VALID1"; else outcometype="VALID2"; if outcometype="ERROR1" then profit=-crelim2; else if outcometype="ERROR2" then profit=0; else if outcometype="VALID2" then profit=250; else if outcometype="VALID1" then profit=0;run;
PROC REPORT DATA=probs1_BEST nowd; COLUMN outcometype pct n profit pper1000; DEFINE outcometype /group width=8; DEFINE profit /format=dollar15.2; define pper1000 / computed format=dollar15.2; compute before; overall=n; endcomp; compute pper1000; pper1000=(profit.sum/n)*1000; endcomp; compute before outcometype; totaln=n; endcomp; compute pct; pct=(totaln/overall); if _break_='_RBREAK_' then pct=(overall/overall); endcomp; rbreak after/summarize dol; RUN;