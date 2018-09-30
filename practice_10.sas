/* Practice 10 */
/* Fisher Ankney */

title 'Fisher Ankney';
title2 'Practice 10';

dm 'odsresults; clear; log; clear';



/* Question 1a */

libname classhw 'C:\Users\Fankney';

PROC IMPORT OUT= CLASSHW.bb17 
            DATAFILE= "C:\Users\Fankney\Downloads\BASKETBALL.xlsx"
            DBMS=EXCEL REPLACE;
     RANGE="Year2017"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;


PROC IMPORT OUT= CLASSHW.bb18 
            DATAFILE= "C:\Users\Fankney\Downloads\BASKETBALL.xlsx"
            DBMS=EXCEL REPLACE;
     RANGE="Year2018"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;





/* Question 1b */

data classhw.bb17;
	set classhw.bb17;
	length Team $ 24;
	label 
	Team = 'Team'
	ORB = 'Offensive Rebound'
	DRB = 'Defensive Rebound'
	AST = 'Assist'
	BLK = 'Blocked Shots'
	TOV = 'Turnover';
run;


data classhw.bb18;
	set classhw.bb18;
	title3 'Question 1b';
	length Team $ 24;
	label 
	Team = 'Team'
	ORB = 'Offensive Rebound'
	DRB = 'Defensive Rebound'
	AST = 'Assist'
	BLK = 'Blocked Shots'
	TOV = 'Turnover'; 
run;





/* Question 1c */

Title3 'Question 1c';

data nba17;
input Team $ 1-24 fg fga p3 ft; 
label fg = 'Field Goals' 
	fga='Field Goal Attempted'
	p3='3-Pointers'
	ft='free throws';
year=2017; 
datalines; 
Golden State Warriors	43.1	87.1	12		17.8
Houston Rockets 		40.3	87.2	14.4	20.3
Denver Nuggets 			41.2	87.7	10.6	18.7
Cleveland Cavaliers	    39.9	84.9	13		17.5
Washington Wizards		41.3	87		9.2		17.3
Los Angeles Clippers	39.5	83.2	10.3	19.3
Boston Celtics			38.6	85.1	12		18.2
Portland Trail Blazers	39.5	86.1	10.4	18.5
Phoenix Suns			39.9	88.5	7.5		20.4
Toronto Raptors			39.2	84.4	8.8		19.7
Oklahoma City Thunder	39.5	87.4	8.4		19.2
Brooklyn Nets			37.8	85.2	10.7	19.4
Minnesota Timberwolves	39.5	84.4	7.3		19.3
San Antonio Spurs		39.3	83.7	9.2		17.6
Indiana Pacers			39.3	84.5	8.6		17.9
Charlotte Hornets		37.7	85.4	10		19.4
Los Angeles Lakers		39.9	87.4	8.9		17
New Orleans Pelicans	39.1	87		9.4		16.7
New York Knicks			39.6	88.5	8.6		16.6
Milwaukee Bucks			38.8	81.9	8.8		17.2
Miami Heat				39		85.8	9.9		15.2
Atlanta Hawks			38.1	84.4	8.9		18.1
Chicago Bulls			38.6	87.1	7.6		18
Sacramento Kings		37.9	82.1	9		18.1
Philadelphia 76ers		37.7	85.3	10.1	17
Detroit Pistons			39.9	88.8	7.7		13.9
Orlando Magic 			38.3	87		8.5		16
Utah Jazz				37		79.5	9.6		17.1
Memphis Grizzlies		36.4	83.6	9.4		18.3
Dallas Mavericks		36.2	82.3	10.7	14.8
;


data nba18;
input team $ 1-24 fg fga p3 ft;
label fg = 'Field Goals' 
	fga='Field Goal Attempted'
	p3='3-Pointers'
	ft='free throws'; 
year=2018;
datalines; 
Golden State Warriors	42.8	85.1	11.3	16.6
Houston Rockets			38.7	84.2	15.3	19.6
New Orleans Pelicans	42.7	88.3	10.2	16.1
Toronto Raptors			41.3	87.4	11.8	17.3
Cleveland Cavaliers		40.4	84.8	12		18.1
Denver Nuggets			40.7	86.6	11.5	17.1
Philadelphia 76ers		40.8	86.6	11		17.1
Minnesota Timberwolves	41		86.1	8		19.4
Los Angeles Clippers	40.3	85.4	9.5		19
Charlotte Hornets		39		86.7	10		20.2
Los Angeles Lakers		40.7	88.4	10		16.6
Oklahoma City Thunder	39.9	88.1	10.7	17.3
Washington Wizards		39.9	85.6	9.9		16.8
Brooklyn Nets			38.2	86.8	12.7	17.4
Milwaukee Bucks			39.7	83		8.8		18.3
Portland Trail Blazers	39.3	87		10.3	16.7
Indiana Pacers			40.8	86.4	9		14.9
New York Knicks			40.7	87.7	8.2		14.9
Utah Jazz				38.3	82.9	10.8	16.8
Boston Celtics			38.3	85.1	11.5	16
Phoenix Suns			38.5	87.1	9.3		17.7
Detroit Pistons			39.1	86.9	10.8	14.7
Miami Heat				38.8	85.3	11		14.7
Orlando Magic			38.8	85.9	10.3	15.5
Atlanta Hawks			38.2	85.5	11.2	15.8
Chicago Bulls			38.7	88.8	11		14.6
San Antonio Spurs		39		85.4	8.5		16.1
Dallas Mavericks		38.1	85.9	11.8	14.2
Memphis Grizzlies		36.7	82.8	9.2		16.6
Sacramento Kings		38.8	86.1	9		12.3
;




/* Question 1d */

title3 'Question 1d';

data classhw.BBall2017;
	merge nba17 classhw.bb17; 
	points=((fg-p3)*2)+(p3*3)+ft;
run; 

data classhw.BBall2018;
	merge nba18 classhw.bb18; 
	points=((fg-p3)*2)+(p3*3)+ft;
run; 

proc print data=classhw.BBall2017 label noobs; 
run; 

proc print data=classhw.BBall2018 label noobs; 
run; 


/* Question 1e */

title3 'Question 1e';

data classhw.BBall2017_18;
	set classhw.BBall2017 classhw.BBall2018; 
run; 

proc print data=classhw.BBall2017_18; 
run; 


/* Question 2i & ii */

Title3 'Question 2i';

filename a dde 'Excel|sheet1!R2C1:R100C20';

proc means data=classhw.BBall2017_18;
	class year;
	output out = work.sumstats
	mean = m_fg m_fga m_p3 m_ft m_orb m_drb m_ast m_blk m_tov m_points; 
run; 

proc print data = sumstats;
run; 

/* Export Code Copied to the end of the program as instructed */

/* Data Step information Drop Keep Rename Statements */


/* Question i */

data CLASSHW.BBall2017; 
set CLASSHW.BBall2017;
Team=Team
fg=fg17 
fga=fga17 
p3=p317 
ft=ft17 
ORB=orb17 
DRB=drb17
AST=ast17 
BLK=blk17 
TOV=tov17 
points=points17
;

data CLASSSHW.BBall2018;
set CLASSHW.BBall2018;
fg=fg18 
fga=fga18 
p3=p318 
ft=ft18
ORB=orb18 
DRB=drb18
AST=ast18 
BLK=blk18 
TOV=tov18
points=points18
;

data one;
	set CLASSHW.BBall2017 CLASSHW.BBall2018;
	drop fg17 fga17 p317;
run;

/* Question ii */

data  two;
	set CLASSHW.BBall2017 CLASSHW.BBall2018;
	keep fg17 fga17 p317;
run;

/* Question iii */

data three;
	set CLASSHW.BBall2017 CLASSHW.BBall2018;
	rename fg17=fieldgoal17;
run;


/*  Question 2ii Export Statement */


PROC EXPORT DATA= WORK.SUMSTATS 
            OUTFILE= "C:\Users\fankney\Downloads\BASKETBALL.xlsx" 
            DBMS=EXCEL LABEL REPLACE;
     		SHEET="sumstat"; 
run;




quit;
