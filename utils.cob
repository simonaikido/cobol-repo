IDENTIFICATION DIVISION.
PROGRAM-ID. UTILS.
DATA DIVISION.
WORKING-STORAGE SECTION.
01  TEMP-FILE-NAME    PIC X(100).
01  USER-FILE-CONTENT PIC X(200).
PROCEDURE DIVISION.
CREATE-TEMP.
    *> Insecure temp file handling - predictable name and world-readable
    MOVE "/tmp/report-1234.txt" TO TEMP-FILE-NAME
    OPEN OUTPUT TEMP-FILE-NAME
    WRITE USER-FILE-CONTENT
    CLOSE TEMP-FILE-NAME
    *> Not checking return codes, no permissions set
    DISPLAY "Wrote temp file: " TEMP-FILE-NAME
    STOP RUN.
