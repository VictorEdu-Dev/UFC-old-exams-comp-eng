class Pessoa(object):
    FEMALE=0
    MALE=1

    def __init__(self, nome, sexo):
        super(Pessoa, self).__init__()
        self.nome = nome
        self.sexo = sexo

    def __str__(self):
        return str(self.nome)

class Pais(Pessoa):

    def __init__(self, nome, sexo, crianca):
        super(Pais, self).__init__(nome, sexo)
        self.crianca = Albertinho #comentario set nome da crianca

    def getCrianca(self):
        return self.crianca

    def __str__(self):
        pass
