//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 7
//Atividade 7

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

function transformada(sinal,rate) 
//Plota o espectro de frequência para um certo sinal dada a frequência de amostragem
    sinal = detrend(sinal)
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    scf()
    plot2d(frequency_vector,abs(U(1:n)),2)
    xtitle('Espectro de Frequências')
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

//------------------ ANÁLISE DOS SINAIS OBTIDOS --------------------
rate1 = 1/0.05 //Hz (frequência de Amostragem)

//aux=read('.\EntregaCodigos&Dados\cte_103_5_w=2.txt',-1,5)
//KP=1 KI=1 KD=1 - Referência: 30cm
aux=read('.\EntregaCodigos&Dados\1,1,1.txt',-1,3)
posicao1=aux(:,2)
t1 = 0:1/rate1:(length(posicao1)-1)/rate1

//KP=1 KI=1.4 KD=0.6 - Referência: 30cm
aux=read('.\EntregaCodigos&Dados\muito_bom_1,1_4,0_6__30cm.txt',-1,4)
posicao2=aux(:,4)
t2 = 0:1/rate1:(length(posicao2)-1)/rate1

//KP=1 KI=1.4 KD=0.6 - Referência: 20cm
aux=read('.\EntregaCodigos&Dados\muito_bom_20cm.txt',-1,4)
posicao3=aux(:,4)
t3 = 0:1/rate1:(length(posicao3)-1)/rate1

//KP=1 KI=1.4 KD=0.6 - Referência: 40cm
aux=read('.\EntregaCodigos&Dados\muito_bom_40cm.txt',-1,4)
posicao4=aux(:,4)
t4 = 0:1/rate1:(length(posicao4)-1)/rate1

//KP=5 KI=1.5 KD=1 - Referência: 30cm
aux=read('.\EntregaCodigos&Dados\excelente_30cm.txt',-1,4)
posicao5=aux(:,4)
t5 = 0:1/rate1:(length(posicao5)-1)/rate1

//KP=5 KI=1.5 KD=1 - Referência: 20cm
aux=read('.\EntregaCodigos&Dados\excelente_20cm.txt',-1,4)
posicao6=aux(:,4)
t6 = 0:1/rate1:(length(posicao6)-1)/rate1

//KP=5 KI=1.5 KD=1 - Referência: 40cm
aux=read('.\EntregaCodigos&Dados\excelente_5,1_5,1__40cm.txt',-1,4)
posicao7=aux(:,4)
t7 = 0:1/rate1:(length(posicao7)-1)/rate1

//------------------------ AVALIAÇÃO GRÁFICA -------------------------
scf()
plot2d(t1,posicao1)
xtitle("Sinal amostrado - KP=1 KI=1 KD=1 - Referência: 30cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

scf()
subplot(221)
plot2d(t2,posicao2)
xtitle("Sinal amostrado - KP=1 KI=1.4 KD=0.6 - Referência: 30cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(222)
plot2d(t3,posicao3)
xtitle("Sinal amostrado - KP=1 KI=1.4 KD=0.6 - Referência: 20cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(223)
plot2d(t4,posicao4)
xtitle("Sinal amostrado - KP=1 KI=1.4 KD=0.6 - Referência: 40cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

scf()
subplot(221)
plot2d(t5,posicao5)
xtitle("Sinal amostrado - KP=5 KI=1.5 KD=1 - Referência: 30cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(222)
plot2d(t6,posicao6)
xtitle("Sinal amostrado - KP=5 KI=1.5 KD=1 - Referência: 20cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(223)
plot2d(t7,posicao7)
xtitle("Sinal amostrado - KP=5 KI=1.5 KD=1 - Referência: 40cm")
xlabel("Tempo (s)")
ylabel("Posição (cm)")


transformada(posicao1,rate1)
transformada(posicao2,rate1)
transformada(posicao3,rate1)
transformada(posicao4,rate1)
transformada(posicao5,rate1)
transformada(posicao6,rate1)
transformada(posicao7,rate1)

/*
//============================= RELATÓRIO ==============================

//----------------------------  Descrição do Experimento -----------------------------
O experimento da presente tarefa consistiu no controle da oscilação de
uma pequena esfera de isopor no interior de um tubo pelo método de controle PID, 
mediante acionamento de um ventilador, controlado com uso de um Arduino UNO. 
Para tanto, foi utilizada da bancada de experimentação remota desenvolvida pelo 
professor da disciplina, a qual permitia que os alunos controlassem à distância os
equipamentos necessários. Foi, portanto, desenvolvido um código arduino 
e utilizado os softwares AnyDesk (para controle remoto do PC do professor)
e o Processing, para captação dos dados obtidos em tempo real.

Além dos espectros de frequência, foram também plotadas as curvas de posição
pelo tempo do sinal capturado, pois inferiu-se que suas análises eram, também,
pertinentes e necessárias.

//------------------------------ Resultados ----------------------------

Com o acesso à bancada e com o código rodando sem erros, o grupo testou
a primeira combinação de ganhos PID 1.0, 1.0 e 1.0, respectivamente.
Os resultados podem ser vistos na Janela 0. Nota-se que, com esses
ganhos, o Arduino não foi capaz de manter a bolinha de forma adequada
na posição de referência 30 cm. Esperava-se com esses valores que o
sistema conseguisse controlar a bolinha de forma razoável. 

Investigando os dados obtidos na aquisição, o grupo percebeu que havia
um erro em relação à referência de posição utilizada pelo grupo. A posição
zero, ou seja, quando o sensor retorna ao sistema a posição mais próxima
de zero, é quando a bolinha está na parte superior do tubo. Assim, o
erro obtido (referência de posição - posição real) é invertida.

Dessa forma, após consertado o erro na referência de posição, o grupo
conseguiu diversas corridas experimentais com resultados expressivos.
Através da adaptação do vetor de ganhos (explícitos ao longo do código,
acima do nome dos arquivos dentro da função read) e do valor de posição
de referência, foi possível realizar o controle da esfera de forma
satisfatória, e acima das expectativas iniciais. Os espectros de
frequência podem ser vistos nas Janelas 4 a 9, e curvas de posição
pelo tempo podem ser vistos nas Janelas 1 e 2.

Um resultado interessante notado com a representação gráfica dos sinais
amostrados é de que, com a aplicação dos ganhos KP = 5, KI = 1,5 e KD = 1,
houve uma melhora significativa do overshoot. O resultado era esperado,
uma vez que o ajuste no KD leva a uma melhoria no regime transiente.
Nos três casos, foi observado que, para esses ganhos, o overshoot é
praticamente nulo, diferentemente dos casos para os ganhos anteriores
(com KD = 0,6), com os quais as respostas tiveram de até 20%. Assim,
o ganho KD deve ser, de fato, mais próximo de 1 para reduzir o overshoot
da resposta.

//-----------Utilização de filtro durante a experiência 7-------------

O filtro desenvolvido pela equipe na experiência anterior foi refeito
para que tivesse uma melhor atuação durante a execução do programa no
Arduino. Vale ressaltar que o filtro anteriormente utilizado não fora
eficaz em filtrar sinais de frequências mais elevadas, por isso a
proposta de modificá-lo. Assim, a equipe inicialmente utilizou o filtro
acoplado ao sistema de controle para achar os ganhos PID. Porém, notou-se
que o código teve um acréscimo considerável no tempo de amostragem em
relação aos experimentos anteriores. (cerca de 0,1s, contra 0,03s).
Com isso, o grupo decidiu testar o código do controlador sem o filtro,
o que resultou numa taxa de amostragem melhor de cerca de 0,05s.
Portanto, a equipe decidiu fazer o controle da bolinha sem a utilização
do filtro desenvolvido para se ter uma melhor taxa de amostragem.
Notou-se, por fim, que a não inclusão do filtro não prejudicou a
performance do controlador de forma significativa.
/*
