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
[y_C_a_a,Fs]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_a_aberto.wav')
[y_Ha_a_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Hatta_A_aberto.wav')
[y_He_a_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Heitor_a_aberto.wav')
[y_Pi_a_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_aaberto.wav')
//[y_Pk_a_a,Fs_Pk_a_a,bits_Pk_a_a]=wavread('.\Sons\Pavelski_a_aberto.wav')

//E aberto
[y_C_e_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_e_aberto.wav')
[y_He_e_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Heitor_e_aberto.wav')
[y_Pi_e_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_eaberto.wav')

//I aberto
[y_C_i]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_i_aberto.wav')
[y_He_i]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Heitor_i_aberto.wav')
[y_Pi_i]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_i.wav')

//O aberto
[y_C_o_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_o_aberto.wav')
[y_Ha_o_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Hatta_O_aberto.wav')
[y_He_o_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Heitor_o_aberto.wav')
[y_Pi_o_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_oaberto.wav')


x = 1:(size(y_C_o_a)(2))

scf(0)
plot(1:(size(y_C_a_a)(2)),y_C_a_a,1)
plot(1:(size(y_Ha_a_a)(2)),y_Ha_a_a,2)
plot(1:(size(y_He_a_a)(2)),y_He_a_a,3)
plot(1:(size(y_Pi_a_a)(2)),y_Pi_a_a,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Resposta no tempo - A aberto'])

scf(1)
plot(1:(size(y_C_e_a)(2)),y_C_e_a,1)
plot(1:(size(y_He_e_a)(2)),y_He_e_a,3)
plot(1:(size(y_Pi_e_a)(2)),y_Pi_e_a,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Resposta no tempo - E aberto'])

scf(2)
plot(y_C_i,x,1)
plot(y_He_i,x,3)
plot(y_Pi_i,x,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Resposta no tempo - I aberto'])

scf(3)
plot(y_C_o_a,x,1)
plot(y_Ha_o_a,x,2)
plot(y_He_o_a,x,3)
plot(y_Pi_o_a,x,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Resposta no tempo - O aberto'])


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

//[U_Pk_aa, frequency_vector_Pk_aa, n_Pk_aa] = transformada(y_Pk_a_a,rate)

scf(3)
plot2d(frequency_vector_C_aa,abs(U_C_aa(1:n_C_aa)),1)
plot2d(frequency_vector_Ha_aa,abs(U_Ha_aa(1:n_Ha_aa)),2)
plot2d(frequency_vector_He_aa,abs(U_He_aa(1:n_He_aa)),3)
plot2d(frequency_vector_Pi_aa,abs(U_Pi_aa(1:n_Pi_aa)),4)
//plot2d(frequency_vector_Pk_aa,abs(U_Pk_aa(1:n_Pk_aa)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - A aberto'])

scf(4)
plot2d(frequency_vector_C_ea,abs(U_C_ea(1:n_C_ea)),1)
plot2d(frequency_vector_He_ea,abs(U_He_ea(1:n_He_ea)),3)
plot2d(frequency_vector_Pi_ea,abs(U_Pi_ea(1:n_Pi_ea)),4)
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

//Dados dos sons fechados
//-------------------- Sinais em Função do Tempo -----------------------

//A fechado
[y_C_a_f,Fs_C_a_f,bits_C_a_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_a_fechado.wav')
[y_He_a_f,Fs_He_a_f,bits_He_a_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex\Sons\Heitor_a_fechado.wav')
[y_Pi_a_f,Fs_Pi_a_f,bits_Pi_a_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_afechado.wav')
//[y_Pk_a_f,Fs_Pk_a_f,bits_Pk_a_f]=wavread('.\Sons\Pavelski_a_fechado.wav')

//E fechado
[y_C_e_f,Fs_C_e_f,bits_C_e_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_e_fechado.wav')
[y_Ha_e_f,Fs_Ha_e_f,bits_Ha_e_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Hatta_E_fechado.wav')
[y_He_e_f,Fs_He_e_f,bits_He_e_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Heitor_e_fechado.wav')
[y_Pi_e_f,Fs_Pi_e_f,bits_Pi_e_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_efechado.wav')

//O fechado
[y_C_o_f,Fs_C_o_f,bits_C_o_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_o_fechado.wav')
[y_Ha_o_f,Fs_Ha_o_f,bits_Ha_o_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Hatta_O_fechado.wav')
[y_He_o_f,Fs_He_o_f,bits_He_o_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Heitor_o_fechado.wav')
[y_Pi_o_f,Fs_Pi_o_f,bits_Pi_o_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Paiva_ofechado.wav')
scf(7)
plot(y_C_a_f,x,1)
plot(y_He_a_f,x,3)
plot(y_Pi_a_f,x,4)
//plot(y_Pk_a_f,x,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Resposta no tempo - A fechado'])

scf(8)
plot(y_C_e_f,x,1)
plot(y_Ha_e_f,x,2)
plot(y_He_e_f,x,3)
plot(y_Pi_e_f,x,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori''Heitor';'Paiva'])
title(['Resposta no tempo - E fechado'])

scf(9)
plot(y_C_o_f,x,1)
plot(y_Ha_o_f,x,2)
plot(y_He_o_f,x,3)
plot(y_Pi_o_f,x,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Resposta no tempo - O fechado'])


//---------------- Espectros de Frequência dos Sinais ------------------

[U_C_af, frequency_vector_C_af, n_C_af] = transformada(y_C_a_f,rate)
[U_C_ef, frequency_vector_C_ef, n_C_ef] = transformada(y_C_e_f,rate)
[U_C_of, frequency_vector_C_of, n_C_of] = transformada(y_C_o_f,rate)

[U_Ha_ef, frequency_vector_Ha_ef, n_Ha_ef] = transformada(y_Ha_e_f,rate)
[U_Ha_of, frequency_vector_Ha_of, n_Ha_of] = transformada(y_Ha_o_f,rate)

[U_He_af, frequency_vector_He_af, n_He_af] = transformada(y_He_a_f,rate)
[U_He_ef, frequency_vector_He_ef, n_He_ef] = transformada(y_He_e_f,rate)
[U_He_of, frequency_vector_He_of, n_He_of] = transformada(y_He_o_f,rate)

[U_Pi_af, frequency_vector_Pi_af, n_Pi_af] = transformada(y_Pi_a_f,rate)
[U_Pi_ef, frequency_vector_Pi_ef, n_Pi_ef] = transformada(y_Pi_e_f,rate)
[U_Pi_of, frequency_vector_Pi_of, n_Pi_of] = transformada(y_Pi_o_f,rate)

//[U_Pk_af, frequency_vector_Pk_af, n_Pk_af] = transformada(y_Pk_a_f,rate)

scf(10)
plot2d(frequency_vector_C_af,abs(U_C_af(1:n_C_af)),1)
plot2d(frequency_vector_He_af,abs(U_He_af(1:n_He_af)),3)
plot2d(frequency_vector_Pi_af,abs(U_Pi_af(1:n_Pi_af)),4)
//plot2d(frequency_vector_Pk_af,abs(U_Pk_af(1:n_Pk_af)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - A fechado'])

scf(11)
plot2d(frequency_vector_C_ef,abs(U_C_ef(1:n_C_ef)),1)
plot2d(frequency_vector_Ha_ef,abs(U_Ha_ef(1:n_Ha_ef)),2)
plot2d(frequency_vector_He_ef,abs(U_He_ef(1:n_He_ef)),3)
plot2d(frequency_vector_Pi_ef,abs(U_Pi_ef(1:n_Pi_ef)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - E fechado'])

scf(12)
plot2d(frequency_vector_C_of,abs(U_C_of(1:n_C_of)),1)
plot2d(frequency_vector_Ha_of,abs(U_Ha_of(1:n_Ha_of)),2)
plot2d(frequency_vector_He_of,abs(U_He_of(1:n_He_of)),3)
plot2d(frequency_vector_Pi_of,abs(U_Pi_of(1:n_Pi_of)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - O fechado'])

