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

//Os gráficos em função do tempo foram apresentados de forma ampliada, entre o intervalo de 2,25s a 2,75s. Isso, pois a frequência dos sinais eram muito elevados e a visualização completa do sinal não traz resultados muito conclusivos. Da mesma forma, os espectros de frequências foram apresentados entre o intervalo reduzido, buscando uma melhor visualização da região que concentra as principais frequeências.
//A partir dos gráficos de espectro de frequências, podemos estimar as frequências naturais e os harmônicos de cada fonema pronunciado, como apresentado a seguir:

//Valores das frequências naturais e seus harmônicos.
// A aberto:
//      Caique: fq = 770 Hz 
//              harmônicos: h1 = 460 Hz; h2 = 620 Hz ; h3 = 910 Hz

// E aberto:
//      Caique: fq = 550 Hz
//              harmônicos: h1 = 270 Hz; h2 = 410 Hz ; h3 = 680 Hz

// I aberto:
//      Caique: fq = 170 Hz
//              harmônicos: h1 = 330 Hz; h2 = 500 Hz

// O aberto:
//      Caique: fq = 640 Hz
//              harmônicos: h1 = 310 Hz; h2 = 460 Hz ; h3 = 800 Hz

// A fechado:
//      Caique: fq = 400 Hz
//              harmônicos: h1 = 140 Hz; h2 = 270 Hz ; h3 = 540 Hz

// E fechado:
//      Caique: fq = 410 Hz
//              harmônicos: h1 = 130 Hz; h2 = 270 Hz ; h3 = 540 Hz

// O fechado:
//      Caique: fq = 400 Hz
//              harmônicos: h1 = 130 Hz; h2 = 270 Hz ; h3 = 800 Hz

// Para os demais sons obtidos, temos que os valores de frequência naturais variam, devido à individualidade de fala de cada integrante. Os harmônicos, contudo, são análogos, seguindo o padrão de múltiplos que deve ser estabelecido.

//Comparando os sons obtidos, pode-se traçar diferentes tipos de comparações: 
//
// 1) Mesma fonema com som aberto ou fechado
//Para o primeiro tipo, é possível ver nos gráficos, como esperado, que os sons fechados possuem harmônicos e frequências de corte mais baixas, ou seja, sons mais graves. Usando os gráficos 7 e 13 para os sons da letra O, que, mesmo para pessoas diferentes (logo, para afinações e timbres diferentes) as frequências possuem padrões bem distintos, de forma que é possível diferenciar os fonemas a partir das mesmas.
//
// 2) Fonemas diferentes para a mesma pessoa
//Novamente, as diferenças entre sons abertos e fechados se repete de forma consistente, sendo, portanto, possível distinguir se a pessoa está falando um fonema aberto ou fechado (sendo o I aberto um pequena exceção, por apresentar frequência natural e harmônicos mais baixos). Porém, é difícil distinguir os fonemas abertos entre si, assim como os fonemas fechados são muito parecidos entre si. Um outro ponto, exemplificado pelos gráficos 14 e 15 é que é possível diferenciar pessoas diferentes plotando os espectros de potência para diferentes fonemas. No exemplo, um aluno se diferencia do outro por apresentar amplitudes e frequências mais altas.
//
// 3) Mesmo fonema para diferentes pessoas
//Novamente, é possível diferenciar pessoas por níveis diferentes de amplitude e frequências. Os fonemas tendem a terem harmônicos semelhantes mesmo que para pessoas distintas. Algumas exceções são o I aberto, que apresentou harmônicos baixos, o que não era esperado dado que é um fonema aberto, e variação entre as pessoas; e o fonema E fechado também demonstrou frequências distintas entre as pessoas.
clc
clear
disp(pwd())
xdel( winsid() )

pi = %pi
rate = 44100 //Hz (taxa de amostragem)

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
[y_C_a_a,Fs]=wavread('.\Sons\Caique_a_aberto.wav')
[y_Ha_a_a]=wavread('.\Sons\Hatta_A_aberto.wav')
[y_He_a_a]=wavread('.\Sons\Heitor_a_aberto.wav')
[y_Pi_a_a]=wavread('.\Sons\Paiva_aaberto.wav')
//[y_Pk_a_a,Fs_Pk_a_a,bits_Pk_a_a]=wavread('.\Sons\Pavelski_a_aberto.wav')

//E aberto
[y_C_e_a]=wavread('.\Sons\Caique_e_aberto.wav')
[y_He_e_a]=wavread('.\Sons\Heitor_e_aberto.wav')
[y_Pi_e_a]=wavread('.\Sons\Paiva_eaberto.wav')

//I aberto
[y_C_i]=wavread('.\Sons\Caique_i_aberto.wav')
[y_He_i]=wavread('.\Sons\Heitor_i_aberto.wav')
[y_Pi_i]=wavread('.\Sons\Paiva_i.wav')

//O aberto
[y_C_o_a]=wavread('.\Sons\Caique_o_aberto.wav')
[y_Ha_o_a]=wavread('.\Sons\Hatta_O_aberto.wav')
[y_He_o_a]=wavread('.\Sons\Heitor_o_aberto.wav')
[y_Pi_o_a]=wavread('.\Sons\Paiva_oaberto.wav')

x = 1:(size(y_C_o_a)(2))

scf(0)
plot2d((100000:120000)/rate,y_C_a_a(100000:120000),1)
plot2d((100000:120000)/rate,y_Ha_a_a(100000:120000),2)
plot2d((100000:120000)/rate,y_He_a_a(100000:120000),3)
plot2d((100000:120000)/rate,y_Pi_a_a(100000:120000),4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Resposta no tempo - A aberto'])

scf(1)
plot2d((100000:120000)/rate,y_C_e_a(100000:120000),1)
plot2d((100000:120000)/rate,y_He_e_a(100000:120000),3)
plot2d((100000:120000)/rate,y_Pi_e_a(100000:120000),4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Resposta no tempo - E aberto'])

scf(2)
plot2d((100000:120000)/rate,y_C_i(100000:120000),1)
plot2d((100000:120000)/rate,y_He_i(100000:120000),2)
plot2d((100000:120000)/rate,y_Pi_i(100000:120000),4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Resposta no tempo - I aberto'])

scf(3)
plot2d((100000:120000)/rate,y_C_o_a(100000:120000),1)
plot2d((100000:120000)/rate,y_Ha_o_a(100000:120000),2)
plot2d((100000:120000)/rate,y_He_o_a(100000:120000),3)
plot2d((100000:120000)/rate,y_Pi_o_a(100000:120000),4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Resposta no tempo - O aberto'])


//---------------- Espectros de Frequência dos Sinais ------------------

[U_C_aa, frequency_vector_C_aa, n_C_aa] = transformada(y_C_a_a,rate)
[U_C_ea, frequency_vector_C_ea, n_C_ea] = transformada(y_C_e_a,rate)
[U_C_ia, frequency_vector_C_ia, n_C_ia] = transformada(y_C_i,rate)
[U_C_oa, frequency_vector_C_oa, n_C_oa] = transformada(y_C_o_a,rate)

[U_Ha_aa, frequency_vector_Ha_aa, n_Ha_aa] = transformada(y_Ha_a_a,rate)
[U_Ha_oa, frequency_vector_Ha_oa, n_Ha_oa] = transformada(y_Ha_o_a,rate)

[U_He_aa, frequency_vector_He_aa, n_He_aa] = transformada(y_He_a_a,rate)
[U_He_ea, frequency_vector_He_ea, n_He_ea] = transformada(y_He_e_a,rate)
[U_He_ia, frequency_vector_He_ia, n_He_ia] = transformada(y_He_i,rate)
[U_He_oa, frequency_vector_He_oa, n_He_oa] = transformada(y_He_o_a,rate)

[U_Pi_aa, frequency_vector_Pi_aa, n_Pi_aa] = transformada(y_Pi_a_a,rate)
[U_Pi_ea, frequency_vector_Pi_ea, n_Pi_ea] = transformada(y_Pi_e_a,rate)
[U_Pi_ia, frequency_vector_Pi_ia, n_Pi_ia] = transformada(y_Pi_i,rate)
[U_Pi_oa, frequency_vector_Pi_oa, n_Pi_oa] = transformada(y_Pi_o_a,rate)

//[U_Pk_aa, frequency_vector_Pk_aa, n_Pk_aa] = transformada(y_Pk_a_a,rate)

scf(4)
plot2d(frequency_vector_C_aa(1:5000),abs(U_C_aa(1:5000)),1)
plot2d(frequency_vector_Ha_aa(1:5000),abs(U_Ha_aa(1:5000)),2)
plot2d(frequency_vector_He_aa(1:5000),abs(U_He_aa(1:5000)),3)
plot2d(frequency_vector_Pi_aa(1:5000),abs(U_Pi_aa(1:5000)),4)
//plot2d(frequency_vector_Pk_aa,abs(U_Pk_aa(1:n_Pk_aa)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva';'Pavelski'])
title(['Espectro de frequência - A aberto'])

scf(5)
plot2d(frequency_vector_C_ea(1:5000),abs(U_C_ea(1:5000)),1)
plot2d(frequency_vector_He_ea(1:5000),abs(U_He_ea(1:5000)),3)
plot2d(frequency_vector_Pi_ea(1:5000),abs(U_Pi_ea(1:5000)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - E aberto'])

scf(6)
plot2d(frequency_vector_C_ia(1:5000),abs(U_C_ia(1:5000)),1)
plot2d(frequency_vector_He_ia(1:5000),abs(U_He_ia(1:5000)),3)
plot2d(frequency_vector_Pi_ia(1:5000),abs(U_Pi_ia(1:5000)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Espectro de frequência - I aberto'])

scf(7)
plot2d(frequency_vector_C_oa(1:5000),abs(U_C_oa(1:5000)),1)
plot2d(frequency_vector_Ha_oa(1:5000),abs(U_Ha_oa(1:5000)),2)
plot2d(frequency_vector_He_oa(1:5000),abs(U_He_oa(1:5000)),3)
plot2d(frequency_vector_Pi_oa(1:5000),abs(U_Pi_oa(1:5000)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - O aberto'])

//Dados dos sons fechados
//-------------------- Sinais em Função do Tempo -----------------------

//A fechado
[y_C_a_f,Fs_C_a_f,bits_C_a_f]=wavread('.\Sons\Caique_a_fechado.wav')
[y_He_a_f,Fs_He_a_f,bits_He_a_f]=wavread('.\Sons\Heitor_a_fechado.wav')
[y_Pi_a_f,Fs_Pi_a_f,bits_Pi_a_f]=wavread('.\Sons\Paiva_afechado.wav')
//[y_Pk_a_f,Fs_Pk_a_f,bits_Pk_a_f]=wavread('.\Sons\Pavelski_a_fechado.wav')

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

scf(8)
plot2d((100000:120000)/rate,y_C_a_f(100000:120000),1)
plot2d((100000:120000)/rate,y_He_a_f(100000:120000),3)
plot2d((100000:120000)/rate,y_Pi_a_f(100000:120000),4)
//plot(y_Pk_a_f,x,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva'])
title(['Resposta no tempo - A fechado'])

scf(9)
plot2d((100000:120000)/rate,y_C_e_f(100000:120000),1)
plot2d((100000:120000)/rate,y_Ha_e_f(100000:120000),2)
plot2d((100000:120000)/rate,y_He_e_f(100000:120000),3)
plot2d((100000:120000)/rate,y_Pi_e_f(100000:120000),4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Resposta no tempo - E fechado'])

scf(10)
plot2d((100000:120000)/rate,y_C_o_f(100000:120000),1)
plot2d((100000:120000)/rate,y_Ha_o_f(100000:120000),2)
plot2d((100000:120000)/rate,y_He_o_f(100000:120000),3)
plot2d((100000:120000)/rate,y_Pi_o_f(100000:120000),4)
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

scf(11)
plot2d(frequency_vector_C_af(1:5000),abs(U_C_af(1:5000)),1)
plot2d(frequency_vector_He_af(1:5000),abs(U_He_af(1:5000)),3)
plot2d(frequency_vector_Pi_af(1:5000),abs(U_Pi_af(1:5000)),4)
//plot2d(frequency_vector_Pk_af,abs(U_Pk_af(1:n_Pk_af)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Heitor';'Paiva';'Pavelski'])
title(['Espectro de frequência - A fechado'])

scf(12)
plot2d(frequency_vector_C_ef(1:5000),abs(U_C_ef(1:5000)),1)
plot2d(frequency_vector_Ha_ef(1:5000),abs(U_Ha_ef(1:5000)),2)
plot2d(frequency_vector_He_ef(1:5000),abs(U_He_ef(1:5000)),3)
plot2d(frequency_vector_Pi_ef(1:5000),abs(U_Pi_ef(1:5000)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - E fechado'])

scf(13)
plot2d(frequency_vector_C_of(1:5000),abs(U_C_of(1:5000)),1)
plot2d(frequency_vector_Ha_of(1:5000),abs(U_Ha_of(1:5000)),2)
plot2d(frequency_vector_He_of(1:5000),abs(U_He_of(1:5000)),3)
plot2d(frequency_vector_Pi_of(1:5000),abs(U_Pi_of(1:5000)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['Caique';'Hattori';'Heitor';'Paiva'])
title(['Espectro de frequência - O fechado'])

scf(14)
plot2d(frequency_vector_C_aa(1:5000),abs(U_C_aa(1:5000)),1)
plot2d(frequency_vector_C_af(1:5000),abs(U_C_af(1:5000)),2)
plot2d(frequency_vector_C_ea(1:5000),abs(U_C_ea(1:5000)),3)
plot2d(frequency_vector_C_ef(1:5000),abs(U_C_ef(1:5000)),4)
plot2d(frequency_vector_C_ia(1:5000),abs(U_C_ia(1:5000)),5)
plot2d(frequency_vector_C_oa(1:5000),abs(U_C_oa(1:5000)),6)
plot2d(frequency_vector_C_of(1:5000),abs(U_C_of(1:5000)),7)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['A aberto';'A fechado';'E aberto';'E fechado';'I aberto';'O aberto';'O fechado'])
title(['Espectros de frequência - Sons do Caique'])

scf(15)
plot2d(frequency_vector_He_aa(1:5000),abs(U_He_aa(1:5000)),1)
plot2d(frequency_vector_He_af(1:5000),abs(U_He_af(1:5000)),2)
plot2d(frequency_vector_He_ea(1:5000),abs(U_He_ea(1:5000)),3)
plot2d(frequency_vector_He_ef(1:5000),abs(U_He_ef(1:5000)),4)
plot2d(frequency_vector_He_ia(1:5000),abs(U_He_ia(1:5000)),5)
plot2d(frequency_vector_He_oa(1:5000),abs(U_He_oa(1:5000)),6)
plot2d(frequency_vector_He_of(1:5000),abs(U_He_of(1:5000)),7)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
legend(['A aberto';'A fechado';'E aberto';'E fechado';'I aberto';'O aberto';'O fechado'])
title(['Espectros de frequência - Sons do Heitor'])


