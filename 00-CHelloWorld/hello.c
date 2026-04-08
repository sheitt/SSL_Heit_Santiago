#include <stdio.h>

int main()
{
    //escribo el mensaje Hola Mundo! en stdout
    printf("Hola Mundo!\n");

    //redirecciono la salida al archivo output.txt
    FILE* f = freopen("output.txt", "w", stdout );
    printf("Hola Mundo! 2 y 3\n");

    //cierro el archivo output.txt
    fclose(f);

    return 0;
}