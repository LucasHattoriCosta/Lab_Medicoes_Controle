//Carrega a biblioteca do sensor ultrassonico
#include <Ultrasonic.h>
 
//Define os pinos para o trigger e echo
#define pino_trigger 4
#define pino_echo 5

//Definicoes pinos Arduino ligados a entrada da Ponte H
int IN1 = 8;
int IN2 = 9;
int ENA = 10;
int MotorSpeed=103.5;
int i = 0;
float sine;
float tempo;
float tempo_anterior;
float pos_atual;
float vel_atual=103.5;
float vel_anterior;
float vel_anterior_anterior;
float freq;
int w = 2;
float T = 0.03;
float e_atual;
float e_anterior;
float e_anterior_anterior;
float KP = 1;
float KI = 1.4;
float KD = 0.6;

//Inicializa o sensor nos pinos definidos acima
Ultrasonic ultrasonic(pino_trigger, pino_echo);

void setup() {
  
  Serial.begin(9600);
  
  //Define os pinos como saida
  pinMode(IN1,OUTPUT);
  pinMode(IN2,OUTPUT);
  pinMode(ENA,OUTPUT);

  //Método 1 --> comentar para método 2
  digitalWrite(IN1,LOW);
  digitalWrite(IN2,HIGH);
  analogWrite(ENA,MotorSpeed);
  
}

void loop() {

  //Definição da velocidade senoidal
  //sine = sin((2*int(i/10)+1)*(3.1415/2));
  //MotorSpeed = 102.5+int(sine*20);
  //analogWrite(ENA, MotorSpeed);
    
  //Le as informacoes do sensor, em cm e pol
  long microsec = ultrasonic.timing();
  pos_atual = ultrasonic.convert(microsec, Ultrasonic::CM);

  if (i==0){
    vel_anterior_anterior = 0;
    vel_anterior = 0;
    e_anterior_anterior = 0;
    e_anterior = 0;
  }


  if (i>0){
    e_atual = 30-pos_atual;
    vel_atual = vel_anterior_anterior+(KP+(T/2)*KI+(2/T)*KD)*e_atual+(T*KI+(-4/T)*KD)*e_anterior+(-KP+(T/2)*KI+(2/T)*KD)*e_anterior_anterior;
  
    vel_anterior_anterior = vel_anterior;
    vel_anterior = vel_atual;
    e_anterior_anterior = e_anterior;
    e_anterior = e_atual;
  }

/*
  //Coleta o primeiro valor:
  if (i==0){
      sinal_atual = cmMsec;
      sinal_filtrado_atual = cmMsec;
      tempo = millis();
  }

  if (i>0){
      tempo_anterior = tempo;
      tempo = millis();
      freq = 1/(tempo-tempo_anterior);
      sinal_anterior = sinal_atual;
      sinal_atual = cmMsec;
      
      //Implementa o filtro passa baixo trapexoidal para sim dado sinal, 
      //uma frequência de corte (w) e a frequência de amostragem
      T = 1/freq;
      //for k = 2:length(sinal)
      sinal_filtrado_atual = ((1-(w*T/2))/(1+(w*T/2)))*sinal_filtrado_atual+((w*T/2)/(1+(w*T/2)))*(sinal_anterior+sinal_atual);
      //end
  }
*/

  //Exibe informacoes no serial monitor
  //Serial.print("Velocidade do motor (0 a 255): ");
  Serial.print(vel_atual);
  Serial.print(",");
  Serial.print(vel_anterior);
  Serial.print(",");
  Serial.print(vel_anterior_anterior);
  Serial.print(",");
  //Serial.print("Distancia (cm): ");
  Serial.print(pos_atual);
  Serial.print(",");
  Serial.print(e_atual);
  Serial.print(",");
  Serial.print(e_anterior);
  Serial.print(",");
  Serial.println(e_anterior_anterior); 
  //Serial.print("Instante (s): ");
  //Serial.println(tempo);

  //Definição da velocidade constante
  analogWrite(ENA, vel_atual);


  i+=1;
  
  delay(5);
  
}
