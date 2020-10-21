//Carrega a biblioteca do sensor ultrassonico
#include <Ultrasonic.h>
 
//Define os pinos para o trigger e echo
#define pino_trigger 4
#define pino_echo 5

//Definicoes pinos Arduino ligados a entrada da Ponte H
int IN1 = 8;
int IN2 = 9;
int ENA = 10;
int MotorSpeed=3*255/4;
int i = 0;
float sine;

//Inicializa o sensor nos pinos definidos acima
Ultrasonic ultrasonic(pino_trigger, pino_echo);

void setup() {
  
  Serial.begin(9600);
  
  //Define os pinos como saida
  pinMode(IN1,OUTPUT);
  pinMode(IN2,OUTPUT);

  //Método 1 --> comentar para método 2
  digitalWrite(IN1,HIGH);
  digitalWrite(IN2,LOW);
  
  Serial.println("Lendo dados do sensor...");
}

void loop() {
  while(i<=300)
  //Definição da velocidade do motor --> Método 1
  sine = sin(i*(3.1415/180.0));
  MotorSpeed = 3*255/4+int(sine*255.0/4.0);
  analogWrite(ENA, MotorSpeed);

  //Definição da velocidade do motor --> Método 2
  //sine = sin(i*(3.1415/180.0));
  //MotorSpeed = 3*255/4+int(sine*255.0/4.0);
  //analogWrite(IN1, MotorSpeed);
  //digitalWrite(IN2, LOW);
   
  //Le as informacoes do sensor, em cm e pol
  float cmMsec; // , inMsec; --> tirar comentário para adicionar medida em Polegadas
  long microsec = ultrasonic.timing();
  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  //inMsec = ultrasonic.convert(microsec, Ultrasonic::IN); --> tirar comentário para adicionar medida em Polegadas
  //Exibe informacoes no serial monitor
  Serial.print("Distancia em cm: ");
  Serial.print(cmMsec);
  //Serial.print(" - Distancia em polegadas: "); --> tirar comentário para adicionar medida em Polegadas
  //Serial.println(inMsec); --> tirar comentário para adicionar medida em Polegadas
  
  /*
  delay(1000);
  // Mostra informações no monitor ou plotter serial
  Serial.print(y); // y é o nome de uma das variáveis que se deseja apresentar
  Serial.print(",");
  Serial.println(yf); // yf é o nome de outra variável que se deseja apresentar
  // Observe o “ln” no final, indicando que se passa para outra linha. Pode-se jogar na saída serial mais variáveis, se necessário.
  
  */

  i+=1;
  
  delay(50);
  
}
