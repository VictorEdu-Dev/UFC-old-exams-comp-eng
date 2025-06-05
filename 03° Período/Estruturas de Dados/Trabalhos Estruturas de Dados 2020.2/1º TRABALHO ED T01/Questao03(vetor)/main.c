#include <stdio.h>
#include<stdlib.h>
#include "fila1.h"

int main(void){
    int a, qtd;
    Fila* f1 = fila_cria();

    fila_insere(f1,10);
    fila_insere(f1,20);
    fila_insere(f1,30);
    fila_insere(f1,40);
    fila_insere(f1,50);

    a = fila_remove(f1);
    printf("----------------\n\n");
    printf("Valor removido da fila f1: %d\n",a);
    printf("----------------\n\n");
    printf("Fila:\n");
    fila_imprime(f1);
    printf("----------------\n\n");
    printf("Fila invertida:\n");
    Fila* f2=inverte(f1);
    fila_imprime(f2);
    printf("----------------\n\n");
    qtd=qtd_maior(f1,20);
    printf("Numero de elementos maiores que 20 em f1: %d\n",qtd);

    printf("Quantidade de elementos pares na fila f1: %d\n",pares(f1));
    printf("----------------\n\n");
    fila_libera(f1);
    fila_libera(f2);
    system("PAUSE");
    return 0;
}

