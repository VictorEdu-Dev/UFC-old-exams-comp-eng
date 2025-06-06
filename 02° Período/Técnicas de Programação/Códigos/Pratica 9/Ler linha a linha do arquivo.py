#Ler linha a linha do arquivo

arquivo = open('arquivo.txt', 'r')
primeira_linha = arquivo.readline()
segunda_linha = arquivo.readline()
terceira_linha = arquivo.readlines()

#etc...
arquivo.close()
