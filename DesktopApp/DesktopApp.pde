/**
 * Dette programmet vil kun kjore om det er koblet til 4 baser som kjører ArduinoCode til
 * serialportene som koden spesifiserer. (COM5, COM6, COM7, COM9)
 *
 * Programmet er kun testet paa en Acer sonic master x550J med Windows 10.
 */

import processing.serial.*;
//Initialiserer variabler
Serial PortOne, PortTwo, PortThree, PortFour, PortFive, PortSix;
PrintWriter output;
//Variabler for a holde diverse verdier
String value;
String bruker;
String spm;
String svarblaa = "";
String svargronn = "";
String svarrod = "";
String svargul = "";
ArrayList<String> arrayfrafil = new ArrayList();
int linjerisporsmalsfil = 6;
int lestelinjer = 0;
int svar;

//Setter dimensjoner for soylediagram
int distX = 100;
int distY = 550;

//Holdeverdier for svar
int antSvar1 = 0;
int antSvar2 = 0;
int antSvar3 = 0;
int antSvar4 = 0;
PFont font;
PFont heading;
PrintWriter input;
String line;
BufferedReader reader;

/**
 * Denne metoden initialiserer varieabler
 * og oppretter ut fil.
 */
void setup()
{
  // Setter storrelse på vinduet til applikasjonen
  size(900,700);
  font = createFont("Arial",16,true);
  heading = createFont("Lobster", 32, true);
  PortOne = new Serial(this, Serial.list()[0], 9600); // "COM5"
  PortTwo = new Serial(this, Serial.list()[1],9600); // "COM6"
  PortThree = new Serial(this, Serial.list()[2], 9600); // "COM7"
  PortFour = new Serial(this, Serial.list()[3],9600); // "COM9"

  PortOne.bufferUntil('\n');
  PortTwo.bufferUntil('\n');
  PortThree.bufferUntil('\n');
  PortFour.bufferUntil('\n');

  //henter spørsmaalsfil valgt av bruker.
  selectInput("Select a file to process:", "fileSelected");
}

/**
 * Metoden er en loop som tegner det grafiske grensesnittet.
 */
void draw()
{
  background(255,255,255,255);
  stroke(0, 0, 0, 255);
  fill(245,245,245);
  rect(130, 120, 560, 460, 10);
  line(distX+100, 552, distX+100, 150);
  line(distX+100, 552, distX+500, 552);
  stroke(0,0,0);
  fill(0,46,235);
  //Tegner soylediagram
  rect (100+distX, distY, 100, - antSvar1*100);
  fill(60,248,0);
  rect (200+distX, distY, 100, - antSvar2*100);
  fill(240,30,0);
  rect (300+distX, distY, 100, - antSvar3*100);
  fill(255,255,0);
  rect (400+distX, distY, 100, - antSvar4*100);
  //Text x-akse
  textFont(font,16);
  fill(0);
  //Tegner inn svaralternativene fra filen
  text(svargul,120+distX, distY+20);
  text(svarblaa,220+distX, distY+20);
  text(svargronn,320+distX, distY+20);
  text(svarrod,420+distX, distY+20);
  //Text y akse
  text("1",distX+80, 520);
  text("2",distX+80, 420);
  text("3",distX+80, 320);
  text("4",distX+80, 220);
  textFont(heading,32);
  fill(0);
  //Heading
  text("CommuniCube", 300,100);
    if (value != null) {
      output.println(value);
      value = null;
    }
}

/**
 * Metoden tar inn og tolker data fra Arduino.
 * @param Serialporten som Arduinoen som avgir svar er koblet i
 */
void serialEvent(Serial thisPort) {
  try {
    if (thisPort == PortOne) {
      angiSvar(PortOne);
    }
    if(thisPort == PortTwo) {
      angiSvar(PortTwo);
    }
    if (thisPort == PortThree) {
      angiSvar(PortThree);
    }
    if (thisPort == PortFour) {
      angiSvar(PortFour);
    }
 }
 catch(Exception e) {
   println(e);
  }
}

/**
 * Metode som gjor Arduino data om til data som prosessing kan bruke
 */
void angiSvar(Serial port){
  value = port.readStringUntil('\n');
  String[] arr = value.split(",");
  svar = Integer.parseInt(arr[1].replace("\n","").trim());
  bruker = arr[0];
  println(value);
  println(arr[0]);
  println(svar);
  if ( svar == 1) {
  antSvar1++;
  }
  if (svar == 2) {
    antSvar2++;
  }
  if (svar == 3) {
    antSvar3++;
  }
  if(svar == 4) {
    antSvar4++;
  }
}
/**
 * Metode for aa lese inn fil til prosessing og opprette output fil
 * @param fil som bruker velger i "selectInput"
 */
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    reader = createReader(selection.getAbsolutePath());

    while(lestelinjer < linjerisporsmalsfil){
      try {
        line = reader.readLine();
        arrayfrafil.add(line);
        lestelinjer++;
      }
      catch(IOException io) {
        line = null;
      }
    }

    output = createWriter(arrayfrafil.get(0) + "medsvar" + ".txt");
    spm = arrayfrafil.get(1);
    svarblaa = arrayfrafil.get(2);
    svargronn = arrayfrafil.get(3);
    svarrod = arrayfrafil.get(4);
    svargul = arrayfrafil.get(5);
    println(svarblaa);
    println(svargul);
    println(svarrod);
    println(svargronn);

  }
}
/**
 * Metode som skriver til fil og lukker programmet
 */
void keyPressed() {
  output.flush(); //<>//
  output.close();
  exit();
}
