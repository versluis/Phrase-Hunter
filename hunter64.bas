10 GOSUB 500 
20 WD$="" 
30 X=RND(-R) 
40 PRINT:PRINT "SEED";R 
45 PRINT "HUNTING FOR "+CHR$(34)+HT$+CHR$(34) 
50 GOSUB 200 
60 GOSUB 900:REM COMPARE 
70 IF Y>0 THEN 700 
120 R=R+1:GOTO 20 
200 FOR I=1 TO 255 
210 REM X=RND(1)*11+69 
211 X=RND(1)*(HI-LO+1)+LO 
230 WD$=WD$+CHR$(X) 
240 PRINT CHR$(X); 
250 NEXT 
260 PRINT 
299 RETURN 
300 REM DISSECT AND SORT 
310 DIM L$(LEN(HT$)) 
320 FOR I=1 TO LEN(HT$) 
330 L$(I)=MID$(HT$,I,1) 
340 NEXT 
350 FOR I=LEN(HT$)-1 TO 1 STEP -1 
360 FOR J=1 TO I 
370 X$=L$(J):Y$=L$(J+1) 
380 IF X$>Y$ THEN L$(J)=Y$:L$(J+1)=X$ 
390 NEXT:NEXT 
399 RETURN 
400 REM FIND HI AND LO 
410 LO=ASC(L$(1)) 
420 HI=ASC(L$(LEN(HT$))) 
499 RETURN 
500 REM START SCREEN 
510 PRINT CHR$(147) 
520 PRINT "{B0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{AE}" 
530 PRINT "{DD}  *** PHRASE HUNTER ***   {DD}" 
540 PRINT "{DD}    * C=64  EDITION *     {DD}" 
550 PRINT "{AB}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{B3}" 
560 PRINT "{DD}     BY JAY VERSLUIS      {DD}" 
570 PRINT "{DD} VERSION 1.0 - APRIL 2018 {DD}" 
580 PRINT "{AD}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}{C0}k" 
590 PRINT:PRINT 
600 HT$="HELLO":INPUT "HUNT FOR PHRASE";HT$ 
610 R=810:INPUT "STARTING SEED";R 
620 GOSUB 300:REM DISSECT AND SORT 
630 GOSUB 400:REM FIND HI AND LO 
640 PRINT:PRINT "GENERATING CHARACTERS BETWEEN ";CHR$(LO);" AND ";CHR$(HI) 
699 RETURN 
700 REM SUCCESS 
710 PRINT:PRINT:PRINT "*** SUCCESS - MATCH FOUND! ***" 
720 PRINT ">>> SEED";R;"AT POSITION";I 
730 PRINT ">>> USING FORMULA X=RND(1)*";HI-LO+1;"+";LO 
735 PRINT:PRINT "CREATE BASIC LISTING?" 
740 GET A$:IF A$="" THEN 740 
750 IF A$="Y" THEN 800 
760 END 
800 REM GENERATE BASIC 
810 PRINT:PRINT 
820 PRINT "10 X=RND(-";R;"):PRINT" 
830 PRINT "20 FOR I=1 TO";I-1;":X=RND(1):NEXT" 
840 PRINT "30 FOR I=1 TO";LEN(HT$);":PRINT CHR$(RND(1)*";(HI-LO+1);"+";LO;");:NEXT:PRINT" 
860 END 
900 REM COMPARE STRINGS 
905 PRINT "COMPARING..."; 
910 FOR I=1 TO LEN(WD$) 
920 IF HT$=MID$(WD$,I,LEN(HT$)) THEN 700 
930 NEXT 
940 PRINT "NO MATCH FOUND." 
950 RETURN 