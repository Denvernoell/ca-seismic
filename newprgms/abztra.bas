ClrHome
Disp "AZ-BRG TRAYERSE"
Disp "VER. 2.1"
Pause 
Lbl 50
Menu("TRAVERSE:","BEG NEW CRDS",88,"POB POINT",87,"TRAVERSE",89,"POL PTS",70,"NEXT FREE PT",93,"EXIT",92)
End
Lbl 88
ClrHome
0->P
0->W
0->N
0->E
Disp "BEGIN COORDS:"
Input "PT= ",P
Input "POB N= ",N
Input "POB E= ",E
P->[C](P,1)
N->[C](P,2)
E->[C](P,3)
ClrHome
Goto 50
Lbl 89
Disp "0=EXIT"
Disp "AT PT: ",P
Input "TO PT: ",W
If P=0
Then
    ClrHome
    Goto 50
End
Menu("AZI-BRG","BEARING",90,"AZIMUTH",61,"EXIT",50)
End
Lbl 90
ClrHome
Disp "INP=DEF"
Disp "COMP=1"
Input "ANS= ",T
If T!=1
Then
    Input "QD= ",Q
    Input "BD= ",D
    Input "BM= ",M
    Input "BS= ",S
    D+M/60+S/3600->B
    (180(iPart(Q/2))+(⁻Bcos(180*Q))->A
Else
    Input "AT= ",U
    Input "FS= ",Z
    [C](Z,2)-[C](U,2)->Y
    [C](Z,3)-[C](U,3)->X
    R>Ptheta(X,Y)->A
    90-A->A
    If A<=0
    Then
        A+360->A
    End
End
Input "HD= ",H
Hcos(A)+N->N
Hsin(A)+E->E
W->[C](W,1)
N->[C](W,2)
E->[C](W,3)
ClrHome
Disp "PT= ",W
Disp "N = ",N
Disp "E = ",E
Pause 
ClrHome
W->P
Goto 89
Lbl 61
Input "AD= ",D
Input "AM= ",M
Input "AS= ",S
Input "HD= ",H
D+M/60+S/3600->A
Hcos(A)+N->N
Hsin(A)+E->E
W->[C](W,1)
N->[C](W,2)
E->[C](W,3)
Disp "PT= ",W
Disp "N = ",N
Disp "E = ",E
Pause 
ClrHome
W->P
Goto 89
Lbl 87
Disp "INPUT EXISTING"
Input "PT= ",P
[C](P,2)->N
[C](P,3)->E
ClrHome
Disp "PT= ",P
Disp "N = ",N
Disp "E = ",E
Pause 
ClrHome
Goto 50
Lbl 93
ClrHome
1->I
While ([C](I,1)!=0)
    I+1->I
End
Disp "NEXT FREE PT= ",I
Pause 
ClrHome
Goto 50
End
Lbl 92
ClrHome
Stop
Lbl 70
ClrHome
Disp "PTS ON LINE"
Input "AT= ",W
Input "FS= ",Z
[C](Z,2)-[C](W,2)->Y
[C](Z,3)-[C](W,3)->X
R>Ptheta(X,Y)->B
90-B->B
If B<=0
Then
    B+360->B
End
R>Pr(X,Y)->H
Disp "DIV FACTOR"
Input "PART= ",T
H/T->H
Hcos(B)->N
Hsin(B)->E
[C](W,2)+N->N
[C](W,3)+E->E
1->I
While ([C](I,1)!=0)
    I+1->I
End
N->[C](I,2)
E->[C](I,3)
I->[C](I,1)
Disp "POLP= ",I
Disp "POLN= ",N
Disp "POLE= ",E
Pause 
ClrHome
Goto 50