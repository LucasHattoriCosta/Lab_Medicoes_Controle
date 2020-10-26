//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 5
//Atividade 5

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
    sinal = detrend(sinal)
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    scf()
    plot2d(frequency_vector(1:100),abs(U(1:100)),2)
    xtitle('Espectro de Frequências')
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

//------------------ ANÁLISE DOS SINAIS OBTIDOS --------------------
aux=read('.\Sinais_gravados\103.txt',1852,3)
posicao1=aux(:,1)
rate1 = 45.0707 //Hz (frequência de Amostragem)
transformada(posicao1,rate1)
t1 = 0:1/rate1:(length(posicao1)-1)/rate1
scf()
plot2d(t1,posicao1)
xtitle("Sinal amostrado - Saída de velocidade constante")
xlabel("Tempo (s)")
ylabel("Amplitude")

aux2=read('.\Sinais_gravados\seno.txt',1775,3)
posicao2=aux2(:,1)
rate2 = 46.44044 //Hz (frequência de Amostragem)
transformada(posicao2,rate2)
t2 = 0:1/rate2:(length(posicao2)-1)/rate2
scf()
plot2d(t2,posicao2)
xtitle("Sinal amostrado - Saída de velocidade senoidal")
xlabel("Tempo (s)")
ylabel("Amplitude")

/*
//============================= RELATÓRIO ==============================

//----------------------------  Descrição do Experimento -----------------------------
O experimento da presente tarefa consistiu a avaliação da oscilação de
uma pequena esfera de isopor no interior de um tubo, mediante acionamento
de um ventilador, controlado com uso de um Aruino UNO. Para tanto, foi
utilizada da bancada de experimentação remota desenvolvida pelo professor
da disciplina, a qual permitia que os alunos controlassem à distância os
equipamentos necessários. Foi, portanto, desenvolvido um código arduino 
e utilizado os softwares AnyDesk (para controle remoto do PC do professor)
e o Processing, para captação dos dados obtidos em tempo real.

Durante a experimentação, foi encontrada certa dificuldade no controle
efetico da esfera de isopor. A proposta inicial era de aplicação de uma
variação senoidal para a velocidade do ventilador, com o intuito de haver
uma variação na posição da esfera. Entretanto, verificou-se um comportamento
fortemente não linear na relação da velocidade do ventilador e a altura
da esfera, tal como uma altíssima instabilidade da posição da esfera até
mesmo para velocidades constantes.

Visando, portanto, aplicar os sinais obtidos ao propósito do experimento
(determinar a taxa de amostragem e definir o espectro de frequências
do sinal), utilizou-se de dois experimentos, para comparação. O primeiro
fez uso de uma saída de velocidade constante do ventilador, de tal forma
que se obteve ainda uma oscilação. Esta velocidade foi estabelecida como
de 103, em uma escala de 0 a 255 (onde 0 é a mínima e 255 a máxima
velocidade alcançada pelo ventilador). O segundo experimento foi realizado
com variação senoidal em torno da velocidade de 100 (na escala de 0 a 255),
variando 51 pontos para mais e para menos, seguindo uma variação senoidal.

//------------------------------ Resultados ----------------------------
Antes de se analisar os resultados, é importante mencionar que, parte das
dificuldades encontradas em se controlar a posição da bola de isopor ao longo
do tubo (ou seja, a saída do sistema), se deve, também, à baixa velocidade de
resposta a estímulos que o sistema possui. Mesmo isso sendo um comportamento
já esperado, dado que o sistema consiste na excitação de uma bola de isopor
(pouco densa) através de um fluxo turbulento de vento, em um tubo que promove
perdas de carga distribuídas, não foi possível realizar o experimento sem que
houvesse avaria dos dados coletados.





O segundo sinal capturado, no qual foi imposto um regime de velocidades
senoidal e que está 

*/

