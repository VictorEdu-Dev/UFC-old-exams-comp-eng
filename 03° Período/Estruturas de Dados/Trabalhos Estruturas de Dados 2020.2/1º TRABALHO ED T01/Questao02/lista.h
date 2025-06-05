typedef struct lista Lista;

Lista *lst_cria();

int lst_vazia(Lista *l);

Lista* lst_insere(Lista *l, int info);

Lista* lst_busca(Lista *l, int info);

void lst_imprime(Lista *l);

Lista* lst_remove(Lista *l, int info);

void lst_libera(Lista *l);

Lista *ordem_crescente(Lista *l);
