       IDENTIFICATION DIVISION.
       PROGRAM-ID. INJECTION-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  USER-INPUT    PIC X(100).
       01  CMD-STR       PIC X(200).

       PROCEDURE DIVISION.
       MAIN-PROC.
           *> Get user-controlled input
           DISPLAY "Enter a value: " WITH NO ADVANCING
           ACCEPT USER-INPUT

           *> ❌ Non-compliant:
           *> This concatenates user input into a system command,
           *> violating the code-quality rule (command injection risk)
           STRING "echo User says: " DELIMITED BY SIZE
                  USER-INPUT         DELIMITED BY SIZE
                  INTO CMD-STR

           *> Execution of user-influenced system command
           CALL "SYSTEM" USING CMD-STR

           STOP RUN.
