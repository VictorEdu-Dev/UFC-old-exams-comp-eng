typedef struct arvb ArvB;
typedef struct pilha Pilha;
typedef struct lista Lista;

ArvB* arvb_cria_vazia(void);

int arvb_vazia(ArvB *a);

ArvB* arvb_busca(ArvB *a,int c);

void arvb_imprime(ArvB *a);

ArvB* arvb_insere(ArvB *a, int c);

ArvB* arvb_remove(ArvB *a, int c);

void arvb_libera(ArvB *a);

int folhas_div_n(ArvB* a, int n);

int arvb_altura(ArvB *a);

int isdegenerada(ArvB* a);

int nos_fb_n(ArvB* a, int n);

Pilha* arvb_em_pilha(ArvB* a, Pilha* p);

void imprime_iguais(Pilha* p1, Pilha* p2);

void impressao_arv_elem_comuns(ArvB* a, ArvB* b);

void nos_por_nivel( ArvB* a, int nv);

void impressao_arv_niveis(ArvB* a);
