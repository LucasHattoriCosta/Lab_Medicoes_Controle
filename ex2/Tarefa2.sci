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

//<<<<<<< HEAD
[y_C_o_f,Fs_C_o_f,bits_C_o_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_o_fechado.wav')
[y_C_o_a,Fs_C_o_a,bits_C_o_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_o_aberto.wav')
[y_C_a_a,Fs_C_a_a,bits_C_a_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_a_aberto.wav')
[y_C_a_f,Fs_C_a_f,bits_C_a_f]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_a_fechado.wav')
[y_Ha_a_a,Fs_Ha_a_a,bits_Ha_a_a]=wavread('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Hatta_A_aberto.wav')

x=[1:size(y_C_o_f)]
disp(x)

// =======
[y_C_o_f,Fs_C_o_f,bits_C_o_f]=wavread('.\Sons\Caique_o_fechado.wav')
[y_C_o_a,Fs_C_o_a,bits_C_o_a]=wavread('.\Sons\Caique_o_aberto.wav')
[y_C_a_a,Fs_C_a_a,bits_C_a_a]=wavread('.\Sons\Caique_a_aberto.wav')
[y_C_a_f,Fs_C_a_f,bits_C_a_f]=wavread('.\Sons\Caique_a_fechado.wav')
[y_Ha_a_a,Fs_Ha_a_a,bits_Ha_a_a]=wavread('.\Sons\Hatta_A_aberto.wav')

//>>>>>>> 8b33faf8ba9e7a65de968ed6c554b38eed326687
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
