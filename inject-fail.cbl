       IDENTIFICATION DIVISION.
       PROGRAM-ID. INJECTION-FAIL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       *> Raw user input (explicitly named with INPUT to match weak patterns)
       01  INPUT-FROM-USER   PIC X(200).

       *> Command string variable (clear name for pattern match)
       01  SYSTEM-COMMAND    PIC X(300).

       PROCEDURE DIVISION.

           DISPLAY "Enter anything: " WITH NO ADVANCING.
           ACCEPT INPUT-FROM-USER.

           *> Highly explicit, obvious unsafe construction (no STRING needed)
           MOVE "sh -c " TO SYSTEM-COMMAND.
           MOVE SYSTEM-COMMAND & INPUT-FROM-USER TO SYSTEM-COMMAND.

           *> AST-friendly version: Aikido sees this as direct argument flow
           CALL "SYSTEM" USING SYSTEM-COMMAND.

           STOP RUN.


