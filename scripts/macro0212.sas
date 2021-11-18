%MACRO disc2(pval_col=,var1=,d1=);

Proc Rank data=&d1 out=ranked groups = 10 ties = high;
ranks rank;
var &var1;
Run;

Proc Freq data=ranked;
Tables RANK;
Run;

*Here we are just checking to make sure that everything worked as expected;
*Again, no output created;
Proc Summary data=ranked missing mean std min max;
class rank;
Var &var1 GOODBAD;
Output out = summaryrank mean = avg_indp avg_dep std= std_indp std_dep min=min_indp min_dep 
max=max_indp max_dep;
Run;

Proc print data=summaryrank;
run;

*Note that the file reference here will be whatever was output from the Proc Summary;
**DO NOT CHANGE...EVER!;
proc sort data=summaryrank; by rank; run;
 

Data summaryrank;
Set summaryrank;
v1="&var1";
If _TYPE_ = 1;
rename _freq_ = numobs;
Run;

data temp;
   set summaryrank;
   by v1;
   retain _finit _rnk1 _rnk2 _freq1 _freq2 _aindp1 _aindp2
          _mindp1 _mindp2 _mxindp1 _mxindp2 _adep1 _adep2 
          _sdep1 _sdep2 _sdenom1 _sdenom2;

   *use _finit to flag when first initialization occurs;
   *First initialization is when the first non-missing level is;
   *encountered.  it is from this point forward that the t-tests;
   *take place, since missing levels are automatically outputted;
   *as their own level;

   if first.v1 then _finit=0;

   if rank<=.Z then output;
   else do;
      if _finit=0 then do;
         _finit=1;
		 _rnk1=rank;
		 _freq1=numobs;
		 _aindp1=numobs*avg_indp;
         _mindp1=min_indp;
         _mxindp1=max_indp;
         _adep1=numobs*avg_dep;
         if std_dep=. then _sdep1=0;
         else _sdep1=(numobs-1)*std_dep*std_dep;
         _sdenom1=numobs-1;
      end;
      else do;
         _w1=(_sdep1/_sdenom1)/_freq1;
         _w2=(std_dep**2)/numobs;
         _df=((_w1+_w2)**2)/((_w1**2)/(_freq1-1)+(_w2**2)/(numobs-1));
         _t=abs(_adep1/_freq1-avg_dep)/sqrt(_w1+_w2);
         pvalue=(1-probt(_t,round(_df,1)))*2;
      
	     * If t-test is significant, then output cumulated variables;
         * Otherwise continue cumulating;
         if pvalue<=&pval_col then do;
            * Store current row;
            _rnk2=rank;
            _freq2=numobs;
		    _aindp2=numobs*avg_indp;
            _mindp2=min_indp;
            _mxindp2=max_indp;
            _adep2=numobs*avg_dep;
            if std_dep=. then _sdep2=0;
            else _sdep2=(numobs-1)*std_dep*std_dep;
            _sdenom2=numobs-1;

		    * Switch cumulated variables with current row and output;
            rank=_rnk1;
            numobs=_freq1;
		    avg_indp=_aindp1/_freq1;
            min_indp=_mindp1;
            max_indp=_mxindp1;
            avg_dep=_adep1/_freq1;
            std_dep=sqrt(_sdep1/_sdenom1);
            output;

            * Set first variables to current row;
            _rnk1=_rnk2;
            _freq1=_freq2;
		    _aindp1=_aindp2;
            _mindp1=_mindp2;
            _mxindp1=_mxindp2;
            _adep1=_adep2;
            _sdep1=_sdep2;
            _sdenom1=_sdenom2;
         end;
        	else do; 
       		_rnk1=rank;
      		_freq1=_freq1+numobs;
       		_aindp1=_aindp1+numobs*avg_indp;
      		_mxindp1=max_indp;
      		_adep1=_adep1+numobs*avg_dep;
     		if std_dep ne . then _sdep1=_sdep1+(numobs-1)*std_dep*std_dep;
     		_sdenom1=_sdenom1+numobs-1;
  		end;


         *end;

         * If last row for current variable, then output;
         if last.v1 then do;
           rank=_rnk1;
           numobs=_freq1;
           avg_indp=_aindp1/_freq1;
           min_indp=_mindp1;
           max_indp=_mxindp1;
           avg_dep=_adep1/_freq1;
           std_dep=sqrt(_sdep1/_sdenom1);
           output;
         end;
      end;
   end;
   drop _finit _rnk1 _rnk2 _freq1 _freq2 _aindp1 _aindp2
        _mindp1 _mindp2 _mxindp1 _mxindp2 _adep1 _adep2
        _sdep1 _sdep2 _sdenom1 _sdenom2 _w1 _w2 _df _t /*pvalue*/;
run;

Proc Print data=temp;
Run;

%MEND;