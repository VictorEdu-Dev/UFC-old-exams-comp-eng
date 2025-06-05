#include <stdio.h>
#include <stdlib.h>
#include "lista.h"
#include "pilha.h"
#include "arvb.h"


struct lista{
	int info;
	Lista *prox;
};

struct pilha{
	Lista *prim;
};
struct arvb{
	int info;	
	ArvB *esq;
	ArvB *dir;
};


Pilha* pilha_cria(void){
	Pilha *p = (Pilha*)malloc(sizeof(Pilha));
	if(p==NULL){
		printf("Memoria insuficiente!!!\n");
		exit(1);
	}
	p->prim = NULL;
	return p;
}


int pilha_vazia(Pilha *p){
	return p->prim==NULL;
}

void pilha_push(Pilha *p, int info){
	Lista *l = (Lista*)malloc(sizeof(Lista));
	if(l==NULL){
		printf("Memoria insuficiente!!!\n");
		exit(1);
	}
	l->info = info;
	l->prox = p->prim;
	p->prim = l;
}

int pilha_pop(Pilha *p){
	int a;
	Lista *l;
	if(pilha_vazia(p)){
		printf("Pilha Vazia!!!\n");
		exit(1);
	}
	l = p->prim;
	a = l->info;
	p->prim = l->prox;
	free(l);
	return a;
}

void pilha_imprime(Pilha *p){
	Lista *lAux = p->prim;
	while(lAux!=NULL){
		printf("%d\n",lAux->info);
		lAux = lAux->prox;
	}
}

void pilha_libera(Pilha *p){
	Lista* l = p->prim;
	Lista* lAux;
	while(l!=NULL){
		lAux = l->prox;
		free(l);
		l = lAux;
	}
	free(p);
}

int topo(Pilha* p){

	Lista *l;
	if(pilha_vazia(p)){
		printf("Pilha Vazia!!!\n");
		exit(1);
	}
	l = p->prim;

	return l->info;
}

