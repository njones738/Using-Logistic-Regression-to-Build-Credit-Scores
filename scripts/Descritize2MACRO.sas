Proc Print data=temp;
Run;

Proc sort data=temp;
by rank;
Run;

symbol1 v= square color = black i=join;
Proc gplot data = temp;
plot avg_dep*rank;
run;
quit;



Data ranked1;
Set ranked;
if rank = 0 then rank = 0;
else if rank = 1 then rank = 2;
else if rank = 2 then rank = 2;
else if rank = 3 then rank = 3;
else if rank = 4 then rank = 4;
else if rank = 5 then rank = 5;
else if rank = 6 then rank = 6;
else if rank = 7 then rank = 7;
else if rank = 8 then rank = 9;
else if rank = 9 then rank = 9;
else rank = rank;
Run;

Proc sort data=ranked1;
by rank;
Run;

Proc sort data=temp;
by rank;
Run;

Proc freq data=ranked1;
tables rank;
run;

Data disc2age;
Merge ranked1 temp;
by rank;
Run;



*****At this point, you can assign the ranks as 1, 2, 3...;


Data disc2age1;
set disc2age;
if rank = 0 then ordeqage = 1;
else if rank = 2 then ordeqage = 2;
else if rank = 3 then ordeqage = 3;
else if rank = 4 then ordeqage = 4;
else if rank = 5 then ordeqage = 5;
else if rank = 6 then ordeqage = 6;
else if rank = 7 then ordeqage = 7;
else if rank = 9 then ordeqage = 8;
else rank = rank;
odseqage  = (avg_dep)/(1-avg_dep);
lodseqage = log ((avg_dep)/(1-avg_dep));
testodseqage = (1-avg_dep)/(avg_dep);
run;


*Note: at this point, there is ALOT of garbage in the file that needs to be removed...;

Data disc2age1 (drop = _TYPE_ avg_dep avg_indp max_dep max_indp
min_dep min_indp numobs pvalue rank std_dep std_indp var);
set disc2age1;
Run;
