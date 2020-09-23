//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Atividade 3

//Grupo 4 - Integrantes:
//Caique de Oliveira Kobayashi - 9793461
//Heitor Fontana de Godoy - 10335677
//Lucas Hattori Costa - 10335847
//Lucas Pinheiro Paiva Cavalcante - 10274270
//Pedro Henrique Pavelski - 10335621

//clc
clear
xdel( winsid() )

pi = %pi

function transformada(sinal,rate)
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    plot2d(frequency_vector(1:5000),abs(U(1:5000)),2)
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

function sinal_filtrado = media_movel(sinal)
    for k = 4:length(sinal)
        sinal_filtrado(k) = (sinal(k)+sinal(k-1)+sinal(k-2)+sinal(k-3))/4
//        sinal_filtrado(k) = sinal(k-1)+(sinal(k)-sinal(k-N))/N
    end
endfunction

function sinal_filtrado = passa_baixo_trapezoidal(sinal,w,rate)
    T = 1/rate
    sinal_filtrado(1) = sinal(1)
    for k = 2:length(sinal)
        sinal_filtrado(k) = ((1-(w*T/2))/(1+(w*T/2)))*sinal_filtrado(k-1)+((w*T/2)/(1+(w*T/2)))*(sinal(k-1)+sinal(k))
    end
endfunction

function sinal_filtrado = passa_baixo_backward(sinal,w,rate)
    T = 1/rate
    sinal_filtrado(1) = sinal(1)
    for k = 2:length(sinal)
        sinal_filtrado(k) = (1/(1+w*T))*sinal_filtrado(k-1)+(1/(1+w*T))*T*w*sinal(k)
    end
endfunction

rate = 44100 //Hz (frequência de Amostragem)

//---------------------------VIOLÃO-------------------------------

sinal_la_nota = wavread('.\Gravações\Violao_lá_nota.wav')
t_la_nota = 0:1:length(sinal_la_nota)-1
t_la_nota = t_la_nota/rate

scf(1)
subplot(211)
transformada(sinal_la_nota,rate)
title(['Lá nota'])
subplot(212)
plot(t_la_nota,sinal_la_nota)

//=============================

sinal_la_acorde = wavread('.\Gravações\Violao_la_nota_v3.wav')
t_la_acorde = 0:1:length(sinal_la_acorde)-1
t_la_acorde = t_la_acorde/rate

scf(2)
subplot(211)
transformada(sinal_la_acorde,rate)
title(['Lá acorde'])
subplot(212)
plot(t_la_acorde,sinal_la_acorde)

//=============================

sinal_la_acorde_filtrado = passa_baixo_backward(sinal_la_acorde,1500,rate)

t_la_acorde_filtrado = 0:1:length(sinal_la_acorde_filtrado)-1
t_la_acorde_filtrado = t_la_acorde_filtrado/rate

scf(3)
subplot(211)
transformada(sinal_la_acorde_filtrado,rate)
title(['Lá acorde'])
subplot(212)
plot(t_la_acorde_filtrado,sinal_la_acorde_filtrado)

savewave('.\Gravações\Violao_la_nota_v3_filter.wav',sinal_la_acorde_filtrado,rate)


//playsnd(sinal_la_acorde,rate)
//playsnd(sinal_la_acorde_filtrado,rate)


//---------------------------PIANO---------------------------------
sinal_la_nota_p = wavread('.\Gravações\Piano_la_ruido_agudo.wav')
t_la_nota_p = 0:1:length(sinal_la_nota_p)-1
t_la_nota_p = t_la_nota_p/rate

scf(4)
subplot(211)
transformada(sinal_la_nota_p,rate)
title(['Lá piano com Ruído Agudo'])
subplot(212)
plot(t_la_nota_p,sinal_la_nota_p)

playsnd(sinal_la_nota_p,rate)

//=============================

sinal_la_acorde_p = wavread('.\Gravações\Piano_acorde_ruido_agudo.wav')
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

sinal_la_acorde_filtrado_p = passa_baixo_backward(sinal_la_acorde_p,1000,rate)

t_la_acorde_filtrado_p = 0:1:length(sinal_la_acorde_filtrado_p)-1
t_la_acorde_filtrado_p = t_la_acorde_filtrado_p/rate

scf(6)
subplot(211)
transformada(sinal_la_acorde_filtrado_p,rate)
title(['Acorde piano filtrado'])
subplot(212)
plot(t_la_acorde_filtrado_p,sinal_la_acorde_filtrado_p)

savewave('.\Gravações\Piano_acorde_ruido_agudo_filtrado.wav',sinal_la_acorde_filtrado_p,rate)

//playsnd(sinal_la_acorde_filtrado_p,rate)

//=============================

sinal_la_nota_filtrado_p = passa_baixo_backward(sinal_la_nota_p,1000,rate)

t_la_nota_filtrado_p = 0:1:length(sinal_la_nota_filtrado_p)-1
t_la_nota_filtrado_p = t_la_nota_filtrado_p/rate

scf(7)
subplot(211)
transformada(sinal_la_nota_filtrado_p,rate)
title(['Lá piano filtrado'])
subplot(212)
plot(t_la_nota_filtrado_p,sinal_la_nota_filtrado_p)

savewave('.\Gravações\Piano_la_ruido_agudo_filtrado.wav',sinal_la_nota_filtrado_p,rate)

playsnd(sinal_la_nota_filtrado_p,rate)
