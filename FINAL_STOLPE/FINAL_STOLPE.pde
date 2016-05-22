import processing.serial.*;

Serial PortOne, PortTwo, PortThree, PortFour, PortFive, PortSix;
PrintWriter output;
String value;
String bruker;
int svar;

int distX = 100;
int distY = 550;

int antSvar1 = 0;
int antSvar2 = 0;
int antSvar3 = 0;
int antSvar4 = 0;
PFont font;

void setup()
{
  size(900,700);
  font = createFont("Arial",16,true);
  PortOne = new Serial(this, Serial.list()[0], 9600); // "COM3"
  PortTwo = new Serial(this, Serial.list()[1],9600); // "COM5"
  PortThree = new Serial(this, Serial.list()[2], 9600); // "COM3"
  PortFour = new Serial(this, Serial.list()[3],9600); // "COM5"
  //PortFive = new Serial(this, Serial.list()[4], 9600); // "COM3"
  //PortSix = new Serial(this, Serial.list()[5],9600); // "COM5"
  PortOne.bufferUntil('\n');
  PortTwo.bufferUntil('\n');
  PortThree.bufferUntil('\n'); 
  PortFour.bufferUntil('\n'); 
  //PortFive.bufferUntil('\n'); 
  //PortSix.bufferUntil('\n'); 
  output = createWriter("data.txt"); 
}

void draw()
{
   background(255,255,255,255);
   stroke(0, 0, 0, 255);
   fill(245,245,245); 
   rect(130, 120, 560, 460, 10);
   line(distX+100, 552, distX+100, 150); 
   line(distX+100, 552, distX+500, 552);
   stroke(0,0,0);
   fill(255,20,147);
   rect (100+distX, distY, 100, - antSvar1*100);
   fill(0,255,0);
   rect (200+distX, distY, 100, - antSvar2*100);
   fill(255,0,0);
   rect (300+distX, distY, 100, - antSvar3*100);
   fill(0,0,255);
   rect (400+distX, distY, 100, - antSvar4*100);
   
    textFont(font,16);                 
    fill(0);                        
    text("Svar 1",120+distX, distY+20);  
    text("Svar 2",220+distX, distY+20);  
    text("Svar 3",320+distX, distY+20);  
    text("Svar 4",420+distX, distY+20);  
    //mål Y-akse
    text("1",distX+80, 520);  
    text("2",distX+80, 420);  
    text("3",distX+80, 320);  
    text("4",distX+80, 220);
     if (value != null) {
       output.println(value);
       value = null;
     }
}


void serialEvent(Serial thisPort) {
  try {
    if (thisPort == PortOne) {
      value = PortOne.readStringUntil('\n');
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
    if(thisPort == PortTwo) {
      value = PortTwo.readStringUntil('\n');
      String[] arr = value.split(",");
      bruker = arr[0];
      svar = Integer.parseInt(arr[1].replace("\n","").trim());
      println(value);
      println(arr[0]);
      println(arr[1]);
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
    if (thisPort == PortThree) {
      value = PortThree.readStringUntil('\n');
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
    if (thisPort == PortFour) {
      value = PortFour.readStringUntil('\n');
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
    /*
    if (thisPort == PortFive) {
      value = PortFive.readStringUntil('\n');
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
    */
    /*if (thisPort == PortSix) {
      value = PortSix.readStringUntil('\n');
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
    }*/
 } catch(Exception e)
 {
   println(e);
 }
}

void keyPressed() {
  output.flush(); //<>//
  output.close();
  exit();
}