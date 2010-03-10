                
int incomingByte = 0;
int n=0;
int s=0; //strum bar variable
int strum_delay = 10; //sets delay for strum bar after notes are depressed
int Bg = 2; //B means bass g is green, r is red, y is yellow, b is blue, o is orange
int Br = 3;
int By = 4;
int Bb = 5;
int Bo = 6;
int Bs = 7; //Bs is bass strum

void setup()
{
  Serial.begin(9600); 
   
  pinMode(Bg, OUTPUT); //Bass
  pinMode(Br, OUTPUT);
  pinMode(By, OUTPUT);
  pinMode(Bb, OUTPUT);
  pinMode(Bo, OUTPUT);
  pinMode(Bs, OUTPUT);
  
  //pinMode(Dr, OUTPUT); //Drums
  //pinMode(Dy, OUTPUT);
  //pinMode(Db, OUTPUT);
  //pinMode(Dg, OUTPUT);
  //pinMode(Df, OUTPUT);
}

void loop()
{
  if(Serial.available() > 0) //checks to see if data is at data port
  {
   s=0; 
   incomingByte=Serial.read(); 
   
   
   
   if(bitRead(incomingByte,0)==1) //reads byte and checks to see if it is equal to one if so sets pin to true
     {
      digitalWrite(Bg, HIGH);
      s++;
     }
     else                        //if the byte is not equal to one sets the pin to false
     {
      digitalWrite(Bg, LOW);
     }
   if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(Br, HIGH);
      s++;
     }
     else
     {
      digitalWrite(Br, LOW);
     } 
   if(bitRead(incomingByte,2)==1)
     {
      digitalWrite(By, HIGH);
      s++;
     }
     else
     {
      digitalWrite(By, LOW);
     }
    if(bitRead(incomingByte,3)==1)
     {
      digitalWrite(Bb, HIGH);
      s++;
     }
     else
     {
      digitalWrite(Bb, LOW);
     } 
   if(bitRead(incomingByte,4)==1)
     {
      digitalWrite(Bo, HIGH);
      s=s++;
     }
     else
     {
      digitalWrite(Bo, LOW);
     }
     delay(strum_delay); 
    if(s!=0)
    {
     digitalWrite(Bs, HIGH);
    }
    else
    {
     digitalWrite(Bs, LOW);
    }
  }
  digitalWrite(Bs,(bitRead(incomingByte,0) or bitRead(incomingByte,1) or bitRead(incomingByte,2) or bitRead(incomingByte,3) or bitRead(incomingByte,4)));
}

