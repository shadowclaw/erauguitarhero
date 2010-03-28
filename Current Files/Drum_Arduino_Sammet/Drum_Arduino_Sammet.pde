             
int incomingByte = 0;

int Dr = 2; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
int Dy = 3;
int Db = 4;
int Dg = 5;
int Df = 6;
int test = 12;

void setup()
{
  Serial.begin(9600); 
  pinMode(Dr, OUTPUT); //Drums
  pinMode(Dy, OUTPUT);
  pinMode(Db, OUTPUT);
  pinMode(Dg, OUTPUT);
  pinMode(Df, OUTPUT);
  pinMode(test, INPUT);
}

void loop()
{
 if(digitalRead(test))
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
   
   digitalWrite(Df,(incomingByte && 0xFF));
   
   digitalWrite(Dr,bitRead(incomingByte,0)); //reads the value of the byte and sets the output pin to the value of the bit
   
   digitalWrite(Dy,bitRead(incomingByte,1));
   
   digitalWrite(Db,bitRead(incomingByte,2));
   
   digitalWrite(Dg,bitRead(incomingByte,3));
   }
 }


