       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUSQUEDA-BINARIA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 TABLA-VALORES.
          05 VALOR OCCURS 100 TIMES PIC 9(4).

       01 IND-INICIO      PIC 9(3) VALUE 1.
       01 IND-FIN         PIC 9(3) VALUE 100.
       01 IND-MEDIO       PIC 9(3).
       01 VALOR-BUSCADO   PIC 9(4) VALUE 500.
       01 HALLADO         PIC X(10) VALUE "NOENCONTR".

       01 I               PIC 9(3).

       PROCEDURE DIVISION.

           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > 100

               COMPUTE VALOR(I) = I * 10

           END-PERFORM

           PERFORM UNTIL IND-INICIO > IND-FIN
               OR HALLADO = "ENCONTRADO"

               COMPUTE IND-MEDIO =
                   (IND-INICIO + IND-FIN) / 2

               IF VALOR(IND-MEDIO) = VALOR-BUSCADO

                   MOVE "ENCONTRADO" TO HALLADO

               ELSE

                   IF VALOR(IND-MEDIO) < VALOR-BUSCADO

                       COMPUTE IND-INICIO = IND-MEDIO + 1

                   ELSE

                       COMPUTE IND-FIN = IND-MEDIO - 1

                   END-IF

               END-IF

           END-PERFORM

           IF HALLADO = "ENCONTRADO"

               DISPLAY "ELEMENTO ENCONTRADO EN LA POSICION: "
                       IND-MEDIO

           ELSE

               DISPLAY "ELEMENTO NO ENCONTRADO EN LA TABLA"

           END-IF

           STOP RUN.