//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Atividade 3

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
    U = fft(sinal)
    N = size(sinal,'*')
    frequency_vector = rate*(0:(N/2))/N; //associated frequency vector
    n = size(frequency_vector,'*')
    plot2d(frequency_vector(1:30000),abs(U(1:30000)),2)
    xlabel('Frequência (Hz)')
    ylabel('Amplitude')
endfunction

function sinal_filtrado = media_movel(sinal)
//Implementa o filtro de média móvel em relação ao valor atual e o 3 anteriores
    for k = 4:length(sinal)
        sinal_filtrado(k) = (sinal(k)+sinal(k-1)+sinal(k-2)+sinal(k-3))/4
    end
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

//tempo_anterior = tempo_atual
//tempo_atual = millis()
//sinal_filtrado_atual = ((1-(w*T/2))/(1+(w*T/2)))*sinal_filtrado_anterior+((w*T/2)/(1+(w*T/2)))*(sinal_anterior+sinal_atual)

function sinal_filtrado = passa_baixo_backward(sinal,w,rate)
//Implementa o filtro passa baixo trapexoidal para sim dado sinal, 
//uma frequência de corte (w) e a frequência de amostragem
    T = 1/rate
    sinal_filtrado(1) = sinal(1)
    for k = 2:length(sinal)
        sinal_filtrado(k) = (1/(1+w*T))*sinal_filtrado(k-1)+(1/(1+w*T))*T*w*sinal(k)
    end
endfunction

function sistema_de_filtro(nome_do_arquivo,w,rate,nome,tipo_de_filtro,plot_original)
    // nome_do_arquivo == localização do arquivo desejado
    // w == frequêcia de amostragem (se aplicável)
    // rate == frequência de amostragem
    // nome == identificação do sinal (ex: 'Piano - acorde com ruído agudo')
    // tipo de filtro:
        // tipo_de_filtro == 1 => média móvel
        // tipo_de_filtro == 2 => passa baixo trapezoidal
        // tipo_de_filtro == 3 => passa baixo backward
    
    sinal = wavread(nome_do_arquivo)  //carrega o arquivo
    
    //cria o vetor tempo compatível com o tamanho do sinal
    t = 0:1:length(sinal)-1
    t = t/rate
    
    if plot_original == 1 then
        //plot do sinal no tempo e seu espectro de frequência
        scf()
        subplot(211)
        transformada(sinal,rate)
        title([nome])
        subplot(212)
        plot(t,sinal)
    end
        
    
    //seleção do tipo de filtro:
    if tipo_de_filtro == 1 then
        nome_do_filtro = 'Média Móvel'
        sinal_filtrado = media_movel(sinal)
    elseif tipo_de_filtro == 2 then
        nome_do_filtro = 'Trapezoidal'
        sinal_filtrado = passa_baixo_trapezoidal(sinal,w,rate)
    elseif tipo_de_filtro == 3 then
        nome_do_filtro = 'Backwards'
        sinal_filtrado = passa_baixo_backward(sinal,w,rate)
    end
    
    //cria o vetor tempo compatível com o tamanho do sinal filtrado:
    t_filtrado = 0:1:length(sinal_filtrado)-1
    t_filtrado = t_filtrado/rate
    
    //plot do sinal filtrado no tempo e seu espectro de frequência
    scf()
    subplot(211)
    transformada(sinal_filtrado,rate)
    nome_filtrado = nome+' - filtrado - '+nome_do_filtro
    title([nome_filtrado])
    subplot(212)
    plot(t_filtrado,sinal_filtrado)
    // Salva o arquivo de áudio com o filtro
    savewave('.\gravações\Filtrados\'+nome+'_filtrado.wav',sinal_filtrado,rate)
endfunction

rate = 44100 //Hz (frequência de Amostragem)

//------------------ ANÁLISE DOS FILTROS APLICADOS --------------------
sistema_de_filtro('.\gravações\Violao_la_nota_v4.wav'  ,440,rate,'Violão - lá com ruído agudo'  ,1,1)
sistema_de_filtro('.\gravações\Violao_la_nota_v4.wav'  ,440,rate,'Violão - lá com ruído agudo'  ,2,0)
sistema_de_filtro('.\gravações\Violao_la_nota_v4.wav'  ,440,rate,'Violão - lá com ruído agudo'  ,3,0)

//----------------------------- PIANO ---------------------------------

sistema_de_filtro('.\gravações\Piano_acorde_ruido_agudo.wav',440,rate,'Piano - lá acorde com ruído agudo',2,1)
sistema_de_filtro('.\gravações\Piano_la_ruido_agudo.wav'    ,440,rate,'Piano - lá com ruído agudo'    ,2,1)


//----------------------------- VIOLÃO ---------------------------------

sistema_de_filtro('.\gravações\Violao_la_acorde_v2.wav',440,rate,'Violão - lá acorde com ruído agudo',2,1)
sistema_de_filtro('.\gravações\Violao_la_nota_v4.wav'  ,440,rate,'Violão - lá com ruído agudo'  ,2,1)


/*
//============================= RELATÓRIO ==============================

//----------------------------  Descrição do Experimento -----------------------------
Para o presente experimento, o grupo optou por medir gravações de notas musicais,
pelos seguintes fatores: são sinais cujas frequências de interesse são de fácil
identificação e são facilmente reproduzidos em diferentes situações. Foram, então,
utilizados dois instrumentos diferentes para avaliar possíveis variações devidas
à diferença de timbre nos espectros de potências obtidos, assim como foram aplicados
ruídos diferentes. 

Em ambos os instrumentos, foi tocada a nota “Lá”, a qual tem frequência esperada
de 440Hz. Além disso, foi tocado também o acorde de “Lá maior” (A maior), para
observar as diferenças nos espectros de potências gerados. Com o instrumento piano,
especificamente, foi gerado um ruído a partir do uso de notas muito mais agudas,
também do piano, cujas frequências esperadas eram de: 2794 Hz (Fá) com a nota Lá sozinha;
2490 Hz (Ré #) e 2960 Hz (Fá #). Por outro lado, o ruído gerado juntamente ao som do violão
obtido por meio de um gerador de ruídos controlado, com o qual gerou-se um ruído de 3000 Hz.

Além disso, para avaliação do filtro dos ruídos gerados, foram elaborados três tipos de
filtros diferentes: filtro por média móvel, filtro passa-baixa trapezoidal e filtro passa-baixa backward.

//----------------------------  Avaliação teórica -----------------------------
Dadas as diferenças claras de frequências entre as notas de interesse e os ruídos,
espera-se visualizar tais diferenças por meio dos espectros de potências. Além disso,
espera-se notar as frequências próximas das notas que compõem o acorde de “Lá maior”.
No piano: Lá (440 Hz), Dó # (554,4 Hz) e Mi (659,3 Hz) e no violão: Lá (220 Hz), Dó #
(277,2 Hz) e Mi (329,6 Hz).

Quanto aos filtros aplicados, temos primeiramente que o filtro de média móvel, o
qual busca amenizar oscilações no sinal predominante no tempo. Assim, este filtro
não se mostra tão eficiente em casos similares ao que utilizamos, onde o ruído
apresentado é prolongado (com duração similar ao do sinal desejado), de tal forma
que se espera um resultado em que o sinal filtrado seja similar ao sinal original.
Quanto aos sinais passa-baixa, espera-se que os ruídos de frequência elevada sejam
amenizados. Como o filtro trapezoidal utiliza a média das derivadas de dois pontos
distintos, espera-se que o resultado seja ligeiramente mais preciso que o filtro backwards.


//----------------------------  Resultados -----------------------------

//Análise dos filtros aplicados
Para esta análise, foi utilizado o sinal da nota “Lá” no violão com ruído agudo
gerado como descrito na seção inicial.

O sinal original, sem filtro, apresenta ruído bem definido na frequência de 3000Hz,
sendo este, apresentado com amplitude de aproximadamente 1000 no espectro de potência.
Aplicando os 3 filtros projetados, obtêm-se os espectros de potência apresentados
nas janelas 1, 2, 3. 

O primeiro filtro é o de média móvel e não foi eficaz para atenuar os ruídos nas
gravações, como esperado, de acordo com o apresentado anteriormente. Vale ressaltar
que tomamos um filtro com média móvel de 4 pontos, o que também compromete a eficácia do filtro.

Já os dois outros filtros apresentaram um desempenho positivo, sendo que ambos conseguiram
diminuir consideravelmente os ruídos de altas frequências para amplitudes próximas a zero,
como esperado para filtros do tipo passa-baixas. Como mencionado, esperava-se que o filtro
passa baixas trapezoidal apresentasse melhor desempenho e menos ruído. De fato, se compararmos
os gráficos, vê-se que o sinal filtrado por esse filtro apresenta amplitudes nas frequências de
ruído um pouco menores que as mesmas no sinal filtrado pelo filtro backwards (cerca de 10 de
amplitude de diferença).

No caso do estudo das notas do piano, os resultados foram exatamente análogos, porém com
ruídos em frequências diferentes. Os filtros também apresentaram mesmo comportamento,
havendo falha no uso do filtro de média móvel e sucesso nos filtros passa-baixa, com
desempenho levemente superior do trapezoidal.

// Violão 
//Análise do espectro de frequência
Com os gráficos gerados nas janelas 8 a 11, apresenta-se dois sinais produzidos
em um mesmo instrumento com ruído agudo. O primeiro, representado na forma original
na janela 8 e filtrado na janela 9, representa um acorde e, por isso, apresenta um
conjunto de frequências com amplitudes altas no espectro de potência, referentes às
frequências de aproximadamente 216 Hz, 277 Hz e 329 Hz. Após ser filtrado, o sinal
continua apresentando os sinais de frequências mais baixas que compõem o acorde, mas
ameniza fortemente os sinais nas frequências acima de 1000 Hz, que constituem ruídos.
Percebe-se também a presença de picos menores causados pelo fenômeno acústico de
ressonância, sendo, portanto, referentes aos múltiplos das frequências tocadas e
gerados pelo próprio instrumento. Já as janelas gráficas 10 e 11 apresentam o sinal
da nota sozinha, e, por isso, apresenta um pico acentuado na frequência de 440Hz,
também sendo possível verificar picos menores em 110 Hz, 220 Hz, 660 Hz e 880 Hz,
que também são a nota Lá, mas em oitavas diferentes, correspondendo ao fenômeno
de ressonância descrito anteriormente. Também apresenta um pico de ruído na frequência
de 3000Hz que foi suprimido pelo filtro. 


//Piano 
//Análise do espectro de frequência
Para o piano, por sua vez, apresentam-se sinais produzidos pelo acorde e a nota
sozinha com uso de ruído agudo, como mostrado nas janelas 4 a 7. Para o acorde,
observamos claramente no espectro de potências picos nas frequências de
aproximadamente 437 Hz, 550 Hz e 650 Hz, as quais correspondem às notas do acorde.
Da mesma forma, observamos picos de ressonância e picos nas frequências de aproximadamente
2500 Hz e 2950 Hz, correspondentes às notas agudas do ruído. Após ser filtrado,
contudo, o sinal novamente continua com os sinais de frequências baixas do acorde
e diminui os sinais nas frequências de ruído, sendo quase imperceptíveis as elevações
nas frequências do ruído, que possuem amplitude baixíssima. Já a janela 6 apresenta
o sinal da nota sozinha, e possui um pico na frequência bem próximo de 440 Hz, assim
como um em 2800 Hz, referente ao ruído, o qual é reduzido em cerca de 50 vezes no
sinal filtrado, apresentado na janela 7.


//----------------------------- Conclusão ------------------------------

A partir dos resultados obtidos no experimento descrito e apresentado acima, é
possível notar uma consistência grande nos diferentes ensaios com os resultados
esperados, validando o processo experimental. Dito isso, é interessante ressaltar
a surpresa provocada no grupo ao se verificar o alto grau de precisão e sensibilidade
do sensor no aparelho celular utilizado no experimento.

Os espectros de potências mostrados a partir das gravações denotam que as notas
tocadas de fato possuem as frequências previstas para os tons escolhidos, com leves
variações. Tais variações refletem certa desafinação do instrumento quanto à nota
esperada. Além disso, é validada a escolha da frequência de corte do filtro como 440 Hz.

Ao se escolher a frequência da nota tocada como frequência de corte do filtro, há
uma atenuação mínima das frequências provenientes do som desejado (no caso, o som
das notas musicais), e uma atenuação maior das frequências mais distantes. Isso é
perceptível principalmente no caso da filtragem do acorde tocado no piano, no qual
há uma atenuação dos picos de frequência distantes de 440 Hz, e uma atenuação mínima
nos picos de frequências respectivos às notas do acorde. Esse comportamento também
foi verificado nos outros casos. Isso se dá pois as outras notas do acorde têm
frequências muito próximas à frequência de corte, logo, não são expressivamente
atenuadas.

Além disso, foram obtidos resultados similares para as gravações de sons com a
nota Lá tocada individualmente e para as gravações respectivas do acorde, o que
reforça os resultados e conclusões anteriores, e foi um comportamento previsto,
dado que as frequências das notas do acorde são próximas à frequência escolhida
como frequência de corte.

Outro comportamento interessante percebido pelo grupo foi o de que os filtros atuaram
de forma bastante similar nos sinais gerados pelos dois instrumentos. Os sinais
provenientes do piano e do violão obtiveram resultados e comportamentos bastante
próximos. Por isso, denota-se que os filtros utilizados agem de acordo com as
frequências do sinal (que definem o tom e as notas tocadas), e não são expressivamente
influenciados por diferenças de timbre (que definem a distinção da origem do som, como
por exemplo, do instrumento).
*/

