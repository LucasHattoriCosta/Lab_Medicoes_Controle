// Use este programa como ponto de partida.
// A Tarefa 0 já está pronta, e a Tarefa 1 iniciada.

// Obs.: esse programa foi escrito para o Scilab 5.5.2.
// Adaptações podem ser necessárias se este programa for usado no Scilab 6.1.

// Importante: os gráficos devem estar em sua própria janela, evitando
// que a próxima figura se sobreponha à figura anterior, exceto se for esse
// o objetivo, no caso de se querer fazer comparações dos resultados.


// Tarefa 0
clear;clf;
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

function tarefa_1(T)
    // Tarefa 1
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
    nMD=coeff(numer(GmotorD));
    dMD=coeff(denom(GmotorD));
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
        e(k) = 1-ym(k-1);
        
        um(k) = um(k-2)+(KP+(T/2)*KI+(2/T)*KD)*e(k)+(T*KI+(-4/T)*KD)*e(k-1)+(-KP+(T/2)*KI+(2/T)*KD)*e(k-2);
        
        ym(k) = -dMD(1)*ym(k-2)-dMD(2)*ym(k-1)+nMD(1)*um(k-2)+nMD(2)*um(k-1);
    end
    
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

tarefa_1(0.01)
// Equações de diferenças:
// O restante do programa deve ser desenvolvido pelo grupo.
// É preciso escrever as equações de diferenças do motor e desenvolver
// e escrever as equações de diferenças do PID.
// IMPORTANTE: nas Tarefas 1 e 2 as simulações devem ser feitas por meio de
// equações de diferenças, não podem ser usadas funções “prontas” do Scilab para
// simulação de sistemas discretos.
