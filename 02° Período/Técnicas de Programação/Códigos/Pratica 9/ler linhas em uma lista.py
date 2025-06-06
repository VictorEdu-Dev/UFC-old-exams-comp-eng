#Ler todas as linhas em uma lista

arquivo = open('arquivo.txt', 'r')
lista = arquivo.readlines() #readlinesssssss
print(lista[3]) #texto da linha 3
arquivo.close()
