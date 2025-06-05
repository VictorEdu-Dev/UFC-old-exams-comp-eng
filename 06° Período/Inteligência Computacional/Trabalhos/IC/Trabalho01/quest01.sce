clear
clc

// ==== COLOCAR AQUI OS VALORES DE ENTRADA ====
p_pedal = 60;
v_carro = 80;
v_roda = 55;

// Valores pedal (fraco, medio, forte)
// fraco
if (p_pedal >= 0 && p_pedal < 50) then
    p_pedal_fraco = (50 - p_pedal) / 50;
else
    p_pedal_fraco = 0;
end

// médio
if p_pedal > 30 && p_pedal < 70 then
    p_pedal_medio = 1 - abs((p_pedal - 50) / 20);
else
    p_pedal_medio = 0;
end

// alto
if (p_pedal > 50 && p_pedal <= 100) then
    p_pedal_forte = (p_pedal - 50) / 50;
else
    p_pedal_forte = 0;
end

// Valores carro (devagar, medio, rapido)
// fraco
if (v_carro >= 0 && v_carro < 60) then
    v_carro_fraco = (60 - v_carro) / 60;
else
    v_carro_fraco = 0;
end

// médio
if v_carro > 20 && v_carro < 80 then
    v_carro_medio = 1 - abs((v_carro - 50) / 30);
else
    v_carro_medio = 0;
end

// alto
if v_carro >= 40 then
    v_carro_alto = (v_carro - 40) / 60;
else
    v_carro_alto = 0;
end

// Valores roda (devagar, medio, rapido)
// fraco
if (v_roda >= 0 && v_roda < 60) then
    v_roda_fraco = (60 - v_roda) / 60;
else
    v_roda_fraco = 0;
end

// médio
if v_roda > 20 && v_roda < 80 then
    v_roda_medio = 1 - abs((v_roda - 50) / 30);
else
    v_roda_medio = 0;
end

// alto
if v_roda >= 40 then
    v_roda_alto = (v_roda - 40) / 60;
else
    v_roda_alto = 0;
end

// =========INFERÊNCIAS=========

// regras 1 e 2 (AperteFreio)
inf1 = p_pedal_medio + min(p_pedal_forte, v_carro_alto, v_roda_alto);

// regras 3 e 4 (LibereFreio)
inf2 = p_pedal_fraco + min(p_pedal_forte, v_carro_alto, v_roda_fraco);

numerador = 0;
denominador = 0;
passo = 2;

if inf2 < inf1 then
    while passo <= 100
       info = passo / 100;
        
        if info < inf2 then
            numerador = numerador + (passo * inf2);
            denominador = denominador + inf2;
        elseif info > inf1
            numerador = numerador + (passo * inf1);
            denominador = denominador + inf1;
        else
            numerador = numerador + (passo * info);
            denominador = denominador + info;
        end
        
        passo = passo + 5;
    end
else
    while passo <= 100
       info = (100 - passo) / 100;
        
        if info > inf2 then
            numerador = numerador + (passo * inf2);
            denominador = denominador + inf2;
        elseif info <  inf1
            numerador = numerador + (passo * inf1);
            denominador = denominador + inf1;
        else
            numerador = numerador + (passo * info);
            denominador = denominador + info;
        end
        
        passo = passo + 5;
    end
end

centroide = numerador / denominador;
