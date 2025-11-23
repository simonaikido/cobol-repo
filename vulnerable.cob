IDENTIFICATION DIVISION.
PROGRAM-ID. VULNERABLE.
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01  USER-INPUT        PIC X(100).
01  SECRET-PWD        PIC X(50) VALUE 'P@ssw0rd123!'.  *> Hardcoded credential
01  HASHED            PIC X(32).
01  CMD-STR           PIC X(200).
01  EXIT-CODE         PIC 9(4) COMP.
PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter name: " WITH NO ADVANCING
    ACCEPT USER-INPUT
    *> Weak hashing simulation: using MD5-like placeholder (not secure)
    MOVE FUNCTION MD5(USER-INPUT) TO HASHED
    *> Logging secret to console (sensitive data leak)
    DISPLAY "Using secret: " SECRET-PWD
    *> Unsafe system call: concatenating user input directly into shell command
    STRING "echo Hello " DELIMITED BY SIZE USER-INPUT DELIMITED BY SIZE
           INTO CMD-STR
    CALL "SYSTEM" USING CMD-STR RETURNING EXIT-CODE
    IF EXIT-CODE NOT = 0
        DISPLAY "System call failed, but ignoring error"
    END-IF
    STOP RUN.
