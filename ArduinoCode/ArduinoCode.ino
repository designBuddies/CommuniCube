//Verdier til knappelyttere
int BUTTON1 = 3;
int BUTTON2 = 4;
int BUTTON3 = 6;
int BUTTON4 = 8;
int LEDPIN = 13;

bool answerGiven = false;

String user = "unik_ID"; // Sett en unik ID for hver Arduino

void setup(){
  //For å kunne sende data til Processing over USB
  Serial.begin(9600);
  //Setter pinmode for knapper og LED
  pinMode(BUTTON1, INPUT);
  pinMode(BUTTON2, INPUT);
  pinMode(BUTTON3, INPUT);
  pinMode(BUTTON4, INPUT);
  pinMode(LEDPIN, OUTPUT);
  digitalWrite(LEDPIN, LOW);
}
/**
 * Loop som kjorer på Arduino
 */
void loop(){
  // Koden kjorer kun om svar ikke er gitt.
  if(!answerGiven){
    //LED lyser for aa indikere at svar ikke er avgitt
    digitalWrite(LEDPIN, HIGH);
    //Leser hvilken krets som er sluttet, og sender det til Processing
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
 * Metode som sender valget til bruker til Processing
 * @param BUTTON som tilsvarer valget til bruker
 */
void sendValg(int valg){
  Serial.println(user + "," + valg);
  delay(200);
  answerGiven = true; //Viser at et valgt er tatt, for aa hindre lesing igjen
  digitalWrite(LEDPIN, LOW); //Skrur av LED for aa vise at noe er valgt
}
