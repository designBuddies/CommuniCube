
//Knappe Lyttere
int BUTTON1 = 3;
int BUTTON2 = 4;
int BUTTON3 = 6;
int BUTTON4 = 8;
int LEDPIN = 13;

bool answerGiven = false;

String user = "unik_ID"; // Set en unik ID for hver Arduino


void setup(){
  Serial.begin(9600);
  //Setter pinmode for knapper og LED
  pinMode(BUTTON1, INPUT);
  pinMode(BUTTON2, INPUT);
  pinMode(BUTTON3, INPUT);
  pinMode(BUTTON4, INPUT);
  pinMode(LEDPIN, OUTPUT);
  digitalWrite(LEDPIN, LOW);
}

void loop()
{
  // Koden kjorer kun om svar ikke er gitt.
  if(!answerGiven){
    //LED lyser for aa vise at svar ikke er avgitt
    digitalWrite(LEDPIN, HIGH);
    //En "if" blir trigget om en knapp blir trykket
    if(digitalRead(BUTTON1) == HIGH){
      sendValg(1);
    }
    else if(digitalRead(BUTTON2) == HIGH){
      sendValg(2);
    }
    else if(digitalRead(BUTTON3) == HIGH){
     sendValg(3);
    }
    else if(digitalRead(BUTTON4) == HIGH){
    sendValg(4);
    }
  }
}
/**
 * Metode som sender hvilken knapp som har blitt
 *
 *
 */
void sendValg(int valg){
  Serial.println(user + "," + valg);
  delay(200);
  answerGiven = true;
  lysAv();
}
//Metode som skrir av LED
void lysAv(){
  digitalWrite(LEDPIN, LOW);
}
