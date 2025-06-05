#include <stdio.h>
#include <stdlib.h>
#include "lista.h"
#include "arvb.h"

struct lista {
	int info;
	Lista *prox;
};


Lista* lst_cria(){
	return NULL;
}


int lst_vazia(Lista *l){
	return (l==NULL);
}

Lista* lst_insere(Lista *l, int info){
	Lista* ln = (Lista*)malloc(sizeof(Lista));
	ln->info = info;
	ln->prox = l;
	return ln;
}

Lista* lst_busca(Lista *l, int info){
	Lista* lAux = l;
	while(lAux!=NULL){
		if(lAux->info == info)
			return lAux;
		lAux = lAux->prox;
	}
	return NULL;
}

void lst_imprime(Lista *l){
	Lista* lAux = l;
	while(lAux!=NULL){
		printf("Info = %d\n",lAux->info);

		lAux = lAux->prox;
    }
}

void lst_libera(Lista *l){
	Lista *lProx;
	while(l!=NULL){
		lProx = l->prox;
		free(l);
		l = lProx;
	}
}


