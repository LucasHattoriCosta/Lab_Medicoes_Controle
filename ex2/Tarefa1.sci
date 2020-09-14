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

//=================== Dados para a régua com 20 cm =====================

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
title(['Espectro de frequência - régua de 20 cm - 5º ensaio'])


//============================= RELATÓRIO ==============================

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
// calcular assim a frequência natural e o coeficiente de amortecimento.
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
// A Janela gráfica 2 mostra o espectro de frequência para a régua com
// 5 cm livre. Nota-se que a amplitude do primeiro ensaio é maior, como
// esperado, já que a amplitude de oscilação verificada no sinal ao lon-
// go do tempo foi maior. Apesar disso, o pico do espectro está aproxi-
// madamente na mesma frequência para os cinco ensaios.
// 
// Assim, as frequências naturais verificada pelo espectro foram:
// 
// 1º Ensaio: 4,990 Hz
// 2º Ensaio: 4,995 Hz
// 3º Ensaio: 4,985 Hz
// 4º Ensaio: 4,995 Hz
// 5º Ensaio: 4,990 Hz
// 
// Assim, a frequência natural média foi de 4,991 +/- 0,004 Hz, valor 
// muito próximo ao que encontrado analisando o sinal em função do tempo
// (5 Hz).
//
//
//-------------------------- Régua com 10 cm ---------------------------
//
// A Janela gráfica número 3 mostra os cinco sinais referente à aquisi-
// ção de dados de aceleração para a régua com comprimento livre de 10 cm. 
// Nota-se de prontidão que os sinais têm frequências parecidas, além de
// amplitudes iniciais parecidas, com excessão do 4º ensaio. 
// 
// Com o sinal descrito no tempo (Janela gráfica número 3), foi possível
// calcular assim a frequência natural e o coeficiente de amortecimento.
// 
// Para o cálculo da frequência, utilizou-se o os dois primeiros picos
// após o tempo de 5 segundos:
// 1º Ensaio: 5,411 - 5,071 = 0,340 s -> 2,941 Hz;
// 2º Ensaio: 5,420 - 5,081 = 0,339 s -> 2,950 Hz;
// 3º Ensaio: 5,370 - 5,031 = 0,339 s -> 2,950 Hz;
// 4º Ensaio: 5,550 - 5,211 = 0,339 s -> 2,950 Hz;
// 5º Ensaio: 5,091 - 5,430 = 0,339 s -> 2,950 Hz;
// 
// Portanto, a frequência natural é de 2,948 +/- 0,004 Hz.
// 
// O coeficiente de amortecimento (C) foi calculado da seguinte forma:
// 
// C = sqrt(delta^2/(delta^2+(2*pi)^2)), sendo delta = sqrt(y1/y2), onde
// y1 e y2 são dois picos consecutivos.
// 
// 1º Ensaio: y1 = 4,015 e y2 = 3,826 -> C = 0,0077
// 2º Ensaio: y1 = 3,672 e y2 = 5,528 -> C = 0,0064
// 3º Ensaio: y1 = 3,612 e y2 = 3,451 -> C = 0,0073
// 4º Ensaio: y1 = 4,284 e y2 = 4,090 -> C = 0,0074
// 5º Ensaio: y1 = 4,019 e y2 = 3,838 -> C = 0,0073
// 
// Assim, o coeficiente de amortecimento médio foi de 0,0072 +/- 0,0005.
// 
// A Janela gráfica 4 mostra o espectro de frequência para a régua com
// 10 cm livre. Nota-se que a amplitude do quarto ensaio é maior, como
// esperado, já que a amplitude de oscilação verificada no sinal ao lon-
// go do tempo foi maior. Apesar disso, o pico do espectro está aproxi-
// madamente na mesma frequência para os cinco ensaios.
// 
// Assim, as frequências naturais verificada pelo espectro foram:
// 
// 1º Ensaio: 2,900 Hz
// 2º Ensaio: 2,897 Hz
// 3º Ensaio: 2,897 Hz
// 4º Ensaio: 2,894 Hz
// 5º Ensaio: 2,894 Hz
// 
// Assim, a frequência natural média foi de 2,896 +/- 0,003 Hz, valor 
// muito próximo ao que encontrado analisando o sinal em função do tempo
// (2,948 +/- 0,004 Hz), com uma diferença de 0,05 Hz.
// 
//
//-------------------------- Régua com 20 cm ---------------------------
//
// A Janela gráfica número 5 mostra os cinco sinais referente à aquisi-
// ção de dados de aceleração para a régua com comprimento livre de 20 cm. 
// Nota-se de prontidão que os sinais têm frequências parecidas, além de
// amplitudes iniciais parecidas. 
// 
// Com o sinal descrito no tempo (Janela gráfica número 5), foi possível
// calcular assim a frequência natural e o coeficiente de amortecimento.
// 
// Para o cálculo da frequência, utilizou-se o os dois primeiros picos
// após o tempo de 5 segundos:
// 1º Ensaio: 6,109 - 5,490 = 0,619 s -> 1,616 Hz;
// 2º Ensaio: 6,129 - 5,510 = 0,619 s -> 1,616 Hz;
// 3º Ensaio: 6,138 - 5,522 = 0,616 s -> 1,623 Hz;
// 4º Ensaio: 6,119 - 5,510 = 0,609 s -> 1,642 Hz;
// 5º Ensaio: 6,189 - 5,580 = 0,609 s -> 1,642 Hz;
// 
// Portanto, a frequência natural é de 1,63 +/- 0,01 Hz.
// 
// O coeficiente de amortecimento (C) foi calculado da seguinte forma:
// 
// C = sqrt(delta^2/(delta^2+(2*pi)^2)), sendo delta = sqrt(y1/y2), onde
// y1 e y2 são dois picos consecutivos.
// 
// 1º Ensaio: y1 = 5,333 e y2 = 4,964 -> C = 0,0114
// 2º Ensaio: y1 = 5,922 e y2 = 5,574 -> C = 0,0096
// 3º Ensaio: y1 = 5,885 e y2 = 5,515 -> C = 0,0103
// 4º Ensaio: y1 = 5,820 e y2 = 5,513 -> C = 0,0086
// 5º Ensaio: y1 = 5,884 e y2 = 5,546 -> C = 0,0094
// 
// Assim, o coeficiente de amortecimento médio foi de 0,010 +/- 0,001.
// 
// A Janela gráfica 6 mostra o espectro de frequência para a régua com
// 10 cm livre. Nota-se que a amplitude do quarto ensaio é maior, como
// esperado, já que a amplitude de oscilação verificada no sinal ao lon-
// go do tempo foi maior. Apesar disso, o pico do espectro está aproxi-
// madamente na mesma frequência para os cinco ensaios.
// 
// Assim, as frequências naturais verificada pelo espectro foram:
// 
// 1º Ensaio: 1,598 Hz
// 2º Ensaio: 1,595 Hz
// 3º Ensaio: 1,598 Hz
// 4º Ensaio: 1,597 Hz
// 5º Ensaio: 1,597 Hz
// 
// Assim, a frequência natural média foi de 1,597 +/- 0,001 Hz, valor 
// muito próximo ao que encontrado analisando o sinal em função do tempo
// (1,63 +/- 0,01 Hz), com uma diferença de 0,03 Hz.
 
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





