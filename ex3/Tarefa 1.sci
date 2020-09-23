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
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    plot2d(frequency_vector,abs(U(1:n)),2)
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

function sinal_filtrado = media_movel(sinal)
    for i = 4:length(sinal)
        sinal_filtrado(i) = (sinal(i)+sinal(i-1)+sinal(i-2)+sinal(i-3))/4
    end
endfunction

rate = 44100 //Hz (frequência de Amostragem)

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

sinal_la_acorde = wavread('.\Gravações\Violao_lá_acorde.wav')
t_la_acorde = 0:1:length(sinal_la_acorde)-1
t_la_acorde = t_la_acorde/rate

scf(2)
subplot(211)
transformada(sinal_la_acorde,rate)
title(['Lá acorde'])
subplot(212)
plot(t_la_acorde,sinal_la_acorde)

//=============================

sinal_la_acorde_filtrado = media_movel(sinal_la_acorde)

t_la_acorde_filtrado = 0:1:length(sinal_la_acorde_filtrado)-1
t_la_acorde_filtrado = t_la_acorde_filtrado/rate

scf(3)
subplot(211)
transformada(sinal_la_acorde_filtrado,rate)
title(['Lá acorde'])
subplot(212)
plot(t_la_acorde_filtrado,sinal_la_acorde_filtrado)

//playsnd(sinal_la_acorde,rate)
//playsnd(sinal_la_acorde_filtrado,rate)



