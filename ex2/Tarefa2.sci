//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Tarefa 2 

//Grupo 4 - Integrantes:
//Caique de Oliveira Kobayashi - 9793461
//Heitor Fontana de Godoy - 10335677
//Lucas Hattori Costa - 10335847
//Lucas Pinheiro Paiva Cavalcante - 10274270
//Pedro Henrique Pavelski - 10335621

//Esta tarefa consiste na captação de sinais de áudio dos membros do grupo através de um aparelho celular. Posteriormente, os sinais são analisados através de comandos da ferramenta Scilab. A fim de evitar erros e desvios associados ao uso de diferentes softwares de sensores, todos os membros do grupo gravaram seus áudios no mesmo aplicativo: Gravador de Voz Fácil. Todos os áudios foram captados com as mesmas configurações: formato wav (como solicitado); taxa de amostragem de 44kHz; supressão de ruído padrão do aparelho (possíveis variações entre os aparelhos); e cancelamento de eco padrão do aparelho (possíveis variações entre os aparelhos).
//Como solicitado, os membros do grupo captaram o sinal sonoro de si mesmos pronunciando os fonemas abertos (a, é, i, ó), e fechados (â, ê, ô).


clc
clear
xdel( winsid() )

pi = %pi

// código abaixo veio da documentacao da funcao fft() e foi implementado
// na forma de função.
function [U, frequency_vector, n] = transformada(sinal,rate)
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
endfunction

//Dados dos sons abertos
//-------------------- Sinais em Função do Tempo -----------------------

//A aberto
[y_C_a_a,Fs_C_a_a,bits_C_a_a]=wavread('.\Sons\Caique_a_aberto.wav')
[y_Ha_a_a,Fs_Ha_a_a,bits_Ha_a_a]=wavread('.\Sons\Hatta_A_aberto.wav')
[y_He_a_a,Fs_He_a_a,bits_He_a_a]=wavread('.\Sons\Heitor_a_aberto.wav')
[y_Pi_a_a,Fs_Pi_a_a,bits_Pi_a_a]=wavread('.\Sons\Paiva_aaberto.wav')
[y_Pk_a_a,Fs_Pk_a_a,bits_Pk_a_a]=wavread('.\Sons\Pavelski_a_aberto.wav')

//E aberto
[y_C_e_a,Fs_C_e_a,bits_C_e_a]=wavread('.\Sons\Caique_e_aberto.wav')
[y_He_e_a,Fs_He_e_a,bits_He_e_a]=wavread('.\Sons\Heitor_e_aberto.wav')
[y_Pi_e_a,Fs_Pi_e_a,bits_Pi_e_a]=wavread('.\Sons\Paiva_eaberto.wav')

//I aberti
[y_C_i,Fs_C_i,bits_C_i]=wavread('.\Sons\Caique_i_aberto.wav')
[y_He_i,Fs_He_i,bits_He_i]=wavread('.\Sons\Heitor_i_aberto.wav')
[y_Pi_i,Fs_Pi_i,bits_Pi_i]=wavread('.\Sons\Paiva_i.wav')

//O aberto
[y_C_o_a,Fs_C_o_a,bits_C_o_a]=wavread('.\Sons\Caique_o_aberto.wav')
[y_Ha_o_a,Fs_Ha_o_a,bits_Ha_o_a]=wavread('.\Sons\Hatta_O_aberto.wav')
[y_He_o_a,Fs_He_o_a,bits_He_o_a]=wavread('.\Sons\Heitor_o_aberto.wav')
[y_Pi_o_a,Fs_Pi_o_a,bits_Pi_o_a]=wavread('.\Sons\Paiva_oaberto.wav')

x = 1:size(y_C_o_a)
disp(x)

scf(0)
plot(y_C_a_a,x,1)
plot(y_Ha_a_a,x,2)
plot(y_He_a_a,x,3)
plot(y_Pi_a_a,x,4)
plot(y_Pk_a_a,x,5)
title('A aberto')

scf(1)
plot(y_C_e_a,x,1)
plot(y_He_e_a,x,2)
plot(y_Pi_e_a,x,3)
title('E aberto')

scf(2)
plot(y_C_i,x,1)
plot(y_He_i,x,2)
plot(y_Pi_i,x,3)
title('I aberto')

scf(3)
plot(y_C_o_a,x,1)
plot(y_Ha_o_a,x,2)
plot(y_He_o_a,x,3)
plot(y_Pi_o_a,x,4)
title('O aberto')


//---------------- Espectros de Frequência dos Sinais ------------------

[U_5_1, frequency_vector_5_1, n_5_1] = transformada(cm5_1(2:linha1,4),rate)
[U_5_2, frequency_vector_5_2, n_5_2] = transformada(cm5_2(2:linha2,4),rate)
[U_5_3, frequency_vector_5_3, n_5_3] = transformada(cm5_3(2:linha3,4),rate)
[U_5_4, frequency_vector_5_4, n_5_4] = transformada(cm5_4(2:linha4,4),rate)
[U_5_5, frequency_vector_5_5, n_5_5] = transformada(cm5_5(2:linha5,4),rate)

scf(2)
subplot(321)
plot2d(frequency_vector_5_1,abs(U_5_1(1:n_5_1)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 5 cm - 1º ensaio'])

subplot(322)
plot2d(frequency_vector_5_2,abs(U_5_2(1:n_5_2)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 5 cm - 2º ensaio'])

subplot(323)
plot2d(frequency_vector_5_3,abs(U_5_3(1:n_5_3)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 5 cm - 3º ensaio'])

subplot(324)
plot2d(frequency_vector_5_4,abs(U_5_4(1:n_5_4)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 5 cm - 4º ensaio'])

subplot(325)
plot2d(frequency_vector_5_5,abs(U_5_5(1:n_5_5)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - de 5 cm - 5º ensaio'])


//Dados dos sons fechados
//-------------------- Sinais em Função do Tempo -----------------------

//A fechado
[y_C_a_f,Fs_C_a_f,bits_C_a_f]=wavread('.\Sons\Caique_a_fechado.wav')
[y_He_a_f,Fs_He_a_f,bits_He_a_f]=wavread('.\Sons\Heitor_a_fechado.wav')
[y_Pi_a_f,Fs_Pi_a_f,bits_Pi_a_f]=wavread('.\Sons\Paiva_afechado.wav')
[y_Pk_a_f,Fs_Pk_a_f,bits_Pk_a_f]=wavread('.\Sons\Pavelski_a_fechado.wav')

//E fechado
[y_C_e_f,Fs_C_e_f,bits_C_e_f]=wavread('.\Sons\Caique_e_fechado.wav')
[y_Ha_e_f,Fs_Ha_e_f,bits_Ha_e_f]=wavread('.\Sons\Hatta_E_fechado.wav')
[y_He_e_f,Fs_He_e_f,bits_He_e_f]=wavread('.\Sons\Heitor_e_fechado.wav')
[y_Pi_e_f,Fs_Pi_e_f,bits_Pi_e_f]=wavread('.\Sons\Paiva_efechado.wav')

//O fechado
[y_C_o_f,Fs_C_o_f,bits_C_o_f]=wavread('.\Sons\Caique_o_fechado.wav')
[y_Ha_o_f,Fs_Ha_o_f,bits_Ha_o_f]=wavread('.\Sons\Hatta_O_fechado.wav')
[y_He_o_f,Fs_He_o_f,bits_He_o_f]=wavread('.\Sons\Heitor_o_fechado.wav')
[y_Pi_o_f,Fs_Pi_o_f,bits_Pi_o_f]=wavread('.\Sons\Paiva_ofechado.wav')

