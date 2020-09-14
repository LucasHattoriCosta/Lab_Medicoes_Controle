//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Tarefa 1 

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
rate = 100 //Hz (taxa de amostragem)

function [U, frequency_vector, n] = transformada(sinal,rate)
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
endfunction

//=================== Dados para a régua com 5 cm ======================

//-------------------- Sinais em Função do Tempo -----------------------

cm5_1 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\5cm\5cm_1.csv')
[linha1, coluna1] = size(cm5_1)
cm5_2 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\5cm\5cm_2.csv')
[linha2, coluna2] = size(cm5_2)
cm5_3 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\5cm\5cm_3.csv')
[linha3, coluna3] = size(cm5_3)
cm5_4 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\5cm\5cm_4.csv')
[linha4, coluna4] = size(cm5_4)
cm5_5 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\5cm\5cm_5.csv')
[linha5, coluna5] = size(cm5_5)

scf(1)
subplot(321)
plot(cm5_1(2:linha1,1),cm5_1(2:linha1,4))
title("Sinal para régua com 5 cm - 1º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(322)
plot(cm5_2(2:linha2,1),cm5_2(2:linha2,4))
title("Sinal para régua com 5 cm - 2º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(323)
plot(cm5_3(2:linha3,1),cm5_3(2:linha3,4))
title("Sinal para régua com 5 cm - 3º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(324)
plot(cm5_4(2:linha4,1),cm5_4(2:linha4,4))
title("Sinal para régua com 5 cm - 4º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(325)
plot(cm5_5(2:linha5,1),cm5_5(2:linha5,4))
title("Sinal para régua com 5 cm - 5º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

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

//=================== Dados para a régua com 10 cm =====================

//-------------------- Sinais em Função do Tempo -----------------------

cm10_1 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\10cm\10cm_1.csv')
[linha1, coluna1] = size(cm10_1)
cm10_2 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\10cm\10cm_2.csv')
[linha2, coluna2] = size(cm10_2)
cm10_3 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\10cm\10cm_3.csv')
[linha3, coluna3] = size(cm10_3)
cm10_4 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\10cm\10cm_4.csv')
[linha4, coluna4] = size(cm10_4)
cm10_5 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\10cm\10cm_5.csv')
[linha5, coluna5] = size(cm10_5)

scf(3)
subplot(321)
plot(cm10_1(2:linha1,1),cm10_1(2:linha1,4))
title("Sinal para régua com 10 cm - 1º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(322)
plot(cm10_2(2:linha2,1),cm10_2(2:linha2,4))
title("Sinal para régua com 10 cm - 2º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(323)
plot(cm10_3(2:linha3,1),cm10_3(2:linha3,4))
title("Sinal para régua com 10 cm - 3º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(324)
plot(cm10_4(2:linha4,1),cm10_4(2:linha4,4))
title("Sinal para régua com 10 cm - 4º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(325)
plot(cm10_5(2:linha5,1),cm10_5(2:linha5,4))
title("Sinal para régua com 10 cm - 5º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

//---------------- Espectros de Frequência dos Sinais ------------------

[U_10_1, frequency_vector_10_1, n_10_1] = transformada(cm10_1(2:linha1,4),rate)
[U_10_2, frequency_vector_10_2, n_10_2] = transformada(cm10_2(2:linha2,4),rate)
[U_10_3, frequency_vector_10_3, n_10_3] = transformada(cm10_3(2:linha3,4),rate)
[U_10_4, frequency_vector_10_4, n_10_4] = transformada(cm10_4(2:linha4,4),rate)
[U_10_5, frequency_vector_10_5, n_10_5] = transformada(cm10_5(2:linha5,4),rate)

scf(4)
subplot(321)
plot2d(frequency_vector_10_1,abs(U_10_1(1:n_10_1)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 10 cm - 1º ensaio'])

subplot(322)
plot2d(frequency_vector_10_2,abs(U_10_2(1:n_10_2)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 10 cm - 2º ensaio'])

subplot(323)
plot2d(frequency_vector_10_3,abs(U_10_3(1:n_10_3)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - de 10 cm - 3º ensaio'])

subplot(324)
plot2d(frequency_vector_10_4,abs(U_10_4(1:n_10_4)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 10 cm - 4º ensaio'])

subplot(325)
plot2d(frequency_vector_10_5,abs(U_10_5(1:n_10_5)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 10 cm - 5º ensaio'])

//========= Dados para a régua com 20 cm =========

cm20_1 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\20cm\20cm_1.csv')
[linha1, coluna1] = size(cm20_1)
cm20_2 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\20cm\20cm_2.csv')
[linha2, coluna2] = size(cm20_2)
cm20_3 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\20cm\20cm_3.csv')
[linha3, coluna3] = size(cm20_3)
cm20_4 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\20cm\20cm_4.csv')
[linha4, coluna4] = size(cm20_4)
cm20_5 = csvRead('C:\Users\pedro\Documents\GitHub\Lab_Medicoes_Controle\ex2\dados_tarefa_1\20cm\20cm_5.csv')
[linha5, coluna5] = size(cm20_5)

scf(5)
subplot(321)
plot(cm20_1(2:linha1,1),cm20_1(2:linha1,4))
title("Sinal para régua com 20 cm - 1º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(322)
plot(cm20_2(2:linha2,1),cm20_2(2:linha2,4))
title("Sinal para régua com 20 cm - 2º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(323)
plot(cm20_3(2:linha3,1),cm20_3(2:linha3,4))
title("Sinal para régua com 20 cm - 3º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(324)
plot(cm20_4(2:linha4,1),cm20_4(2:linha4,4))
title("Sinal para régua com 20 cm - 4º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

subplot(325)
plot(cm20_5(2:linha5,1),cm20_5(2:linha5,4))
title("Sinal para régua com 20 cm - 5º ensaio")
set(gca(),"data_bounds",matrix([0,10,-12,12],2,-1))
xlabel("Tempo (s)")
ylabel("Aceleração (m/s^2)")

//---------------- Espectros de Frequência dos Sinais ------------------

[U_20_1, frequency_vector_20_1, n_20_1] = transformada(cm20_1(2:linha1,4),rate)
[U_20_2, frequency_vector_20_2, n_20_2] = transformada(cm20_2(2:linha2,4),rate)
[U_20_3, frequency_vector_20_3, n_20_3] = transformada(cm20_3(2:linha3,4),rate)
[U_20_4, frequency_vector_20_4, n_20_4] = transformada(cm20_4(2:linha4,4),rate)
[U_20_5, frequency_vector_20_5, n_20_5] = transformada(cm20_5(2:linha5,4),rate)

scf(6)
subplot(321)
plot2d(frequency_vector_20_1,abs(U_20_1(1:n_20_1)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 20 cm - 1º ensaio'])

subplot(322)
plot2d(frequency_vector_20_2,abs(U_20_2(1:n_20_2)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 20 cm - 2º ensaio'])

subplot(323)
plot2d(frequency_vector_20_3,abs(U_20_3(1:n_20_3)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 20 cm - 3º ensaio'])

subplot(324)
plot2d(frequency_vector_20_4,abs(U_20_4(1:n_20_4)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - régua de 20 cm - 4º ensaio'])

subplot(325)
plot2d(frequency_vector_20_5,abs(U_20_5(1:n_20_5)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de frequência - a régua de 20 cm - 5º ensaio'])





