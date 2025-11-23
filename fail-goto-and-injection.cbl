       IDENTIFICATION DIVISION.
       PROGRAM-ID. FAIL-GOTO-INJECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  USER-INPUT        PIC X(200).
       01  CMD-STRING        PIC X(300).

       PROCEDURE DIVISION.

           DISPLAY "Enter a value: " WITH NO ADVANCING.
           ACCEPT USER-INPUT.

           *> --- COMMAND INJECTION ---
           *> Unsafe direct concatenation of user input into shell command
           STRING "echo User said: " DELIMITED BY SIZE
                  USER-INPUT       DELIMITED BY SIZE
                  INTO CMD-STRING.

           *> Executes attacker-controlled command
           CALL "SYSTEM" USING CMD-STRING.

           *> --- GOTO VIOLATION ---
           *> This triggers your custom rule
           GOTO BAD-FLOW.

           DISPLAY "This line will never execute.".

       BAD-FLOW.
           DISPLAY "Reached BAD-FLOW via GOTO.".
           STOP RUN.
