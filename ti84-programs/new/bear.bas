ClrHome
Prompt N        // Number of angles
0→A             // Initial azimuth
1→I
While I≤N
	Input "ANGLE?",B
	A+B→A
	A-360(A≥360)→A   // Keep azimuth in [0,360)
	Output(I,1,A)    // Display azimuth
	If A<90
		Then
		Disp "BEARING: N"+toString(A)+"E"
	ElseIf A<180
		Disp "BEARING: S"+toString(180-A)+"E"
	ElseIf A<270
		Disp "BEARING: S"+toString(A-180)+"W"
	Else
		Disp "BEARING: N"+toString(360-A)+"W"
	End
	I+1→I
End
