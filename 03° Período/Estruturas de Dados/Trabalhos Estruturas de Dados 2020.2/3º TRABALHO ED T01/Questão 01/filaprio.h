typedef struct filap FilaP;

#define TAM 7
#define PAI(i) (i-1)/2
#define F_ESQ(i) (2*i+1)
#define F_DIR(i) (2*i+2)

void troca(int *a, int *b);

FilaP* filap_cria(void);

int heap_maximum(FilaP* f);

void max_heapify(FilaP* f, int i);

int heap_extract_max(FilaP* f);

void heap_increase_key(FilaP* f, int ind, int chave);

void max_heap_insert(FilaP* f, int chave);
