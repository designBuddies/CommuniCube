
int BUTTON1 = 3;
int BUTTON2 = 4;
int BUTTON3 = 6;
int BUTTON4 = 8;
int LEDPIN = 13;
bool answerGiven = false;
String user = "Finn";
void setup(){
  Serial.begin(9600);

  pinMode(BUTTON1, INPUT);
  pinMode(BUTTON2, INPUT);
  pinMode(BUTTON3, INPUT);
  pinMode(BUTTON4, INPUT);
  pinMode(LEDPIN, OUTPUT);
  digitalWrite(LEDPIN, LOW);
}

void loop()
{
  if(!answerGiven){
    digitalWrite(LEDPIN, HIGH);
      if(digitalRead(BUTTON1) == HIGH){
     // digitalWrite(LED1, HIGH);
      Serial.println(user + ",1");
      delay(200);
      answerGiven = true;
      lysAv();
    }
    else if(digitalRead(BUTTON2) == HIGH){
     // digitalWrite(LED2, HIGH);
      Serial.println(user + ",2");
      delay(200);
      answerGiven = true;
      lysAv();
    }
    else if(digitalRead(BUTTON3) == HIGH){
     // digitalWrite(LED3, HIGH);
      Serial.println(user + ",3");
      delay(200);
      answerGiven = true;
      lysAv();
    }
    else if(digitalRead(BUTTON4) == HIGH){
     // digitalWrite(LED4, HIGH);
      Serial.println(user + ",4");
      delay(200);
      answerGiven = true;
      lysAv();
    }
  else{
    //digitalWrite(LEDPIN, LOW);
    //Serial.println("200");
   }
  }
}
void lysAv(){
  digitalWrite(LEDPIN, LOW);
  }

