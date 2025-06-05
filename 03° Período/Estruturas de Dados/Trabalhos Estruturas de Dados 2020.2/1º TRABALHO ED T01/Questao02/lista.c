#include<stdio.h>
#include<stdlib.h>
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


void lst_libera(Lista *l){
	Lista *lProx;
	while(l!=NULL){
		lProx = l->prox;
		free(l);
		l = lProx;
	}
}

Lista *ordem_crescente(Lista *l) {

    Lista *aux = l;
    Lista *t;
    int c;

    if (l == NULL || l->prox == NULL)
        return NULL;

    while (aux != NULL) {
        t = aux->prox;
        while (t != NULL) {
            if (aux->info > t->info) {
                c = aux->info;
                aux->info = t->info;
                t->info = c;
            }
            t = t->prox;
        }
        aux = aux->prox;
    }

    return l;
}
