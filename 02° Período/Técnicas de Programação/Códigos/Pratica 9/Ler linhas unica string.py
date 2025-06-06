#Ler todas as linhas em uma única string

arquivo = open('arquivo.txt' , 'r')
unica_string = arquivo.read()
print(unica_string)
arquivo.close()
