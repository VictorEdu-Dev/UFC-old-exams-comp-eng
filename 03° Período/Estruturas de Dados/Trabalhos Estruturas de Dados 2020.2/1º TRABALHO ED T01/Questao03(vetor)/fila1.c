#include <stdio.h>
#include <stdlib.h>
#include "fila1.h"

#define N 5

typedef struct fila{
    int n;
    int ini;
    int v[N];
}Fila;

int c =0;

Fila* fila_cria(void){
    Fila *f = (Fila*)malloc(sizeof(Fila));
    if(f==NULL){
        printf("Memoria insuficiente!!!\n");
        exit(1);
    }
    f->n = 0;
    f->ini = 0;
    return f;
}


void fila_insere(Fila *f, int info){
    int fim;
    if(f->n==N){
        printf("Capacidade da Fila Estourou!!!\n");
        exit(1);
    }
    fim = (f->ini + f->n) % N;
    f->v[fim]= info;
    f->n++;
    c++;
}

int fila_vazia(Fila *f){
    return f->n==0;
}


/*Função que remove um elemento de uma fila.*/
int fila_remove(Fila *f){
    int a;
    if(fila_vazia(f)){
        printf("Fila Vazia!!!\n");
        exit(1);
    }
    a = f->v[f->ini];
    f->ini = (f->ini+1)%N;
    f->n--;
    c--;
    return a;
}

void fila_imprime(Fila *f){
    int i; int k;
    for(i = 0; i<f->n;i++){
        k = (f->ini+i) % N;
        printf("%d\n",f->v[k]);
    }
}

void fila_libera(Fila *f){
    free(f);
}


int tamanho(Fila *f){


    return c;

}


Fila* inverte(Fila* f){

    int i, j=0, aux[N], tam;

    tam=tamanho(f);

    for(i=tam;i>=f->ini;i--){

        aux[j++]=f->v[i];
    }
    Fila *f3 = fila_cria();

    for(i=0;i<tam;i++){
        fila_insere(f3,aux[i]);
    }
    return f3;
}


int qtd_maior(Fila* f, int info){
	int i;
	int m = 0;
	int r;
	for(i = 0; i<f->n; i++){
		r = (f->ini+i) % N;
		if(f->v[r]>info){
			m++;
		}
	}
	return m;
}


int pares(Fila* f){
	int qp = 0;
	int i;
	int r;

	for(i = 0; i<f->n; i++){
		r = (f->ini+i) % N;
		if(f->v[r]%2 ==0){
			qp++;
		}
	}
	return qp;
}

