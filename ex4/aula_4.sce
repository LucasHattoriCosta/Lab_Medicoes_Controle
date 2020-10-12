//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Atividade 3

//Grupo 4 - Integrantes:
//Caique de Oliveira Kobayashi - 9793461
//Heitor Fontana de Godoy - 10335677
//Lucas Hattori Costa - 10335847
//Lucas Pinheiro Paiva Cavalcante - 10274270
//Pedro Henrique Pavelski - 10335621

// -------------------------------- TAREFA 0 -----------------------------------
clc
clear
xdel( winsid() )

// Parâmetros do motor de corrente contínua:
J=0.01;
b=0.1;
K=0.01;
L=0.5;
R=1;
// Modelo no espaço de estados:
A=[-b/J K/J;-K/L -R/L];
B=[0;1/L]
C=[1 0];
D=0;
motor=syslin('c',A,B,C,D);
// Função de transferência do motor:
Gmotor=ss2tf(motor);
// Compensador PID
KP=100;
KI=200;
KD=10;
s=poly(0,'s');
Gpid=syslin('c',KP+(KI/s)+KD*s);
// Conexão em série do compensador PID e do motor (malha aberta):
Gma=Gpid*Gmotor;
// Fechamento da malha (feedback), com feedback unitário:
Gfb=syslin('c',s/s); // feedback unitário
// Fechando a malha (Gmf é a função de transferência de malha fechada):
Gmf=Gma/.Gfb;
// Simulação para entrada degrau unitário:
DT=0.001;
Tf=10;
t=0:DT:(Tf-DT);
u=ones(t);
x0=[0;0;0];
y=csim(u,t,Gmf,x0);

scf()
plot2d(t,y);
xtitle('Saida controlada por PID: tempo contínuo – linha preta','t (s)','y(rad/s)');

// -------------------------------- TAREFA 1 -----------------------------------

//   A tarefa 1 foi implementada na forma de função tendo com entrada o 
// período de amostragem.

function tarefa_1(T)
    
    // Modelo em tempo discreto do motor de corrente contínua usando o
    // segurador de ordem zero (ZOH):
    // T == Período de amostragem
    //dscr obtém o modelo em tempo discreto de uma planta no espaço de estado
    // usando o ZOH.
    motorD=dscr(motor,T);
    // função de transferência do motor em tempo discreto (ZOH):
    GmotorD=ss2tf(motorD);
    // Simulando o sistema com compensador PID usando as equações de diferenças:
    // Equações de diferenças para o modelo em tempo discreto do motor de corrente
    // contínua:
    nMD=coeff(GmotorD.num);
    dMD=coeff(GmotorD.den);
    n=length(nMD);
    d=length(dMD);
    if d>n then
    p=d;
    else
    p=n;
    end
    // Condições iniciais - motor
    for i=1:(p-1)
    um(i)=0;
    ym(i)=0;
    e(i)=0;
    end
    
    for k = 3:(10/T)
        // erro = (R(k)-Y(k-1)). Como procura-se seguir um degrau => R = 1
        e(k) = 1-ym(k-1);
        
        // Equação de diferenças para PID feito através do método do trapézio
        um(k) = um(k-2)+(KP+(T/2)*KI+(2/T)*KD)*e(k)+(T*KI+(-4/T)*KD)*e(k-1)+(-KP+(T/2)*KI+(2/T)*KD)*e(k-2);
        
        // Equação de diferenças para o modelo em tempo discreto do motor de corrente ontínua:
        ym(k) = -dMD(1)*ym(k-2)-dMD(2)*ym(k-1)+nMD(1)*um(k-2)+nMD(2)*um(k-1);
    end
    
    // Cria o vetor de tempo correspondente ao período de amostragem:
    for i = 1:(10/T)
        t_discreto(i) = i*T
    end
    
    scf()
    title('Análise pelo método do Trapézio')
    subplot(211)
    plot2d(t,y);
    xtitle('Saida controlada por PID: tempo contínuo','t (s)','y(rad/s)');
    subplot(212)
    plot2d(t_discreto,ym)
    legenda = 'Saida controlada por PID: tempo discreto – Período de amostragem (T) = '+string(T)+' s'
    xtitle(legenda,'t (s)','y(rad/s)');
endfunction

// Período de amostragem = 0.25 s:
tarefa_1(0.25) //instável

// Período de amostragem = 0.10 s:
tarefa_1(0.10) //instável

// Período de amostragem = 0.05 s:
tarefa_1(0.05) //estável

// Período de amostragem = 0.01 s:
tarefa_1(0.01) //comportamento similar ao encontrado com o sistema no tempo contínuo


// Conclusões:
//  Como pudemos observar, obtivemos resultados significativamente
//diferentes com a variação da amostragem. Como de se esperar, com a
//diminuição do período de amostragem, temos que a discretização do
//sistema se aproxima cada vez mais do modelo contínuo, reduzindo
//erros de integração e derivação. Para o período de amostragem de
//0,25 s, temos que a resposta diverge muito após 9 segundos, atingindo
//marcas superiores a 3e12 aos 10 s. Com o período de amostragem de 0,1 s,
//temos que a resposta também diverge, chegando a valor inferior a
//-4e11 aos 10 segundos. Por fim, temos o resultado para a amostragem
//de período 0,05 s, a qual apresenta oscilação inicial, mas se estabiliza
//passados 4 segundos. Foi ainda realizado o teste com taxa de amostragem
//de período 0,1 s, o qual apresentou comportamento relativamente similar
//ao do sistema contínuo (o que se justifica pelo período consideravelmente baixo).


// -------------------------------- TAREFA 2 -----------------------------------

// A tarefa 2 foi implementada também na forma de função tendo com entrada o 
// período de amostragem.

function tarefa_2(T)
    
    // Modelo em tempo discreto do motor de corrente contínua usando o
    // segurador de ordem zero (ZOH):
    // T == Período de amostragem
    // dscr obtém o modelo em tempo discreto de uma planta no espaço de estado
    // usando o ZOH.
    motorD=dscr(motor,T);
    // função de transferência do motor em tempo discreto (ZOH):
    GmotorD=ss2tf(motorD);
    // Simulando o sistema com compensador PID usando as equações de diferenças:
    // Equações de diferenças para o modelo em tempo discreto do motor de corrente
    // contínua:
    nMD=coeff(GmotorD.num);
    dMD=coeff(GmotorD.den);
    n=length(nMD);
    d=length(dMD);
    if d>n then
    p=d;
    else
    p=n;
    end
    // Condições iniciais - motor
    for i=1:(p-1)
    um(i)=0;
    ym(i)=0;
    e(i)=0;
    end
    
    for k = 3:(10/T)
        // erro = (R(k)-Y(k-1)). Como procura-se seguir um degrau => R = 1
        e(k) = 1-ym(k-1);
        
        // Equação de diferenças para PID feito através do método do trapézio
        um(k) = um(k-1)+(KP+T*KI+(1/T)*KD)*e(k)-(KP+(2/T)*KD)*e(k-1)+(1/T)*KD*e(k-2);
        
        // Equação de diferenças para o modelo em tempo discreto do motor de corrente ontínua:
        ym(k) = -dMD(1)*ym(k-2)-dMD(2)*ym(k-1)+nMD(1)*um(k-2)+nMD(2)*um(k-1);
    end
    
    // Cria o vetor de tempo correspondente ao período de amostragem:
    for i = 1:(10/T)
        t_discreto(i) = i*T
    end
    
    scf()
    subplot(211)
    plot2d(t,y);
    xtitle('Saida controlada por PID: tempo contínuo','t (s)','y(rad/s)');
    subplot(212)
    plot2d(t_discreto,ym)
    legenda = 'Saida controlada por PID: tempo discreto – Período de amostragem (T) = '+string(T)+' s'
    xtitle(legenda,'t (s)','y(rad/s)');
endfunction

// Período de amostragem = 0.25 s:
tarefa_2(0.25) //instável

// Período de amostragem = 0.10 s:
tarefa_2(0.10) //instável

// Período de amostragem = 0.05 s:
tarefa_2(0.05) //instável

// Período de amostragem = 0.01 s:
tarefa_2(0.01) //comportamento similar ao encontrado com o sistema no tempo contínuo

// Conclusões:
//  Novamente, obtivemos resultados significativamente diferentes
//para os diferentes períodos de amostragem, havendo melhora do modelo 
//com sua redução. Como para o modelo anterior, com os período de
//amostragem de 0,25 s e 0,1 s, temos uma resposta que diverge muito
//após 9 segundos, atingindo módulo superior a 4e13 aos 10 s em ambos.
//Contudo, para o método "Para Trás", tivemos uma resposta que também
//diverge para período de 0,05 s. Isso se justifica pelo fato do método
//"Para Trás" apresentar comportamento ligeiramente menos preciso que
//o do trapézio, uma vez que trabalha com a derivada apenas do ponto atual
//e não o do ponto atual mais o do ponto anterior. Por fim, foi aplicado
//também o período de amostragem de 0,01 s, o qual apresentou
//comportamento similar ao do modelo contínuo, novamente devido ao seu
//baixo valor de período.

//OBS: Vale ressaltar que, como o trabalho deveria ser entregue
//100% pelo arquivo de scilab, não foi apresentado em código a
//dedução das equações feitas à mão. Seu resultado, contudo, é
//apresentado em código, seguindo a nomeação da variável "um(k)".
