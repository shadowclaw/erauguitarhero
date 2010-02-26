/*
  Switch statement  with serial input
 
 This code is intended to be a preliminary attenpt on developing the real-time
 controler for the Rock Band robot for EE 505 (ERAU, Daytona Beach, Spring 2010)
 
 This board will receive binary data over the USB Serial connection containing
 information required to correctly manipulate the appropriate game controlers.
 
 For this example, 5 red LEDs simulate the 5 fret buttons on the Guitar controler,
 and one Green LED representing the Strum bar on the Guitar controler. Each LED is
 connected in series with a 270-Ohm resister. 
 
 
 created 25 Feb 2010
 by Steven Patterson
 
 */

void setup() {
  // initialize serial communication:
  Serial.begin(9600); 
   // initialize the LED pins:
  for (int thisPin = 2; thisPin < 8; thisPin++)
  {
    pinMode(thisPin, OUTPUT);
  }
  
  pinMode(13, OUTPUT);
}

boolean ifread = false;
boolean strum = false;

void loop() {
  // read the sensor:
  if (Serial.available() > 0) {
    int inByte = Serial.read();
    ifread = true;
    
    // Echo the read data back to the Serial port monitor display
    Serial.println(inByte,BIN);

    // Check bit 0
    if (bitRead(inByte,0))
    {    
      digitalWrite(2, HIGH);
    }
    else
    {
      digitalWrite(2, LOW);
    }
    
    // Check bit 1
    if (bitRead(inByte,1))
    {
      digitalWrite(3, HIGH);
    }
    else
    {
      digitalWrite(3,LOW);
    }
    
    // Check bit 2
    if (bitRead(inByte,2))
    {
      digitalWrite(4, HIGH);
    }
    else
    {
      digitalWrite(4, LOW);
    }
    
    // Check bit 3
    if (bitRead(inByte,3))
    {
      digitalWrite(5, HIGH);
    }
    else
    {
      digitalWrite(5, LOW);
    }
    
    // Check bit 4
    if (bitRead(inByte,4))
    {
      digitalWrite(6, HIGH);
      strum = true;
    }
    else
    {
      digitalWrite(6, LOW);
      strum = false;
    }
    
    // Logic to determine when to trigger strum bar
    if (bitRead(inByte,0) ||
        bitRead(inByte,1) ||
        bitRead(inByte,2) ||
        bitRead(inByte,3) ||
     // bitRead(inByte,4) ||
        false )
    {
      strum = true;
    }
    else
    {
      strum = false;
    }
  }
  else {
    ifread = false;
  }
  
  if (ifread)
  {  
    if (strum)
    {
      delay(500);
      digitalWrite(7,HIGH);
      delay(500);
      digitalWrite(7,LOW);
    }
    else
    {
      delay(500);
    }
  }
  
  digitalWrite(13, HIGH);
  digitalWrite(13, LOW);
}

