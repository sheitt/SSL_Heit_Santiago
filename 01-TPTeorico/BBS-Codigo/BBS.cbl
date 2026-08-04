       IDENTIFICATION DIVISION.
       PROGRAM-ID. BBS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 CANTIDAD      PIC 9(5) VALUE 1000.
       01 PASADA        PIC 9(5).
       01 INDICE        PIC 9(5).
       01 TEMPORAL      PIC 9(5).

       01 VECTOR.
          05 NUMERO OCCURS 1000 TIMES PIC 9(5).

       PROCEDURE DIVISION.

           PERFORM VARYING INDICE FROM 1 BY 1
               UNTIL INDICE > CANTIDAD
               COMPUTE NUMERO(INDICE) = CANTIDAD - INDICE + 1
           END-PERFORM

           PERFORM VARYING PASADA FROM 1 BY 1
               UNTIL PASADA >= CANTIDAD

               PERFORM VARYING INDICE FROM 1 BY 1
                   UNTIL INDICE > CANTIDAD - PASADA

                   IF NUMERO(INDICE) > NUMERO(INDICE + 1)
                       MOVE NUMERO(INDICE) TO TEMPORAL
                       MOVE NUMERO(INDICE + 1) TO NUMERO(INDICE)
                       MOVE TEMPORAL TO NUMERO(INDICE + 1)
                   END-IF

               END-PERFORM

           END-PERFORM

           DISPLAY "ORDENAMIENTO FINALIZADO".

           STOP RUN.