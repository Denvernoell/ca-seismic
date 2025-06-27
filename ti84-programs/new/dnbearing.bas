ClrHome
Disp "AZIMUTH/BEARING"
Input "BEARING (CLOCKWISE): ",B
B->A
R>Ptheta(A,0)->B
90-B->B
If B<=0
Then
    B+360->B
End
Disp "AZIMUTH: ",B
Disp "BEARING: "
If B<45
Then
    Disp "N "
Else
    Disp "S "
End
If B<135
Then
    Disp "E "
Else
    Disp "W "
End
Disp B
Pause