#include <stdio.h>
#include <stdlib.h>
#include "filaprio.h"


typedef struct filap{
	int v[TAM];
	int t_heap;
}FilaP;

//Troca
void troca(int *a, int *b) {
	int t = *a;
	*a = *b;
	*b = t;
}


FilaP* filap_cria(void) {
	FilaP* f = (FilaP*)malloc(sizeof(FilaP));

	if(f==NULL){
		printf("Memoria insuficiente!!!\n");
		exit(1);
	}
	f->t_heap = 0;
	return f;
}

int heap_maximum(FilaP* f){
	
	return f->v[0];
}


void max_heapify(FilaP* f, int i){
	int maior = i;

	int l = F_ESQ(i);
	int r = F_DIR(i);
	
	if(l < f->t_heap && f->v[l] > f->v[maior]){
		maior = l;
	}
	else{
		maior = i;
	}
	if (r < f->t_heap && f->v[r] > f->v[maior]){
		maior = r;
	}
	if(maior != i){
		troca(&f->v[i],&f->v[maior]);
		max_heapify(f,maior);
	}
}

int heap_extract_max(FilaP* f){
	int max = 0;
	if(f->t_heap < 0){
		printf("erro, heap underflow\n");
	}
	max = f->v[0];
	f->v[0] = f->v[f->t_heap];
	f->t_heap = f->t_heap - 1;
	max_heapify(f,0);
	return max;
}

void heap_increase_key(FilaP* f, int ind, int chave){
	if(chave < f->v[ind]){
		printf("Nova chave eh menor que a chave atual\n");
	}
	f->v[ind] = chave;
	while (ind > 1 && f->v[PAI(ind)] < f->v[ind]){
		troca(&f->v[ind],&f->v[PAI(ind)]);
		ind = PAI(ind);
	}
}


void max_heap_insert(FilaP* f, int chave){
	if(f->t_heap == 0){
		f->v[0] = chave;
		f->t_heap += 1;
	}
	else{
		f->v[f->t_heap] = chave;
		f->t_heap += 1;
		int i;
		for(i = (f->t_heap / 2 - 1); i >= 0; i--){
			max_heapify(f,i);	
		}
	}	
}
