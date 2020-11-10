//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 6
//Atividade 6

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

function sinal_filtrado = passa_baixo_trapezoidal(sinal,w,rate)
//Implementa o filtro passa baixo trapexoidal para sim dado sinal, 
//uma frequência de corte (w) e a frequência de amostragem
    T = 1/rate
    sinal_filtrado(1) = sinal(1)
    for k = 2:length(sinal)
        sinal_filtrado(k) = ((1-(w*T/2))/(1+(w*T/2)))*sinal_filtrado(k-1)+((w*T/2)/(1+(w*T/2)))*(sinal(k-1)+sinal(k))
    end
endfunction

function sinal_filtrado = media_movel(sinal)
//Implementa o filtro de média móvel em relação ao valor atual e o 3 anteriores
    for k = 4:length(sinal)
        sinal_filtrado(k) = (sinal(k)+sinal(k-1)+sinal(k-2)+sinal(k-3))/4
    end
endfunction

//------------------ ANÁLISE DOS SINAIS OBTIDOS --------------------
aux=read('.\EntregaCodigos&Dados\cte_103_5_w=2.txt',-1,5)
n_filtrada=aux(:,2)
filtrada=aux(:,3)
rate = 1/0.03 //Hz (frequência de Amostragem)
t1 = 0:1/rate:(length(filtrada)-1)/rate

//------------------ ANÁLISE DA APLICAÇÃO DE FILTROS------------------
filtrado_trap=passa_baixo_trapezoidal(n_filtrada,2,rate)
filtrado_med=media_movel(n_filtrada)

//------------------------ AVALIAÇÃO GRÁFICA -------------------------

scf()
subplot(221)
plot2d(t1,n_filtrada)
xtitle("Sinal amostrado - Saída não filtrada à velocidade constante")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(222)
plot2d(t1,filtrada)
xtitle("Sinal amostrado - Saída filtrada à velocidade constante")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(223)
plot2d(t1,filtrado_trap)
xtitle("Sinal amostrado - Saída com filtro trapezoidal à velocidade constante")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

subplot(224)
plot2d(t1,filtrado_med)
xtitle("Sinal amostrado - Saída com média móvel à velocidade constante")
xlabel("Tempo (s)")
ylabel("Posição (cm)")

transformada(n_filtrada,rate)
transformada(filtrada,rate)
transformada(filtrado_trap,rate)
transformada(filtrado_med,rate)

/*
//============================= RELATÓRIO ==============================

//----------------------------  Descrição do Experimento -----------------------------
O experimento da presente tarefa consistiu novamente da avaliação da
oscilação de uma pequena esfera de isopor no interior de um tubo, mediante
acionamento de um ventilador, controlado com uso de um Aruino UNO. Para tanto, foi
utilizada da bancada de experimentação remota desenvolvida pelo professor
da disciplina, a qual permitia que os alunos controlassem à distância os
equipamentos necessários. Foi, portanto, desenvolvido um código arduino 
e utilizado os softwares AnyDesk (para controle remoto do PC do professor)
e o Processing, para captação dos dados obtidos em tempo real.

Durante a experimentação, ainda foi verificada uma dificuldade no controle
efetivo da esfera. A proposta inicial era de aplicação de uma variação
senoidal para a velocidade do ventilador, com o intuito de haver
uma variação na posição da esfera. Entretanto, verificou-se um comportamento
fortemente não linear na relação da velocidade do ventilador e a altura
da esfera, tal como uma altíssima instabilidade da posição da esfera até
mesmo para velocidades constantes.

Assim, optou-se por realizar a coleta de dados com a aplicação de uma
velocidade constante do ventilador. Esta velocidade foi estabelecida como
de 103.5, em uma escala de 0 a 255 (onde 0 é a mínima e 255 a máxima
velocidade alcançada pelo ventilador). Mesmo com velocidade constante,
foi observada uma leve oscilação, a qual pretende-se minimizar com a
aplicação de filtros.

Para realização dos filtros, foram empregadas três técnicas diferentes.
A primeira aplicação foi um filtro passa baixas trapezoidal implementado
no próprio código de Arduino, no qual, a cada iteração, é implementado
um filtro com uma taxa de amostragem variável (calculada por meio do
tempo gasto entre a iteração atual e a anterior). A segunda e a
terceira utilizam os dados não filtrados obtidos do experimento e
código no próprio Scilab, mantendo a taxa de amostragem constante igual
à 33.33 Hz. A segunda utiliza de um filtro passa baixas trapezoidal e
a terceira utiliza um filtro média móvel. Os seus resultados foram
apresentados e comparados.

Foram apresentados os espectros de frequência, assim como as curvas de posição
pelo tempo do sinal capturado.

//------------------------------ Resultados ----------------------------
Como visto no Exercício 05 anterior, encontrou-se dificuldade de realizar o 
controle da altura da bolinha a partir do controle dos estímulos do sistema.
Isso se deu, presumiu-se, pela natureza de baixa velocidade de resposta do 
sistema e instabilidade no fluxo de vento. Entretanto, é possível adiantar 
que, a partir da aplicação dos filtros na captação dos dados de estímulo 
constante, os resultados se mostraram muito mais sólidos e condizentes com 
o observado do que os vistos no Exercício 05. Como concluído no Exercício 
anterior, para reduzir o ganho em altas frequências e facilitar a distinção 
da frequência de interesse, foi projetado dois filtros, um trapezoidal passa
baixas e um de média móvel.

Os gráficos plotados pelo programa e dados em questão, em suas respectivas
janelas, são:
Janela 0: Sinais amostrados, com e sem filtragem
Janela 1: Espectro de frequência para o caso sem filtragem
Janela 2: Espectro de frequência para o filtro do arduino
Janela 3: Espectro de frequência para o filtro trapezoidal
Janela 4: Espectro de frequência para o filtro média móvel

A Janela 1 mostra o espectro de frequência do sinal obtido pelo Arduino sem 
a aplicação do filtro. Como já citado anteriormente, o sinal apresenta grandes 
amplitudes para baixas frequências e um ruído cuja média é por volta da amplitude 
100 para frequências acima de 2 Hz. Ao aplicar o filtro de média móvel pelo 
método trapezoidal diretamente no Arduino com uma frequência de corte de 2 Hz, 
obteve-se o sinal da Janela 2. Nota-se assim, que o filtro não foi eficiente para 
atenuar o ruído.

A Janela 3 mostra o sinal filtrado pelo programa desenvolvido no SciLab. É 
possível notar de prontidão que esse filtro é capaz de filtrar o sinal para 
frequências maiores que 2 Hz, desempenhando assim bem sua função de atenuar 
os ruídos do sinal.Esperava-se que o sinal da Janela 2 (filtro implementado 
no Arduino) fosse similar ao da Janela 3 (filtro no Scilab), porém se mostraram 
bem diferentes. De alguma forma, houve algum erro quando o filtro foi traduzido 
do SciLab para a linguagem do Arduino. Por fim, o sinal obtido através do filtro 
implementado no SciLab mostra que é possível se obter no arduino um filtro 
eficiente que atenua ruídos.

Um dos filtros digitais implementados foi o filtro de média móvel, tal qual 
foi desenvolvido pelo grupo para a Tarefa 3. Na Janela 0, estão representadas 
as saídas filtradas. No quadrante inferior direito, pode-se ver o impacto do 
filtro de média móvel, que atenua os valores “outliers”, que são muito mais 
altos que os demais. Assim, o formato da saída é mais constante, o que é 
condizente com a interpretação física do experimento. Ainda, na Janela 4, 
vê-se o espectro de frequência do sinal com tal filtro. Novamente, por atenuar 
os valores “outliers”, vê-se que a amplitude do sinal em frequências mais altas 
também foi atenuada se comparada com o sinal original ou ainda com o sinal 
obtido pelo Arduino. Apesar disso, em comparação com o sinal obtido pelo 
filtro trapezoidal, apresenta amplitudes mais altas nas frequências maiores 
que 1 Hz, de forma que o trapezoidal pode ser considerado um filtro mais 
adequado ao experimento.

Em ambos os casos, a redução do ruído presente no sinal original favorece 
a realização da FFT, na medida em que o aproxima do sinal constante 
esperado, embora ainda apresentem uma notória linha de tendência não horizontal, 
mas que pode ser bastante atenuada pela função detrend(), já apresentada no 
exercício anterior. Com isso, pode-se de fato verificar a distinção pretendida 
relativa à baixa frequência de interesse em relação ao seu entorno, conforme 
observado nas Janelas 3 e 4 em comparação ao sinal original da Janela 1, à 
medida em que a frequência vai aumentando.
*/

