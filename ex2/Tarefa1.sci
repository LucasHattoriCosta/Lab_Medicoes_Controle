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

//============================= TAREFA 1 ===============================

//---------------------------- Experimento -----------------------------

// O experimento buscou simular uma viga engastada em balanço com massa
// na extremidade. Para isso utilizou-se uma régua, que foi fixada em 
// uma mesa com o auxílio de um grampo sargento e uma borracha. Na outra
// extremidade, foi fixado um celular iPhone, rodando iOS, que serviu 
// tanto de peso, quanto de sensor. Assim, o objetivo do experimento é 
// identificar a frequência natural e o coeficiente de amortecimento do 
// sistema para três comprimentos diferentes da régua (5, 10 e 20 cm).

// Para isso, gravou-se os sinais de aceleração em z através do aplica-
// tivo phyphox, cuja a taxa de amostragem é de 100 Hz e é capaz de ex-
// portar os dados no formato CSV.

// É possível encontrar mais informações do experimento no arquivo
// "Apresentação_do_experimento.pdf", que contém imagens do aparato mon-
// tado e informações adicionais.

//------------------------- Dados do Experimento -----------------------

rate = 100 //Hz (taxa de amostragem)

// código abaixo veio da documentacao da funcao fft() e foi implementado
// na forma de função.
function [U, frequency_vector, n] = transformada(sinal,rate)
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
endfunction

//=================== Dados para a régua com 5 cm ======================

//-------------------- Sinais em Função do Tempo -----------------------

cm5_1 = csvRead('.\dados_tarefa_1\5cm\5cm_1.csv')
[linha1, coluna1] = size(cm5_1)
cm5_2 = csvRead('.\dados_tarefa_1\5cm\5cm_2.csv')
[linha2, coluna2] = size(cm5_2)
cm5_3 = csvRead('.\dados_tarefa_1\5cm\5cm_3.csv')
[linha3, coluna3] = size(cm5_3)
cm5_4 = csvRead('.\dados_tarefa_1\5cm\5cm_4.csv')
[linha4, coluna4] = size(cm5_4)
cm5_5 = csvRead('.  \dados_tarefa_1\5cm\5cm_5.csv')
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

cm10_1 = csvRead('.\dados_tarefa_1\10cm\10cm_1.csv')
[linha1, coluna1] = size(cm10_1)
cm10_2 = csvRead('.\dados_tarefa_1\10cm\10cm_2.csv')
[linha2, coluna2] = size(cm10_2)
cm10_3 = csvRead('.\dados_tarefa_1\10cm\10cm_3.csv')
[linha3, coluna3] = size(cm10_3)
cm10_4 = csvRead('.\dados_tarefa_1\10cm\10cm_4.csv')
[linha4, coluna4] = size(cm10_4)
cm10_5 = csvRead('.\dados_tarefa_1\10cm\10cm_5.csv')
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

//=================== Dados para a régua com 20 cm =====================

cm20_1 = csvRead('.\dados_tarefa_1\20cm\20cm_1.csv')
[linha1, coluna1] = size(cm20_1)
cm20_2 = csvRead('.\dados_tarefa_1\20cm\20cm_2.csv')
[linha2, coluna2] = size(cm20_2)
cm20_3 = csvRead('.\dados_tarefa_1\20cm\20cm_3.csv')
[linha3, coluna3] = size(cm20_3)
cm20_4 = csvRead('.\dados_tarefa_1\20cm\20cm_4.csv')
[linha4, coluna4] = size(cm20_4)
cm20_5 = csvRead('.\dados_tarefa_1\20cm\20cm_5.csv')
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
title(['Espectro de frequência - régua de 20 cm - 5º ensaio'])


//============================= RELATÓRIO ==============================

//--------------------------- Régua com 5 cm ---------------------------

// A Janela gráfica número 1 mostra os cinco sinais referente à aquisi-
// ção de dados de aceleração para a régua com comprimento livre de 5 cm. 
// Nota-se de prontidão que os sinais têm frequências parecidas, além de
// amplitudes iniciais parecidas, com excessão do 1º ensaio. Porém, como
// o objetivo é mensurar a frequência de vibração e o coeficiente de 
// amortecimento, a variação inicial na amplitude inicial não importa
// tanto.
// 
// Com o sinal descrito no tempo (Janela gráfica número 1), foi possível
// calcular assim a frequência natural e o oceficiente de amortecimento.
// 
// Para o cálculo da frequência, utilizou-se o os dois primeiros picos
// após o tempo de 5 segundos:
// 1º Ensaio: 5,29 - 5,09 = 0,2 s -> 5 Hz;
// 2º Ensaio: 5,26 - 5,06 = 0,2 s -> 5 Hz;
// 3º Ensaio: 5,31 - 5,11 = 0,2 s -> 5 Hz;
// 4º Ensaio: 5,25 - 5,05 = 0,2 s -> 5 Hz;
// 5º Ensaio: 5,27 - 5,07 = 0,2 s -> 5 Hz;
// 
// Portanto, pode-se dizer que a frequência natural é de 5 Hz.
// 
// O coeficiente de amortecimento (C) foi calculado da seguinte forma:
// 
// C = sqrt(delta^2/(delta^2+(2*pi)^2)), sendo delta = sqrt(y1/y2), onde
// y1 e y2 são dois picos consecutivos.
// 
// 1º Ensaio: y1 = 3,602 e y2 = 3,471 -> C = 0,0059
// 2º Ensaio: y1 = 3,031 e y2 = 2,944 -> C = 0,0046
// 3º Ensaio: y1 = 3,418 e y2 = 3,272 -> C = 0,0069
// 4º Ensaio: y1 = 3,336 e y2 = 3,240 -> C = 0,0046
// 5º Ensaio: y1 = 3,093 e y2 = 2,983 -> C = 0,0058
// 
// Assim, o coeficiente de amortecimento médio foi de 0,006 +/- 0,001.
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 





