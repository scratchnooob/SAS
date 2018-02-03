proc import datafile = '/folders/myfolders/sasuser.v94/cereal.csv'
out = work.cereal
dbms = CSV
replace;
run;

proc print data=work.cereal;
run;

/*proc format library=work.formats;
VALUE $cereal_mfr 'A' = 'American Home Food Products'
'G' = 'General Mills'
'K' = 'Kelloggs'
'N' = 'Nabisco'
'P' = 'Post'
'Q' = 'Quaker Oats'
'R' = 'Ralston Purina';
VALUE $hotcold 'C'='cold'
'H'='hot';
run;

*/
PROC CONTENTS data=work.cereal; RUN;

PROC PRINT data=work.cereal(OBS=5);
var name mfr type;
run;

proc import datafile = '/folders/myfolders/sasuser.v94/cereal.csv'
out = work.cerealnew
dbms = CSV
replace;
run;

proc print data=work.cerealnew obs;
run;

data work.cerealnew;
set work.cerealnew;
calories_PC= calories/cups;
carbo_PC= carbo/cups;
fat_PC=fat/cups;
fiber_PC=fiber/cups;
potass_PC=potass/cups;
protein_PC=protein/cups;
sodium_PC= sodium/cups;
sugars_PC = sugars/cups;
vitamins_PC =vitamins/cups;
run;

proc print data=work.cerealnew (obs=1);
var name calories_PC sugars_PC;
run;

proc print data=work.cerealnew (obs=1);
var name calories_PC sugars_PC;
format calories_PC sugars_PC 8.;
run;

proc sort data=work.cerealnew ;
by descending calories_PC;
run;

proc print data=work.cerealnew(obs=5);
var name calories_PC sugars_PC;
format calories_PC sugars_PC 8.;
run;

proc sort data=work.cerealnew;
by sugars_PC;
run;

proc print data=work.cerealnew(obs=5);
var name sugars_PC;
format sugars_PC 8.;
run;
proc print data=work.cerealnew(obs=5);
where mfr='N';
var name mfr calories_PC;
format calories_PC 8.;
run;

proc sort data=work.cerealnew;
by sodium_PC;
run;
proc print data=work.cerealnew(obs=5);
where type='H';
var type name sodium_PC;
format sodium_PC 8.;
run;

PROC sort DATA = WORK.cerealnew;
BY descending sugars_PC;
RUN;
PROC PRINT data=work.cerealnew(obs=10);
var type name sodium_PC sugars_PC potass_PC;
format calories_PC sugars_PC protein_PC sodium_PC potass_PC  8.;
run;
PROC sort DATA = WORK.cerealnew;
BY  sugars_PC;
RUN;
PROC PRINT data=work.cerealnew(obs=10);
var type name sodium_PC sugars_PC potass_PC;
format calories_PC sugars_PC protein_PC sodium_PC potass_PC  8.;
run;

