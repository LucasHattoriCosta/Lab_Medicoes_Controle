//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Atividade 3

//Grupo 4 - Integrantes:
//Caique de Oliveira Kobayashi - 9793461
//Heitor Fontana de Godoy - 10335677
//Lucas Hattori Costa - 10335847
//Lucas Pinheiro Paiva Cavalcante - 10274270
//Pedro Henrique Pavelski - 10335621

clc
clear
xdel( winsid() )
pi = %pi


function transformada(sinal,rate) 
//Plota o espectro de frequência para um certo sinal dada a frequência de amostragem
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    plot2d(frequency_vector(1:10000),abs(U(1:10000)),2)
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

function sinal_filtrado = media_movel(sinal)
//Implementa o filtro de média móvel em relação ao valor atual e o 3 anteriores
    for k = 4:length(sinal)
        sinal_filtrado(k) = (sinal(k)+sinal(k-1)+sinal(k-2)+sinal(k-3))/4
    end
endfunction

function sinal_filtrado = passa_baixo_trapezoidal(sinal,w,rate)
//Implementa o filtro passa baixo trapexoidal para sim dado sinal, 
//uma frequência de corte (w) e a frequência de amostragem
    T = 1/rate
    sinal_filtrado(1) = sinal(1)
    for k = 2:length(sinal)
        sinal_filtrado(k) = ((1-(w*T/2))/(1+(w*T/2)))*sinal_filtrado(k-1)+((w*T/2)/(1+(w*T/2)))*(sinal(k-1)+sinal(k))
    end
endfunction

function sinal_filtrado = passa_baixo_backward(sinal,w,rate)
//Implementa o filtro passa baixo trapexoidal para sim dado sinal, 
//uma frequência de corte (w) e a frequência de amostragem
    T = 1/rate
    sinal_filtrado(1) = sinal(1)
    for k = 2:length(sinal)
        sinal_filtrado(k) = (1/(1+w*T))*sinal_filtrado(k-1)+(1/(1+w*T))*T*w*sinal(k)
    end
endfunction

function sistema_de_filtro(nome_do_arquivo,w,rate,nome,tipo_de_filtro)
    sinal = wavread(nome_do_arquivo)
    t = 0:1:length(sinal)-1
    t = t/rate
    scf()
    subplot(211)
    transformada(sinal,rate)
    title([nome])
    subplot(212)
    plot(t,sinal)
    
    if tipo_de_filtro == 1 then
        sinal_filtrado = media_movel(sinal)
    elseif tipo_de_filtro == 2 then
        sinal_filtrado = passa_baixo_trapezoidal(sinal,w,rate)
    elseif tipo_de_filtro == 3 then
        sinal_filtrado = passa_baixo_backward(sinal,w,rate)
    end
    
    t_filtrado = 0:1:length(sinal_filtrado)-1
    t_filtrado = t_filtrado/rate
    nome_filtrado = nome+' - filtrado'
    scf()
    subplot(211)
    transformada(sinal_filtrado,rate)
    title([nome_filtrado])
    subplot(212)
    plot(t_filtrado,sinal_filtrado)
endfunction

rate = 44100 //Hz (frequência de Amostragem)

//----------------------------- VIOLÃO ---------------------------------

sistema_de_filtro('.\gravações\Piano_acorde_ruido_agudo.wav',440,rate,'Piano - acorde com ruído agudo',2)
sistema_de_filtro('.\gravações\Piano_acorde_ruido_grave.wav',440,rate,'Piano - acorde com ruído grave',2)
sistema_de_filtro('.\gravações\Piano_la.wav',440,rate,'Piano - lá',2)
sistema_de_filtro('.\gravações\Piano_la_acorde.wav',440,rate,'Piano - lá acorde',2)
sistema_de_filtro('.\gravações\Piano_la_ruido_agudo.wav',440,rate,'Piano - lá com ruído agudo',2)
sistema_de_filtro('.\gravações\Piano_la_ruido_grave.wav',440,rate,'Piano - lá com ruído grave',2)
sistema_de_filtro('.\gravações\Violao_la_acorde_v1.wav',440,rate,'Violão - lá acorde (versão 1)',2)
sistema_de_filtro('.\gravações\Violao_la_acorde_v2.wav',440,rate,'Violão - lá acorde (versão 2)',2)
sistema_de_filtro('.\gravações\Violao_la_nota_v1.wav',440,rate,'Violão - nota lá (versão 1)',2)
sistema_de_filtro('.\gravações\Violao_la_nota_v2.wav',440,rate,'Violão - nota lá (versão 2)',2)
sistema_de_filtro('.\gravações\Violao_la_nota_v3.wav',440,rate,'Violão - nota lá (versão 3)',2)
sistema_de_filtro('.\gravações\Violao_la_nota_v4.wav',440,rate,'Violão - nota lá (versão 4)',2)







/*
sinal_la_nota = wavread('.\gravações\Violao_lá_nota.wav')
t_la_nota = 0:1:length(sinal_la_nota)-1
t_la_nota = t_la_nota/rate

scf(1)
subplot(211)
transformada(sinal_la_nota,rate)
title(['Lá nota'])
subplot(212)
plot(t_la_nota,sinal_la_nota)

//=============================

sinal_la_acorde = wavread('.\gravações\teste1.wav')
t_la_acorde = 0:1:length(sinal_la_acorde)-1
t_la_acorde = t_la_acorde/rate

scf(2)
subplot(211)
transformada(sinal_la_acorde,rate)
title(['Lá acorde'])
subplot(212)
plot(t_la_acorde,sinal_la_acorde)

//=============================

sinal_la_acorde_filtrado = passa_baixo_trapezoidal(sinal_la_acorde,440,rate)

t_la_acorde_filtrado = 0:1:length(sinal_la_acorde_filtrado)-1
t_la_acorde_filtrado = t_la_acorde_filtrado/rate

scf(3)
subplot(211)
transformada(sinal_la_acorde_filtrado,rate)
title(['Lá acorde'])
subplot(212)
plot(t_la_acorde_filtrado,sinal_la_acorde_filtrado)

//savewave('.\Gravações\Violao_la_nota_v3_filter.wav',sinal_la_acorde_filtrado,rate)

//playsnd(sinal_la_acorde,rate)
//playsnd(sinal_la_acorde_filtrado,rate)


//---------------------------PIANO---------------------------------
sinal_la_nota_p = wavread('.\gravações\Piano_la_ruido_agudo.wav')
t_la_nota_p = 0:1:length(sinal_la_nota_p)-1
t_la_nota_p = t_la_nota_p/rate

scf(4)
subplot(211)
transformada(sinal_la_nota_p,rate)
title(['Lá piano com Ruído Agudo'])
subplot(212)
plot(t_la_nota_p,sinal_la_nota_p)

//playsnd(sinal_la_nota_p,rate)

//=============================

sinal_la_acorde_p = wavread('.\gravações\Piano_acorde_ruido_agudo.wav')
t_la_acorde_p = 0:1:length(sinal_la_acorde_p)-1
t_la_acorde_p = t_la_acorde_p/rate

scf(5)
subplot(211)
transformada(sinal_la_acorde_p,rate)
title(['Acorde piano com Ruido Agudo'])
subplot(212)
plot(t_la_acorde_p,sinal_la_acorde_p)

//playsnd(sinal_la_acorde_p,rate)

//=============================

sinal_la_acorde_filtrado_p = passa_baixo_backward(sinal_la_acorde_p,440,rate)

t_la_acorde_filtrado_p = 0:1:length(sinal_la_acorde_filtrado_p)-1
t_la_acorde_filtrado_p = t_la_acorde_filtrado_p/rate

scf(6)
subplot(211)
transformada(sinal_la_acorde_filtrado_p,rate)
title(['Acorde piano filtrado'])
subplot(212)
plot(t_la_acorde_filtrado_p,sinal_la_acorde_filtrado_p)

savewave('.\gravações\Piano_acorde_ruido_agudo_filtrado.wav',sinal_la_acorde_filtrado_p,rate)

//playsnd(sinal_la_acorde_filtrado_p,rate)

//=============================

sinal_la_nota_filtrado_p = passa_baixo_backward(sinal_la_nota_p,440,rate)

t_la_nota_filtrado_p = 0:1:length(sinal_la_nota_filtrado_p)-1
t_la_nota_filtrado_p = t_la_nota_filtrado_p/rate

scf(7)
subplot(211)
transformada(sinal_la_nota_filtrado_p,rate)
title(['Lá piano filtrado'])
subplot(212)
plot(t_la_nota_filtrado_p,sinal_la_nota_filtrado_p)

savewave('.\gravações\Piano_la_ruido_agudo_filtrado.wav',sinal_la_nota_filtrado_p,rate)

//playsnd(sinal_la_nota_filtrado_p,rate)
*/
