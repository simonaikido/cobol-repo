IDENTIFICATION DIVISION.
PROGRAM-ID. DBACCESS.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01  USER-QUERY        PIC X(100).
01  SQL-STATEMENT     PIC X(300).
01  DB-PASSWORD       PIC X(50) VALUE 'dbpassword'. *> Hardcoded DB password
PROCEDURE DIVISION.
MAIN.
    DISPLAY "Enter customer id: " WITH NO ADVANCING
    ACCEPT USER-QUERY
    *> Directly constructing SQL from user input -> SQL injection risk
    STRING "SELECT * FROM CUSTOMERS WHERE ID = '" DELIMITED BY SIZE
           USER-QUERY DELIMITED BY SIZE
           "'" DELIMITED BY SIZE
           INTO SQL-STATEMENT
    EXEC SQL
        DECLARE C1 CURSOR FOR
        EXECUTE IMMEDIATE :SQL-STATEMENT
    END-EXEC
    *> Not checking or sanitizing user input or SQL results
    DISPLAY "Query executed (results not shown)"
    STOP RUN.
