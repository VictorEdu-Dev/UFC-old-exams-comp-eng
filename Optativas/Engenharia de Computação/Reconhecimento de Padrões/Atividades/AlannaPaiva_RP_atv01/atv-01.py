# - Média aritmética (valor esperado, esperança);
# - Mediana;
# - Moda;
# - Média geométrica;
# - Média harmônica


import statistics

X = [1, 1, 1, 2, 3, 5, 7, 8, 20, 100]

media = statistics.mean(X)
print("Media:", media)
 
mediana = statistics.median(X)
print("Mediana:", mediana)

moda = statistics.mode(X)
print("Moda:", moda)

mediaGeo = statistics.geometric_mean(X)
print("Media Geometrica:", mediaGeo)

mediaHarm = statistics.harmonic_mean(X)
print("Media Harmonica:", mediaHarm)


#Media e Mediana costumam ter seus valores aproximadamente parecidos, porém, nos calculos obtidos, a media divergiu bastante da mediana, pois nos valores disponibilizados no vetor, encontramos uma maior quantidade de numeros pequenos e um numero muito grande em comparação com os outros,o 100.

#Supondo que, Se x1,x2,x3,⋯,xn são números positivos e Q, A, G e H são suas médias quadrática, aritmética, geométrica e harmônica, respectivamente, então Q >= A >= G >= H, logo, como os valores encontrados da Media G. e Media H. são 4.4940... e 2.2929..., respectivamente, o resultado condiz com o esperado!

#A moda condiz com o valor esperado, pois, ao observar os valores do vetor X, podemos constatar que o valor que mais se repete é o 1.