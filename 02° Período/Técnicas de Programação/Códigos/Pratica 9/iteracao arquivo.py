#Iteração sobre um arquivo, mostra o conteudo

arquivo = open('arquivo.txt', 'r') 
for linha in arquivo:
    print(linha)
arquivo.close()


