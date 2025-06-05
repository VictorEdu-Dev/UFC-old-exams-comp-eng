typedef struct fila Fila;

Fila* fila_cria(void);

int fila_vazia(Fila *f);

void fila_insere(Fila *f, int info);

int fila_remove(Fila *f);

void fila_imprime(Fila *f);

int tamanho(Fila* f);

void fila_libera(Fila *f);

int qtd_maior(Fila* f, int n);

Fila* inverte(Fila* f);

int pares(Fila* f);


