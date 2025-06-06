nome_do_arquivo = input('Nome do arquivo a ser criado:') #No Python 2 use raw_input
arquivo = open(nome_do_arquivo, 'w+')
texto = arquivo.readlines()
texto.append(input('Insira o texto:'))
arquivo = open(nome_do_arquivo, 'w')
arquivo.writelines(texto)
arquivo.close()
