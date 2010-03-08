                
byte incomingByte = 0;
int n=0;

int Dr = 2; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
int Dy = 4;
int Db = 6;
int Dg = 8;
int Df = 10;

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
  if(Serial.available() > 0) //checks to see if data is at data port
  {
   incomingByte=Serial.read(); 
   if(bitRead(incomingByte,0)) //reads byte and checks to see if it is equal to one if so sets pin to true
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
   if(bitRead(incomingByte,4)==1)
     {
      digitalWrite(Df, HIGH);
     }
     else
     {
      digitalWrite(Df, LOW);
     }    
  }
}

