


#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

// Which pin on the Arduino is connected to the NeoPixels?
#define PIN        0 // On Trinket or Gemma, suggest changing this to 1

// How many NeoPixels are attached to the Arduino?
#define NUMPIXELS 24 // Popular NeoPixel ring size

// When setting up the NeoPixel library, we tell it how many pixels,
// and which pin to use to send signals. Note that for older NeoPixel
// strips you might need to change the third parameter -- see the
// strandtest example for more information on possible values.
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

#define DELAYVAL 500 // Time (in milliseconds) to pause between pixels
int y = 0;


#include <SoftwareSerial.h>

SoftwareSerial MyModule(1,2);
long s = 1;
int val1 = 0;
char val2 = 0;
char value = 0;
int prev_b = HIGH;
// the setup function runs once when you press reset or power the board

void setup() {

  #if defined(__AVR_ATtiny85__) && (F_CPU == 16000000)
  clock_prescale_set(clock_div_1);
#endif
  // END of Trinket-specific code.

  pixels.begin(); // INITIALIZE NeoPixel strip object (REQUIRED)
  // initialize digital pin LED_BUILTIN as an output.
  

  pinMode(7, INPUT);
  digitalWrite(7, HIGH);
  pinMode(12, OUTPUT);
    pinMode(11, OUTPUT);
  pinMode(13, OUTPUT);
 
 // delay(2500);
  
  MyModule.begin(9600);
 SerialUSB.begin(250000);
    for(int i=0; i<NUMPIXELS; i++) { // For each pixel...

    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    pixels.setPixelColor(i, pixels.Color(20, 0, 0));

    
   
     }
  pixels.show(); 
  green();

}
// the loop function runs over and over again forever
void loop() 
{


 if (MyModule.available() > 0){
    value = MyModule.read();
//     SerialUSB.print(value);
     SerialUSB.println();
    delay(300);
 }
     if (MyModule.available() > 0){
    val1 = MyModule.read();
   //  SerialUSB.write(val1);
     SerialUSB.println();
    delay(200);
     }
      
// if (SerialUSB.available()){
 //   MyModule.write(SerialUSB.read());

//} 

  
 if (value == 'z' ){
 
     digitalWrite(11, LOW);
     digitalWrite(12, HIGH); 
     digitalWrite(13, HIGH); 
    MyModule.println("Blue MODE______#1_______");
     for(int i=0; i<NUMPIXELS; i++) { // For each pixel...
    
    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    
    pixels.setPixelColor(i, pixels.Color(0, 0, 15));
    
    pixels.show();   // Send the updated pixel colors to the hardware.
   
     }
    value = 99;
 }




 
 if (value == 'b' ){
     digitalWrite(12, LOW);
     digitalWrite(11, HIGH); 
     digitalWrite(13, HIGH); 
      MyModule.println("Blue MODE______#2_______");
 y = map(int(val1), 10, 1, 50, 1);
  for(int i=0; i<NUMPIXELS; i++) { // For each pixel...
    
    pixels.setPixelColor(i, pixels.Color(0, 0, y));
    pixels.show();   // Send the updated pixel colors to the hardware.
     }
     
// SerialUSB.print(y);
      
    value = 99;
 }






 if (value == 'y' ){
     digitalWrite(13, LOW);
     digitalWrite(12, HIGH); 
     digitalWrite(11, HIGH); 
      MyModule.println("Yellow MODE_____________");
      y = map(int(val1), 10, 1, 50, 1); 
      
        for(int i=0; i<NUMPIXELS; i++) { // For each pixel...

    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    pixels.setPixelColor(i, pixels.Color(y, y, 0));
        pixels.show();   // Send the updated pixel colors to the hardware.
   
     }
    value = 99;
 }

 if (value == 'o' ){
     digitalWrite(11, HIGH); 
     digitalWrite(12, HIGH); 
     digitalWrite(13, HIGH);  
      MyModule.println("_____OFF________");
        for(int i=0; i<NUMPIXELS; i++) { // For each pixel...

    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    pixels.setPixelColor(i, pixels.Color(0, 0, 0));
   
    pixels.show();   // Send the updated pixel colors to the hardware.
   
     }
      value = 99;
      
 }          

if (value == 'f' ){
     digitalWrite(13, LOW); 
     digitalWrite(12, HIGH);
     delay(80); 
     digitalWrite(13, HIGH); 
     digitalWrite(12, LOW); 
     delay(80); 
      MyModule.println("__________Flash_____________");
      flash();
   // value = 99;
 }          

 
int b = (digitalRead(7));
 if (b != prev_b){
  if (b != HIGH){
    SerialUSB.print("Button Pressed ");
    SerialUSB.print(s);
    SerialUSB.println(" Times");
    MyModule.write("Button Pressed ");
    MyModule.print(s);
    MyModule.write(" Times");
    MyModule.write("\n");
    s++;
 }else{
}
delay(100);
 prev_b = b;
}
  

 }


 void green(){
     for(int i=0; i<NUMPIXELS; i++) { // For each pixel...

    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    pixels.setPixelColor(i, pixels.Color(0, 0, 0));

    pixels.show();   // Send the updated pixel colors to the hardware.
    delay(25);
     }
 }


 void flash(){
     for(int i=0; i<NUMPIXELS; i++) { // For each pixel...

    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    pixels.setPixelColor(i, pixels.Color(10, 0, 0));

    pixels.show();   // Send the updated pixel colors to the hardware.
    delay(25);
     }
        for(int i=0; i<NUMPIXELS; i++) { // For each pixel...

    // pixels.Color() takes RGB values, from 0,0,0 up to 255,255,255
    // Here we're using a moderately bright green color:
    pixels.setPixelColor(i, pixels.Color(0, 0, 0));

    pixels.show();   // Send the updated pixel colors to the hardware.
    delay(25);
        } }
