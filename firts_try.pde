import processing.serial.*;
Serial myPort;
String ledStatus="___";
String message="___";
import controlP5.*;
String name = "";
ControlP5 cp5;
ControlP5 MyController;
char f = 0 ;
char b = 0 ;
char y = 0 ;
char o = 0 ;
char c = 0 ;

void setup(){
 size(1000,450);
  stroke(2);
  myPort = new Serial(this, "com10", 9600); // Starts the serial communication
  myPort.bufferUntil('\n'); // Defines up to which character the data from the serial port will be read. The character '\n' or 'New Line'
 
 
 
 
 
 

 cp5 = new ControlP5(this);
 MyController = new ControlP5(this);

  // create a new button with name 'buttonA'
  Button b2=cp5.addButton("HC-05")
     .setValue(0)
     .setPosition(480,250)
     .setSize(200,150)
     .activateBy(ControlP5.PRESSED)
     ;
     
  b2.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.ACTION_PRESSED): name= "bigb";  break;
        case(ControlP5.ACTION_RELEASED): name="stop";  break;
      }
    }
  }
  );

    
     
     
     
     
  
  Button b1 = cp5.addButton("click").setPosition(620,110).setSize(100,40);
  
  b1.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.ACTION_PRESSED): name= "start";  break;
        case(ControlP5.ACTION_RELEASED): name="stop";  break;
      }
    }
  }
  );



    
     
     
     
     
 myPort.write('0');

 cp5.addSlider("blue ",0,9,10,40,300,350,40)
 //.showTickMarks(false)
 .setNumberOfTickMarks(10)
// .setColorTickMark(255)
 .setValue(1)
 .setColorValue(color(0,0,255))
 .setColorForeground(color(0,0,255))
  .setColorBackground(color(0,0,25));
 
 
 cp5.addSlider("yellow",0,9,10,40,255,350,40)
  .setValue(1)
   .setNumberOfTickMarks(10)
 .setColorValue(color(255,255,0))
 .setColorForeground(color(255,255,0))
   .setColorBackground(color(25,25,0));

}

 


void serialEvent (Serial myPort){ // Checks for available data in the Serial Port
  ledStatus = myPort.readStringUntil('\n'); //Reads the data sent from the Arduino (the String "LED: OFF/ON) and it puts into the "ledStatus" variable

}

// public void controlEvent(ControlEvent theEvent) {
//   name = cp5.getController("HC-05").getValue();
  


// }

void draw(){
  background(37, 240, 110);
    String valueblue = str(cp5.getController("blue ").getValue());
    String[] value1 = split(valueblue, '.');
    
    String valueyellow = str(cp5.getController("yellow").getValue());
    String[] value2 = split(valueyellow, '.');
    
    
    
  // cp5.getController("HC-05").setValue(value+20);
  cp5.getController("HC-05").setSize(150,100);
 
  if (b== 1){
    b=0;
     myPort.write('b');
     myPort.write(value1[0]);
     y=0;
     o=0;
     f=0;
     c=0;
     delay(500);
  } 
  
  if (o== 1){
    o=0;
     myPort.write('o');
     o=0;
     y=0;
     b=0;
     f=0;
     c=0;
     delay(500);
  }
  
   if (y== 1){
    y=0;
     myPort.write('y'); 
      myPort.write(value2[0]);
     o=0;
     b=0;
     f=0;
     c=0;
     delay(500);
  }
  
  
   if (c== 1){
    c=0;
     myPort.write('z'); 
     o=0;
     b=0;
     f=0;
     c=0;
     delay(500);
  }
  
  
  fill(20, 160, 133); // Green Color
  stroke(33);
  strokeWeight(1);
  fill(0, 0, 150); // Green Color
  rect(50, 100, 150, 50, 141);  // blue
  fill(20, 160, 133); // Green Color
  rect(250, 100, 150, 50, 10); // off
  fill(255, 255, 0) ; 
  rect(450, 100, 150, 50, 10);
  fill(0);
  rect(40, 350, 400, 50, 10);
  fill(255);
  textSize(62);
  text("HC-05",300, 53);
  textSize(32);
  text("Blue",60, 135);
  
  String valueblue2 = str(cp5.getController("blue ").getValue());
  String[] value12 = split(valueblue2, '.');
  text (value12[0], 55, 180);
  
  
  text("Turn OFF", 255, 135);
  fill(33);
  text("Yellow",460, 135);
  
  
  
  String valueyellow2 = str(cp5.getController("yellow").getValue());
  String[] value22 = split(valueyellow2, '.');
  text (value22[0], 455, 180);
  
  
  fill(255, 0, 0);
  text("FLASH",150, 390);
  textSize(24);
  fill(33);
  text("Status:", 180, 200);
  textSize(30);
  textSize(16);
  text("", 80, 320);
  textSize(42);
  text(ledStatus, 100, 240);

  
  
  // If the button "Turn ON" is pressed
  if(mousePressed && b == 0 && mouseX>50 && mouseX<200 && mouseY>100 && mouseY<150){
        b=1;
      delay(50);
    // Highlighs the buttons in red color when pressed
    stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(50, 100, 150, 50, 10);
  }
  // If the button "Turn OFF" is pressed
  if((mousePressed && o == 0 && mouseX>250 && mouseX<400 && mouseY>100 && mouseY<150) || name == "start"){
    o=1;
    delay(50);
    
    stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(250, 100, 150, 50, 10);
  }
    // If the button "Turn OFF" is pressed
  if(mousePressed && y == 0 && mouseX>450 && mouseX<600 && mouseY>100 && mouseY<150){
    y=1;
    delay(50);
    
  
    stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(450, 100, 150, 50, 10);
   // print(MyController);
  }
  
  if(name=="bigb"){
    c=1 ;
     delay(50);
     stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(40, 350, 400, 5, 0);
  }
  
 if(mousePressed && f == 0 &&mouseX>40 && mouseX<450 && mouseY>350 && mouseY<400){
    myPort.write('f'); 
    delay(50);
    c=0;
    b=0;
    y=0;
    o=0;
    f=1;
    // Highlighs the buttons in red color when pressed
    stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(40, 350, 400, 50, 10);
  }
 }
