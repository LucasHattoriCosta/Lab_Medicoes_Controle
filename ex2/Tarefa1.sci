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

//========= Dados para a régua com 5 cm =========

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

//========= Dados para a régua com 10 cm =========

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

scf(2)
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

scf(3)
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




