#include <stdio.h>
#include <stdlib.h>
#include "fila2.h"
#include "lista.h"


struct lista{
    int info;
    Lista *prox;
};

struct fila{
    Lista *ini;
    Lista *fim;
};


Fila* fila_cria(void){
    Fila *f = (Fila*)malloc(sizeof(Fila));
    if(f==NULL){
        printf("Memoria insuficiente!!!\n");
        exit(1);
    }
    f->ini = NULL;
    f->fim = NULL;
    return f;
}


void fila_insere(Fila *f, int info){
    Lista *l = (Lista*)malloc(sizeof(Lista));
    if(l==NULL){
        printf("Memoria insuficiente!!!\n");
        exit(1);
    }
    l->info = info;
    l->prox = NULL;
    if(!fila_vazia(f))
        f->fim->prox = l;
    else
        f->ini = l;
    f->fim = l;
}


int fila_vazia(Fila *f){
    return f->ini==NULL;
}


int fila_remove(Fila *f){
    Lista *l; int a;
    if(fila_vazia(f)){
        printf("Fila Vazia!!!\n");
        exit(1);
    }
    a = f->ini->info;
    l = f->ini;
    f->ini = f->ini->prox;
    free(l);

    if(fila_vazia(f))
        f->fim = NULL;
    return a;
}


void fila_imprime(Fila *f){
    Lista *lAux = f->ini;
    while(lAux!=NULL){
        printf("%d\n",lAux->info);
        lAux = lAux->prox;
    }
}

void fila_libera(Fila *f){
    Lista* l = f->ini;
    Lista* lAux;
    while(l!=NULL){
        lAux = l->prox;
        free(l);
        l = lAux;
    }
    free(f);
}


int qtd_maior(Fila* f, int n){
	int maior = 0;
	Lista* lAux = f->ini;
	while(lAux != NULL){
		if(lAux->info > n){
			maior = maior+1;
		}
		lAux = lAux->prox;
	}
	return maior;
}


int tamanho(Fila* f){
	int tam = 0;
	Lista* lAux = f->ini;
	while(lAux != NULL){
		tam++;
		lAux = lAux->prox;
	}
	return tam;
}


Fila* inverte(Fila* f){
	Fila* f1 = fila_cria();
	int v[tamanho(f)];
	int i=0;
	Lista* lAux = f->ini;
	for(i = 0; i< tamanho(f); i++){
		v[i] = lAux->info;
		lAux = lAux->prox;
	}
	for(i = 0; i< tamanho(f); i++){
		fila_insere(f1, v[tamanho(f)-i-1]);
	}
	return f1;
}


int pares(Fila* f){
	int par = 0;
	Lista* lAux = f->ini;
	while(lAux != NULL){
		if(lAux->info%2 == 0){
			par++;
		}
		lAux = lAux->prox;
	}
	return par;
}

