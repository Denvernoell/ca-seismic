
Disp "ADJ-AREA"
Disp "VERS 2.1"
Pause 
Lbl 50
Menu("ADJAREA","NUM PTS",88,"LOAD LIST",89,"ADJUST",51,"AREA",91,"SAVE PTS",94,"EXIT",92)
End
Lbl 88
ClrHome
0->M
Disp "ENTER NO. PTS"
Input "PTS= ",M
(M+4)->dim(|LD)
(M+4)->dim(|LE)
(M+4)->dim(|LH)
(M+4)->dim(|LL)
(M+4)->dim(|LN)
(M+4)->dim(|LPN)
(M+4)->dim(|LPP)
(M+4)->dim(|LPT)
10->dim(L1)
Goto 50
Lbl 92
ClrHome
Stop
Lbl 89
ClrHome
Disp "ENTER POINTS"
For(I,1,M,1)
    Disp "LIST PT ",I
    Input "COORD PT= ",R
    [C](R,1)->|LPT(I)
    [C](R,2)->|LN(I)
    [C](R,3)->|LE(I)
    ClrHome
End
0->R
Disp "TYPE TRAVERSE"
Disp "LOOP=1 OPEN=2"
Input "TYPE= ",R
If R=1
Then
    |LN(1)->|LN(M+1)
    |LE(1)->|LE(M+1)
Else
    Disp "CLOSE PT NO"
    Disp "0 TO KEY IN"
    Input "PT= ",C
    If C!=0
    Then
        [C](C,1)->|LPT(M+1)
        [C](C,2)->|LN(M+1)
        [C](C,3)->|LE(M+1)
    Else
        Input "P= ",C
        Input "N= ",N
        Input "E= ",E
        C->|LPT(M+1)
        N->|LN(M+1)
        E->|LE(M+1)
    End
End
0->J
For(J,1,M-1,1)
    |LN(J+1)-|LN(J)->Y
    |LE(J+1)-|LE(J)->X
    sqrt(X^^2+Y^^2)->H
    H->|LH(J)
    Y->|LL(J)
    X->|LD(J)
End
0->K
0->P
0->L
0->D
For(K,1,M-1,1)
    |LH(K)+P->P
    |LL(K)+L->L
    |LD(K)+D->D
End
|LN(M)-|LN(M+1)->L
|LE(M)-|LE(M+1)->D
sqrt(L^^2+D^^2)->W
P/W->W
ClrHome
Disp "LENGTH FIG= ",P
Disp "ERR IN LAT= ",L
L->L1(5)
Disp "ERR IN DEP= ",D
D->L1(6)
⁻L1(5)->L1(5)
⁻L1(6)->L1(6)
Disp "REL ERR 1:= ",W
Pause 
ClrHome
Goto 50
Lbl 90
⁻L/P->L
⁻D/P->D
0->I
For(I,1,M-1,1)
    |LH(I)*L+|LL(I)->|LL(I)
    |LH(I)*D+|LD(I)->|LD(I)
End
0->I
For(I,1,M-1,1)
    |LN(I)+|LL(I)->|LN(I+1)
    |LE(I)+|LD(I)->|LE(I+1)
End
Goto 50
Lbl 51
Menu("ADJ METHOD","COMPASS  RULE",90,"TRANSIT  RULE",93,"CRANDALL RULE",87,"EXIT",50)
End
Lbl 93
0->U
0->S
0->I
For(I,1,M-1,1)
    abs(|LL(I))+S->S
    abs(|LD(I))+U->U
End
⁻L/S->L
⁻D/U->D
0->I
For(I,1,M-1,1)
    abs(|LL(I))*L+|LL(I)->|LL(I)
    abs(|LD(I))*D+|LD(I)->|LD(I)
End
0->I
For(I,1,M-1,1)
    |LN(I)+|LL(I)->|LN(I+1)
    |LE(I)+|LD(I)->|LE(I+1)
End
Goto 50
Lbl 91
If R=2
Then
    ClrHome
    Disp "NO AREA EXISTS"
    Pause 
    Goto 50
End
0->A
0->B
0->I
For(I,1,M,1)
    |LN(I)*|LE(I+1)->|LPP(I)
    |LE(I)*|LN(I+1)->|LPN(I)
    |LN(I)*|LE(I+1)+A->A
    |LE(I)*|LN(I+1)+B->B
End
(A-B)/2->A
abs(A)->A
A/43560->B
round(A,1)->A
round(B,4)->B
ClrHome
Disp "AREA SQ FT= ",A
Disp "AREA ACRES= ",B
Pause 
Goto 50
Lbl 94
0->I
0->Z
For(I,1,M,1)
    |LPT(I)->Z
    |LN(I)->[C](Z,2)
    |LE(I)->[C](Z,3)
End
ClrHome
Disp ("POINTS SAVED")
Pause 
Goto 50
Lbl 87
0->I
0->L1(1)
0->L1(2)
0->L1(3)
0->L1(4)
For(I,1,M-1,1)
    (|LD(I)^^2/|LH(I))+L1(1)->L1(1)
    (|LL(I)^^2/|LH(I))+L1(2)->L1(2)
    ((|LL(I)*|LD(I))/|LH(I))+L1(3)->L1(3)
End
L1(1)*L1(2)-L1(3)^^2->L1(4)
(⁻L1(6)*L1(3)-(⁻L1(5))*L1(1))/L1(4)->L1(7)
(⁻L1(5)*L1(3)-(⁻L1(6))*L1(2))/L1(4)->L1(8)
0->I
For(I,1,M-1,1)
    L1(7)*|LL(I)+L1(8)*|LD(I)->L1(9)
    (|LL(I)/|LH(I))*L1(9)+|LL(I)->|LL(I)
    (|LD(I)/|LH(I))*L1(9)+|LD(I)->|LD(I)
End
0->I
For(I,1,M-1,1)
    |LN(I)+|LL(I)->|LN(I+1)
    |LE(I)+|LD(I)->|LE(I+1)
End
ClrHome
Goto 50