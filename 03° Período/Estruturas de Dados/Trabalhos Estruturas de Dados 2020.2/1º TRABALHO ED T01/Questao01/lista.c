#include <stdio.h>
#include <stdlib.h>
#include "lista.h"


struct lista {
    int info;
    Lista *prox;
};


Lista *lst_cria(){
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



Lista *lst_busca(Lista *l, int info){
	Lista *lAux = l;
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


void lst_imprime_invertida_rec(Lista* l){
    if(lst_vazia(l))
        return;
    else{
    lst_imprime_invertida_rec(l->prox);
        printf("info: %d\n",l->info);
    }
}

Lista *lst_remove(Lista *l, int info){
    if(l!=NULL){
        Lista *lAux = l->prox;
        if(l->info==info){
            free(l);
            return lAux;
        }
        else{
            Lista *lAnt = l;
            while(lAux!=NULL ){
                if(lAux->info == info){
                    lAnt->prox = lAux->prox;
                    free(lAux);
                    break;
                }else{
                    lAnt = lAux;
                    lAux = lAux->prox;
                }
            }
        }
    }
    return l;
}

Lista* lst_remove_rec(Lista *l, int info){
    if(!lst_vazia(l))
        if(l->info==info){
            Lista* lAux = l;
            l = l->prox;
            free(lAux);
        }
        else{
            l->prox = lst_remove_rec(l->prox,info);
        }
    return l;
}



void lst_libera(Lista *l){
	Lista *lProx;
	while(l!=NULL){
		lProx = l->prox;
		free(l);
		l = lProx;
	}
}




int comprimento(Lista *l) {
	int comp = 0;
	Lista *lAux= l;
	while (lAux != NULL) {
		comp++;
		lAux = lAux->prox;
	}
	return comp;
}



int menores(Lista *l, int n){

	int c = 0;
	Lista *lAux = l;

	while (lAux != NULL) {
		if(n>lAux->info){
			c++;
		}

		lAux = lAux->prox;
	}
	return c;
}

int soma(Lista *l){
    int s = 0;
	Lista *lAux = l;

	while (lAux != NULL) {
		s=s+lAux->info;
		lAux = lAux->prox;
	}
	return s;
}

int primos(Lista *l){

	int R = 0;
	Lista *lAux = l;

	int cp =0;
	int i;
	while (lAux != NULL) {
		int cr=0;
		for( i = 1; i <= lAux->info;i++){


      	R=lAux->info % i;

         if(R==0){
         	cr++;
			}
      }
      if(cr==2)
			cp=cp+1;
   	lAux = lAux->prox;
    }

	return cp;
}



Lista* lst_conc(Lista* l1, Lista* l2){

	Lista* l3 = (Lista*)malloc(sizeof(Lista));
	l3=lst_cria();


	Lista* laux2 = l2;

	while(!lst_vazia(laux2)){
		l3=lst_insere(l3,laux2->info);
		laux2=laux2->prox;
	}
	Lista* laux1 = l1;

	while(!lst_vazia(laux1)){
		l3=lst_insere(l3,laux1->info);
		laux1=laux1->prox;
	}

	return l3;
}


Lista* lst_diferenca(Lista* l1, Lista* l2){
	Lista* laux1 = l1;
	Lista* laux2 = l2;
	while(!lst_vazia(laux2)){
		laux1=lst_remove(laux1, laux2->info);
		laux2=laux2->prox;
	}
	return laux1;
}
