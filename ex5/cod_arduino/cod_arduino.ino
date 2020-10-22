//Carrega a biblioteca do sensor ultrassonico
#include <Ultrasonic.h>
 
//Define os pinos para o trigger e echo
#define pino_trigger 4
#define pino_echo 5

//Definicoes pinos Arduino ligados a entrada da Ponte H
int IN1 = 8;
int IN2 = 9;
int ENA = 10;
int MotorSpeed=255/2.5;
int i = 0;
float sine;
float tempo;

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
  
  Serial.println("Lendo dados do sensor...");
}

void loop() {

  //Definição da velocidade do motor de 2 em 2
  sine = sin(2*int(i/100)*(3.1415/180.0));
  MotorSpeed = 255/2.5+int(sine*255.0/5.0);
  analogWrite(ENA, MotorSpeed);
    
  //Le as informacoes do sensor, em cm e pol
  float cmMsec;
  long microsec = ultrasonic.timing();
  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  tempo=millis();
  //Exibe informacoes no serial monitor
  //Serial.print("Distancia (cm): ");
  Serial.print(cmMsec);
  Serial.print(",");
  //Serial.print("Velocidade do motor (0 a 255): ");
  Serial.println(MotorSpeed);
  Serial.print(",");
  //Serial.print("Instante (s): ");
  Serial.println(tempo);

  i+=1;
  
  delay(5);
  
}
