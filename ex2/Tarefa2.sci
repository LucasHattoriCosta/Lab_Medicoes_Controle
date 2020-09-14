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
rate = 44000 //Hz (taxa de amostragem)

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
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - E aberto'])

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

[U_C_aa, frequency_vector_C_aa, n_C_aa] = transformada(y_C_a_a,rate)
[U_C_ea, frequency_vector_C_ea, n_C_ea] = transformada(y_C_e_a,rate)
[U_C_ia, frequency_vector_C_ia, n_C_ia] = transformada(y_C_i_a,rate)
[U_C_oa, frequency_vector_C_oa, n_C_oa] = transformada(y_C_o_a,rate)

[U_Ha_aa, frequency_vector_Ha_aa, n_Ha_aa] = transformada(y_Ha_a_a,rate)
[U_Ha_oa, frequency_vector_Ha_oa, n_Ha_oa] = transformada(y_Ha_o_a,rate)

[U_He_aa, frequency_vector_He_aa, n_He_aa] = transformada(y_He_a_a,rate)
[U_He_ea, frequency_vector_He_ea, n_He_ea] = transformada(y_He_e_a,rate)
[U_He_ia, frequency_vector_He_ia, n_He_ia] = transformada(y_He_i_a,rate)
[U_He_oa, frequency_vector_He_oa, n_He_oa] = transformada(y_He_o_a,rate)

[U_Pi_aa, frequency_vector_Pi_aa, n_Pi_aa] = transformada(y_Pi_a_a,rate)
[U_Pi_ea, frequency_vector_Pi_ea, n_Pi_ea] = transformada(y_Pi_e_a,rate)
[U_Pi_ia, frequency_vector_Pi_ia, n_Pi_ia] = transformada(y_Pi_i_a,rate)
[U_Pi_oa, frequency_vector_Pi_oa, n_Pi_oa] = transformada(y_Pi_o_a,rate)

[U_Pk_aa, frequency_vector_Pk_aa, n_Pk_aa] = transformada(y_Pk_a_a,rate)

scf(3)
plot2d(frequency_vector_C_aa,abs(U_C_aa(1:n_C_aa)),1)
plot2d(frequency_vector_Ha_aa,abs(U_Ha_aa(1:n_Ha_aa)),2)
plot2d(frequency_vector_He_aa,abs(U_He_aa(1:n_He_aa)),3)
plot2d(frequency_vector_Pi_aa,abs(U_Pi_aa(1:n_Pi_aa)),4)
plot2d(frequency_vector_Pk_aa,abs(U_Pk_aa(1:n_Pk_aa)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva';'Pavelski'])
title(['Espectro de frequência - A aberto'])

scf(4)
plot2d(frequency_vector_C_ea,abs(U_C_ea(1:n_C_aa)),1)
plot2d(frequency_vector_He_ea,abs(U_He_ea(1:n_He_aa)),3)
plot2d(frequency_vector_Pi_ea,abs(U_Pi_ea(1:n_Pi_aa)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - E aberto'])

scf(5)
plot2d(frequency_vector_C_ia,abs(U_C_ia(1:n_C_ia)),1)
plot2d(frequency_vector_He_ia,abs(U_He_ia(1:n_He_ia)),3)
plot2d(frequency_vector_Pi_ia,abs(U_Pi_ia(1:n_Pi_ia)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - I aberto'])

scf(6)
plot2d(frequency_vector_C_oa,abs(U_C_oa(1:n_C_oa)),1)
plot2d(frequency_vector_Ha_oa,abs(U_Ha_oa(1:n_Ha_oa)),2)
plot2d(frequency_vector_He_oa,abs(U_He_oa(1:n_He_oa)),3)
plot2d(frequency_vector_Pi_oa,abs(U_Pi_oa(1:n_Pi_oa)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - O aberto'])

scf(2)
subplot(321)
plot2d(frequency_vector_5_1,abs(U_5_1(1:n_5_1)),2)

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

scf(0)
plot(y_C_a_f,x,1)
plot(y_He_a_f,x,3)
plot(y_Pi_a_f,x,4)
plot(y_Pk_a_f,x,5)
title('A fechado')

scf(1)
plot(y_C_e_a,x,1)
plot(y_He_e_a,x,2)
plot(y_Pi_e_a,x,3)
title('E fechado')

scf(3)
plot(y_C_o_a,x,1)
plot(y_Ha_o_a,x,2)
plot(y_He_o_a,x,3)
plot(y_Pi_o_a,x,4)
title('O fechado')


//---------------- Espectros de Frequência dos Sinais ------------------

[U_C_aa, frequency_vector_C_aa, n_C_aa] = transformada(y_C_a_a,rate)
[U_C_ea, frequency_vector_C_ea, n_C_ea] = transformada(y_C_e_a,rate)
[U_C_ia, frequency_vector_C_ia, n_C_ia] = transformada(y_C_i_a,rate)
[U_C_oa, frequency_vector_C_oa, n_C_oa] = transformada(y_C_o_a,rate)

[U_Ha_aa, frequency_vector_Ha_aa, n_Ha_aa] = transformada(y_Ha_a_a,rate)
[U_Ha_oa, frequency_vector_Ha_oa, n_Ha_oa] = transformada(y_Ha_o_a,rate)

[U_He_aa, frequency_vector_He_aa, n_He_aa] = transformada(y_He_a_a,rate)
[U_He_ea, frequency_vector_He_ea, n_He_ea] = transformada(y_He_e_a,rate)
[U_He_ia, frequency_vector_He_ia, n_He_ia] = transformada(y_He_i_a,rate)
[U_He_oa, frequency_vector_He_oa, n_He_oa] = transformada(y_He_o_a,rate)

[U_Pi_aa, frequency_vector_Pi_aa, n_Pi_aa] = transformada(y_Pi_a_a,rate)
[U_Pi_ea, frequency_vector_Pi_ea, n_Pi_ea] = transformada(y_Pi_e_a,rate)
[U_Pi_ia, frequency_vector_Pi_ia, n_Pi_ia] = transformada(y_Pi_i_a,rate)
[U_Pi_oa, frequency_vector_Pi_oa, n_Pi_oa] = transformada(y_Pi_o_a,rate)

[U_Pk_aa, frequency_vector_Pk_aa, n_Pk_aa] = transformada(y_Pk_a_a,rate)

scf(3)
plot2d(frequency_vector_C_aa,abs(U_C_aa(1:n_C_aa)),1)
plot2d(frequency_vector_Ha_aa,abs(U_Ha_aa(1:n_Ha_aa)),2)
plot2d(frequency_vector_He_aa,abs(U_He_aa(1:n_He_aa)),3)
plot2d(frequency_vector_Pi_aa,abs(U_Pi_aa(1:n_Pi_aa)),4)
plot2d(frequency_vector_Pk_aa,abs(U_Pk_aa(1:n_Pk_aa)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva';'Pavelski'])
title(['Espectro de frequência - A aberto'])

scf(4)
plot2d(frequency_vector_C_ea,abs(U_C_ea(1:n_C_aa)),1)
plot2d(frequency_vector_He_ea,abs(U_He_ea(1:n_He_aa)),3)
plot2d(frequency_vector_Pi_ea,abs(U_Pi_ea(1:n_Pi_aa)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - E aberto'])

scf(5)
plot2d(frequency_vector_C_ia,abs(U_C_ia(1:n_C_ia)),1)
plot2d(frequency_vector_He_ia,abs(U_He_ia(1:n_He_ia)),3)
plot2d(frequency_vector_Pi_ia,abs(U_Pi_ia(1:n_Pi_ia)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - I aberto'])

scf(6)
plot2d(frequency_vector_C_oa,abs(U_C_oa(1:n_C_oa)),1)
plot2d(frequency_vector_Ha_oa,abs(U_Ha_oa(1:n_Ha_oa)),2)
plot2d(frequency_vector_He_oa,abs(U_He_oa(1:n_He_oa)),3)
plot2d(frequency_vector_Pi_oa,abs(U_Pi_oa(1:n_Pi_oa)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - O aberto'])

