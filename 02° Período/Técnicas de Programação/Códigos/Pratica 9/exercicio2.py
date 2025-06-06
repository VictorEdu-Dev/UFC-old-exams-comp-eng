#Exercicio 2, fatorial e arquivo

import math

nome_arquivo = input('Digite o nome do seu arquivo a ser criado: ') #Nome do arquivo

while 1:
    
    a = input("Digite um número para saber seu fatorial: ")
    
    fat = math.factorial(int(a))

    arquivo = open(nome_arquivo, 'a')

    arquivo.write('O fatorial de ' +a +' é: ' +str(fat) +'\n')

    arquivo.close()

    arquivo = open(nome_arquivo, 'r')

    unica_string = arquivo.read()

    print(unica_string)


