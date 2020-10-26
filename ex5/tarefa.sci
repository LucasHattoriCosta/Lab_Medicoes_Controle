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
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    scf()
    plot2d(frequency_vector(1:100),abs(U(1:100)),2)
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

//------------------ ANÁLISE DOS SINAIS OBTIDOS --------------------
aux=read('.\Sinais_gravados\103.txt',1852,3)
posicao=aux(:,1)
rate1 = 45.0707 //Hz (frequência de Amostragem)
transformada(posicao,rate1)

aux2=read('.\Sinais_gravados\seno.txt',1775,3)
posicao=aux2(:,1)
rate2 = 46.44044 //Hz (frequência de Amostragem)
transformada(posicao,rate2)

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
*/

