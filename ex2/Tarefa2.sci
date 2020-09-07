//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Tarefa 2 

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

[y_C_o_f,Fs_C_o_f,bits_C_o_f]=wavread('.\Sons\Caique_o_fechado.wav')
[y_C_o_a,Fs_C_o_a,bits_C_o_a]=wavread('.\Sons\Caique_o_aberto.wav')
[y_C_a_a,Fs_C_a_a,bits_C_a_a]=wavread('.\Sons\Caique_a_aberto.wav')
[y_C_a_f,Fs_C_a_f,bits_C_a_f]=wavread('.\Sons\Caique_a_fechado.wav')
[y_Ha_a_a,Fs_Ha_a_a,bits_Ha_a_a]=wavread('.\Sons\Hatta_A_aberto.wav')

x=[1:size(y_C_o_f)]
disp(x)



scf(0)
plot(y_C_o_f,x,1)
title('O fechado')
scf(1)
plot(y_C_o_a,x,1)
title('O aberto')
scf(2)
plot(y_C_a_f,x,1)
title('A fechado')
scf(3)
plot(y_C_a_a,x,1)
plot(y_Ha_a_a,x,2)
title('A aberto')
