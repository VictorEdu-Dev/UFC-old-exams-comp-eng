#Iteração sobre um arquivo

arquivo = open('arquivo.txt', 'r') 
for linha in arquivo:
    print(linha)
arquivo.close()


