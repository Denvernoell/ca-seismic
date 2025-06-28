DECLARE FUNCTION GetBearing$(azimuth)

DIM angles(5) AS INTEGER
DIM azimuths(5) AS INTEGER
DIM bearings$(5)

angles(0) = 125
angles(1) = 146
angles(2) = 138
angles(3) = 51
angles(4) = 144

currentAzimuth = 0

FOR i = 0 TO 4
    currentAzimuth = (currentAzimuth + angles(i)) MOD 360
    azimuths(i) = currentAzimuth
    bearings$(i) = GetBearing$(currentAzimuth)
NEXT i

FOR i = 0 TO 4
    PRINT "Line "; i + 1; ": Azimuth = "; azimuths(i); "°"; ", Bearing = "; bearings$(i)
NEXT i

FUNCTION GetBearing$ (azimuth)
    IF azimuth >= 0 AND azimuth < 90 THEN
        GetBearing$ = "N" + STR$(azimuth) + "E"
    ELSEIF azimuth >= 90 AND azimuth < 180 THEN
        GetBearing$ = "S" + STR$(180 - azimuth) + "E"
    ELSEIF azimuth >= 180 AND azimuth < 270 THEN
        GetBearing$ = "S" + STR$(azimuth - 180) + "W"
    ELSE
        GetBearing$ = "N" + STR$(360 - azimuth) + "W"
    END IF
END FUNCTION