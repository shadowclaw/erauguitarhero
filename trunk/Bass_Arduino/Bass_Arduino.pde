                
int incomingByte = 0;
int n=0;

int Bg = #; //B means bass g is green, r is red, y is yellow, b is blue, o is orange
int Br = #;
int By = #;
int Bb = #;
int Bo = #;
//int Bs = #; //Bs is bass strum

//int Dr = #; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
//int Dy = #;
//int Db = #;
//int Dg = #;
//int Df = #;

void setup()
{
  Serial.begin(9600); 
   
  pinMode(Bg, OUTPUT); //Bass
  pinMode(Br, OUTPUT);
  pinMode(By, OUTPUT);
  pinMode(Bb, OUTPUT);
  pinMode(Bo, OUTPUT);
  //pinMode(Bs, OUTPUT);
  
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
   incomingByte=Serial.read(); 
   if(bitRead(incomingByte,0)==1) //reads byte and checks to see if it is equal to one if so sets pin to true
     {
      digitalWrite(Bg, HIGH);
     }
     else                        //if the byte is not equal to one sets the pin to false
     {
      digitalWrite(Bg, LOW);
     }
   if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(Br, HIGH);
     }
     else
     {
      digitalWrite(Br, LOW);
     } 
   if(bitRead(incomingByte,2)==1)
     {
      digitalWrite(By, HIGH);
     }
     else
     {
      digitalWrite(By, LOW);
     }
    if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(Bb, HIGH);
     }
     else
     {
      digitalWrite(Bb, LOW);
     } 
   if(bitRead(incomingByte,4)==1)
     {
      digitalWrite(Bo, HIGH);
     }
     else
     {
      digitalWrite(Bo, LOW);
     }    
  }
}

