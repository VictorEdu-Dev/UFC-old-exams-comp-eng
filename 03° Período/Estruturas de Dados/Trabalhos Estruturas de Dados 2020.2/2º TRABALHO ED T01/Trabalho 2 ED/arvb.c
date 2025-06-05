#include <stdio.h>
#include <stdlib.h>
#include "arvb.h"
#include "pilha.h"


struct arvb{
	int info;	
	ArvB *esq;
	ArvB *dir;
};

struct lista {
	int info;
	Lista *prox;
};

struct pilha{
	Lista *prim;
};

int c = 0, cc = 0;

ArvB* arvb_cria_vazia(void){
	return NULL;
}

int arvb_vazia(ArvB *a){
	return a == NULL;
}

ArvB* arvb_busca(ArvB *a, int c){
	if(arvb_vazia(a))
		return NULL;
	else if(a->info < c)
		return arvb_busca(a->dir,c);
	else if(a->info > c)
		return arvb_busca(a->esq,c);
	else 
		return a;
}


void arvb_imprime(ArvB *a){
	if(!arvb_vazia(a)){
		arvb_imprime(a->esq);
		printf("%d ",a->info);
		arvb_imprime(a->dir);
	}
}

ArvB* arvb_insere(ArvB *a, int c){
	if(arvb_vazia(a)){
		a = (ArvB*)malloc(sizeof(ArvB));
		a->info = c;
		a->esq = NULL;
		a->dir = NULL;
	}else if(a->info > c)
		a->esq = arvb_insere(a->esq,c);
	else if (a->info < c)
		a->dir = arvb_insere(a->dir,c);
	else
		printf("\nElemento Ja Pertence a Arvore");
	return a;
}

ArvB* arvb_remove(ArvB *a, int c){
	if(!arvb_vazia(a)){
		if(a->info > c)
			a->esq = arvb_remove(a->esq,c);
		else if (a->info < c)
			a->dir = arvb_remove(a->dir,c);
		else{
			ArvB* t;
			if (a->esq == NULL){
				t = a; 
				a = a->dir;
				free(t);
			}else if (a->dir == NULL){
				t = a;
				a = a->esq;
				free(t);
			}else{
				t = a->esq;
				while(t->dir!=NULL)
					t = t->dir;
				a->info = t->info;
				t->info = c;
				a->esq = arvb_remove(a->esq,c);
			}
		}
	}
	return a;
}

void arvb_libera(ArvB *a){
	if(!arvb_vazia(a)){
		arvb_libera(a->esq);
		arvb_libera(a->dir);
		free(a);
	}
}

//Retorna a quantidade de filhos imediatos de um nó
int qarv(ArvB* a){
	
	int n = 0;
	if(!arvb_vazia(a)){
		if(!arvb_vazia(a->dir) && !arvb_vazia(a->esq)){
			n = 2;
		}else if(!arvb_vazia(a->dir) || !arvb_vazia(a->esq)){
			n = 1;
		}else if (arvb_vazia(a->dir) && arvb_vazia(a->esq)){
			n = 0;
		}
	}
	return n;
}

//Retorna a quantidade de folhas divisíveis por n
int folhas_div_n(ArvB* a, int n){
	int z = 0;
	if(!arvb_vazia(a)){
		if (qarv(a) == 0 && a->info % n == 0){
			z++;
		}
		z = z + folhas_div_n(a->dir,n) + folhas_div_n(a->esq,n);
	}else{
		return z;
	}
	return z;
}

//Retorna a quantidade de nós de uma árvore
int nos(ArvB* a){
	int ct = 0;
	if(arvb_vazia(a)){
		return ct;
	}else{
		ct++;
		ct = ct + nos(a->esq)+ nos(a->dir);
	}
	return ct;
}

//Retorna a altura de uma árvore
int arvb_altura(ArvB *a){
	if(arvb_vazia(a))
		return -1;
	else{
		int hSAE = arvb_altura(a->esq);
		int hSAD = arvb_altura(a->dir);
		if(hSAE > hSAD)
			return 1 + hSAE;
		else
			return 1 + hSAD;
	}
}

//Retorna se a árvore é degenerada (1) ou não (0)
int isdegenerada(ArvB* a){
	int d = 0;
	if(!arvb_vazia(a) && nos(a) == 1)
		return 0;
	if(nos(a) == arvb_altura(a) + 1)
		d = 1;
	return d;
}

//Retorna a quantidade de nós com fator de balanceamento igual a n
int nos_fb_n(ArvB* a, int n){
	int x = 0;
	if(arvb_vazia(a)){
		return x;	
	}
	else {
		if((arvb_altura(a->dir) - arvb_altura(a->esq)) == n){
			x++;
		}
		x = x + nos_fb_n(a->dir,n) + nos_fb_n(a->esq,n);
	}
	return x;
}

//Empilha os elementos de uma árvore
Pilha* arvb_em_pilha(ArvB* a, Pilha* p){
	
	if(!arvb_vazia(a)){		
		c++;
		
		if(c == 1){
			p = pilha_cria();
		}
		pilha_push(p,a->info);
		
		if(arvb_vazia(a->dir) && arvb_vazia(a->esq)){
			return p;	
		}
		
		else if(!arvb_vazia(a->dir) && arvb_vazia(a->esq)){
			p = arvb_em_pilha(a->dir,p);
		}
					
		else if(arvb_vazia(a->dir) && !arvb_vazia(a->esq)){
			p = arvb_em_pilha(a->esq,p);
		}
				
		else if(!arvb_vazia(a->dir) && !arvb_vazia(a->esq)){
		 
			p = arvb_em_pilha(a->dir,p);
			p = arvb_em_pilha(a->esq,p);	
		}	
	}
	return p;
}

//Imprime os valores comuns nas duas pilhas
void imprime_iguais(Pilha* p1, Pilha* p2){
	
	Lista* laux1 = p1->prim;
	Lista* laux2 = p2->prim;
	while (laux1 != NULL){
		while (laux2 != NULL){
			
			if(laux1->info == laux2->info){
				printf("%d\n",laux2->info);
			}
			laux2 = laux2->prox;
		}
		laux2 = p2->prim;
		laux1 = laux1->prox;
	}
}

//Recebe duas árvores e chama a função arvb_em_pilha para converter as árvores em pilhas, no final imprime
void impressao_arv_elem_comuns(ArvB* a, ArvB* b){
	
	Pilha* Paux1 = arvb_em_pilha(a,Paux1);
	c = 0;
	Pilha* Paux2 = arvb_em_pilha(b,Paux2);
	imprime_iguais(Paux1,Paux2);

}

//Retorna a impressão dos nós por nível
void nos_por_nivel( ArvB* a, int nv) { 
	
	cc++;
    if (a == NULL) 
        return ; 
	if (nv == 1) {
        printf("%d", a->info);
	}
	else if (nv > 1) {  	
		nos_por_nivel(a->esq, nv-1);
		
		if(a->esq != NULL && a->dir != NULL && cc != 16){
			printf(", ");	
		}
		nos_por_nivel(a->dir,nv-1); 
    }
}

//Retorna a impressão da árvore por nível
void impressao_arv_niveis(ArvB* a){ 
    
	int h = arvb_altura(a) + 1; 
    int cont; 
    
    for (cont = 1; cont <= h; cont++) {
        nos_por_nivel(a,cont);  
        printf(" - nivel %d\n",cont-1); 
    } 
}
