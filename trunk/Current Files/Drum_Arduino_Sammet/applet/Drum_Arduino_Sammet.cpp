                
#include "WProgram.h"
void setup();
void loop();
int incomingByte = 0;
int n=0;

int Dr = 2; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
int Dy = 3;
int Db = 4;
int Dg = 5;
int Df = 6;
int test = 12;
int tval=0;

void setup()
{
  Serial.begin(9600); 
  pinMode(Dr, OUTPUT); //Drums
  pinMode(Dy, OUTPUT);
  pinMode(Db, OUTPUT);
  pinMode(Dg, OUTPUT);
  pinMode(Df, OUTPUT);
}

void loop()
{
 tval=digitalRead(test);
 if(tval==0)
  {
   digitalWrite(Dr, HIGH);
   delay(1000);
   digitalWrite(Dr, LOW);
   delay (1000);
   digitalWrite(Dy, HIGH);
   delay(1000);
   digitalWrite(Dy, LOW);
   delay(1000);
   digitalWrite(Db, HIGH);
   delay(1000);
   digitalWrite(Db, LOW);
   delay(1000);
   digitalWrite(Dg, HIGH);
   delay(1000);
   digitalWrite(Dg, LOW);
   delay(1000);
   digitalWrite(Df, HIGH);
   delay(1000);
   digitalWrite(Df, LOW);
  } 
  if(Serial.available() > 0) //checks to see if data is at data port
  {
   incomingByte=Serial.read();
   if(bitRead(incomingByte,0) and bitRead(incomingByte,1) and bitRead(incomingByte,2) and bitRead(incomingByte,3))
   {
     digitalWrite(Df,HIGH);
   }
   else
   {
     if(bitRead(incomingByte,0)==1) //reads byte and checks to see if it is equal to one if so sets pin to true
     {
      digitalWrite(Dr, HIGH);
     }
     else                        //if the byte is not equal to one sets the pin to false
     {
      digitalWrite(Dr, LOW);
     }
   if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(Dy, HIGH);
     }
     else
     {
      digitalWrite(Dy, LOW);
     } 
   if(bitRead(incomingByte,2)==1)
     {
      digitalWrite(Db, HIGH);
     }
     else
     {
      digitalWrite(Db, LOW);
     }
    if(bitRead(incomingByte,3)==1)
     {
      digitalWrite(Dg, HIGH);
     }
     else
     {
      digitalWrite(Dg, LOW);
     } 
   }
  }
}


int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

