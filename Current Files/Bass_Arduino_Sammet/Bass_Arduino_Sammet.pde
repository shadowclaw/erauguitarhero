                
int incomingByte = 0;

int strum_delay = 10; //sets delay for strum bar after notes are depressed
int Bg = 2; //B means bass g is green, r is red, y is yellow, b is blue, o is orange
int Br = 3;
int By = 4;
int Bb = 5;
int Bo = 6;
int Bs = 7; //Bs is bass strum
int test = 12;

void setup()
{
  Serial.begin(9600); 
   
  pinMode(Bg, OUTPUT); //Bass
  pinMode(Br, OUTPUT);
  pinMode(By, OUTPUT);
  pinMode(Bb, OUTPUT);
  pinMode(Bo, OUTPUT);
  pinMode(Bs, OUTPUT);
  pinMode(test,INPUT);
  
  //pinMode(Dr, OUTPUT); //Drums
  //pinMode(Dy, OUTPUT);
  //pinMode(Db, OUTPUT);
  //pinMode(Dg, OUTPUT);
  //pinMode(Df, OUTPUT);
}

void loop()
{
 if(digitalRead(test))
  {
   digitalWrite(Bg, HIGH);
   delay(1000);
   digitalWrite(Bg, LOW);
   delay (1000);
   digitalWrite(Br, HIGH);
   delay(1000);
   digitalWrite(Br, LOW);
   delay(1000);
   digitalWrite(By, HIGH);
   delay(1000);
   digitalWrite(By, LOW);
   delay(1000);
   digitalWrite(Bb, HIGH);
   delay(1000);
   digitalWrite(Bb, LOW);
   delay(1000);
   digitalWrite(Bo, HIGH);
   delay(1000);
   digitalWrite(Bo, LOW);
   delay(1000);
   digitalWrite(Bs, HIGH);
   delay(1000);
   digitalWrite(Bs, LOW);
  } 
  
  if(Serial.available() > 0) //checks to see if data is at data port
  { 
   incomingByte=Serial.read(); 
   
   digitalWrite(Bg,bitRead(incomingByte,0)); //reads the value of the byte and sets the output pin to the value of the bit
   
   digitalWrite(Br,bitRead(incomingByte,1));
   
   digitalWrite(By,bitRead(incomingByte,2));
   
   digitalWrite(Bb,bitRead(incomingByte,3));
  
   digitalWrite(Bo,bitRead(incomingByte,4));
  
   delay(strum_delay);
  
   digitalWrite(Bs,!(incomingByte && 0x00)); 
  }
  
}

