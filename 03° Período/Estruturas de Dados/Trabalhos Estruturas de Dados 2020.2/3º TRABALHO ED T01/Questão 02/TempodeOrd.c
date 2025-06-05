#include <stdio.h>
#include <stdlib.h> 
#include <conio.h>
#include <time.h>
#include <math.h>

void qrapida(int n, int *v){
	
	if(n>1){
		int x = v[0];
		int a = 1;
		int b = n-1;
		
		while(1){
			while(a<n && v[a] <= x) 
				a++;
			while(v[b]>x)
				b--;
			if(a<b){
				int temp = v[a];
				v[a] = v[b];
				v[b] = temp;
				a++;
				b--;
			}else
				break;
		}
		v[0] = v[b];
		v[b] = x;
		qrapida(b,v);
		qrapida(n-a,&v[a]);
	}
}

void troca(int *a, int *b) {
	int t = *a;
	*a = *b;
	*b = t;
}

void heapify(int *v, int n, int i){
	
    int maior = i; 
    int l = 2 * i + 1;
    int r = 2 * i + 2; 
    
    if (l < n && v[l] > v[maior])
    	maior = l;

    if (r < n && v[r] > v[maior])
        maior = r;
 
    if (maior != i) {
        troca(&v[i], &v[maior]);
 
        heapify(v, n, maior);
    }
}
 

void heapSort(int n, int *v){
	
	int i;

    for (i = n / 2 - 1; i >= 0; i--)
        heapify(v, n, i);
 

    for (i = n - 1; i > 0; i--) {

        troca(&v[0], &v[i]);
 
        heapify(v, i, 0);
    }
}


void mergeSort_intercala(int *v, int esq, int meio, int dir){

	int i, j, k;
	int a_tam = meio-esq+1;
	int b_tam = dir-meio;
	
	int *a = (int*) malloc(sizeof(int) * a_tam);
	int *b = (int*) malloc(sizeof(int) * b_tam);
	
	for (i = 0; i < a_tam; i++)
		a[i] = v[i+esq];
	for (i = 0; i < b_tam; i++)
		b[i] = v[i+meio+1];
	
	for (i = 0, j = 0, k = esq; k <= dir; k++) {
		if (i == a_tam)
			v[k] = b[j++];
		else if (j == b_tam)
			v[k] = a[i++];
		else if (a[i] < b[j])
			v[k] = a[i++];
		else v[k] = b[j++];
	}
	free(a);
	free(b);
}


void mergeSort_ordena(int *v, int esq, int dir) {
	
	if (esq == dir)
		return;
	int meio = (esq + dir) / 2;
	mergeSort_ordena(v, esq, meio);
	mergeSort_ordena(v, meio+1, dir);
	mergeSort_intercala(v, esq, meio, dir);
	return;
}

void mergeSort(int n, int *v) {
	mergeSort_ordena(v, 0, n-1);
}


void insertionSort(int n, int *v){
	
    int i, chave, j;
    for (i = 1; i < n; i++)
    {
        chave = v[i];
        j = i - 1;
 
        
        while (j >= 0 && v[j] > chave)
        {
            v[j + 1] = v[j];
            j = j - 1;
        }
        v[j + 1] = chave;
    }
}


void bolha(int n, int *v){
	
	int i, j, temp, troca;
	for(i=n-1; i>0; i--){
		troca = 0;
		for(j=0; j<i; j++)
			if(v[j]> v[j+1]){
				temp = v[j];
				v[j] = v[j+1];
				v[j+1] = temp;
				troca = 1;
	}
	if(troca==0)
		return;
	}
}


int main(void){
	
	clock_t tb, th, ti, tq, tm; 
	int *v, *v1, *v2, *v3, *v4, *v5;
	int i, n, tamanho;
  	
	  
	printf("Informe o expoente para base 10 (1 ... 6):\n");
	scanf("%d", &n);
	
	tamanho = pow(10,n);

  	v = (int *) malloc(tamanho * sizeof(int));
  	v1 = (int *) malloc(tamanho * sizeof(int));
  	v2 = (int *) malloc(tamanho * sizeof(int));
  	v3 = (int *) malloc(tamanho * sizeof(int));
  	v4 = (int *) malloc(tamanho * sizeof(int));
  	v5 = (int *) malloc(tamanho * sizeof(int));
  	
  	srand(time(NULL));
  	
	 
	for (i = 0; i < tamanho; i++){
    	
    	v[i]=rand();
    	v1[i]=v[i];
    	v2[i]=v[i];
    	v3[i]=v[i];
    	v4[i]=v[i];
    	v5[i]=v[i];
	}
	free(v);
	
	
	printf("\n\n*********** EXECUCAO ************\n\n");
  
 	tq = clock();
 	qrapida(tamanho,v2); 
 	tq = clock() - tq;
 	printf("\nTempo de execucao QuickSort: %.2lf milissegundos\n", ((double)tq)/((CLOCKS_PER_SEC/1000)));
 	free(v2);
 	
 	th = clock();
 	heapSort(tamanho,v3); 
 	th = clock() - th;
 	printf("\nTempo de execucao HeapSort: %.2lf milissegundos\n", ((double)th)/((CLOCKS_PER_SEC/1000)));
 	free(v3);
 	
	tm = clock();
	mergeSort(tamanho,v5); 
	tm = clock() - tm;
	printf("\nTempo de execucao MergeSort: %.2lf milissegundos\n", ((double)tm)/((CLOCKS_PER_SEC/1000)));
	free(v5);
	
 	if(tamanho >= 1000000){
 		printf("\nIsso levara um tempinho...\n");
 		
	}	
	ti = clock();
 	insertionSort(tamanho,v4); 
 	ti = clock() - ti;
 	printf("\nTempo de execucao InsertionSort: %.2lf milissegundos\n", ((double)ti)/((CLOCKS_PER_SEC/1000)));
 	free(v4);
 	
 	tb = clock();
	bolha(tamanho,v1); 
	tb = clock() - tb;
	printf("\nTempo de execucao BubleSort: %.2lf milissegundos\n", ((double)tb)/((CLOCKS_PER_SEC/1000)));
	free(v1);

	
	printf("\n\n*********** FIM DE EXECUCAO ************\n\n");
	getch();
	return 0;
}
