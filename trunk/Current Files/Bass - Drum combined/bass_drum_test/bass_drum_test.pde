//New pin values required for Arduino Mega operation

int incomingByte[2] = 0;

int strum_delay = 10; //sets delay for strum bar after notes are depressed
int Bg = 2; //B means bass g is green, r is red, y is yellow, b is blue, o is orange
int Br = 3;
int By = 4;
int Bb = 5;
int Bo = 6;
int Bs = 7; //Bs is bass strum

int Dr = 2; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
int Dy = 3;
int Db = 4;
int Dg = 5;
int Df = 6;

void setup()
{
  Serial.begin(9600);
  
  //Bass
  pinMode(Bg, OUTPUT);
  pinMode(Br, OUTPUT);
  pinMode(By, OUTPUT);
  pinMode(Bb, OUTPUT);
  pinMode(Bo, OUTPUT);
  pinMode(Bs, OUTPUT);

  //Drums
  pinMode(Dr, OUTPUT); 
  pinMode(Dy, OUTPUT);
  pinMode(Db, OUTPUT);
  pinMode(Dg, OUTPUT);
  pinMode(Df, OUTPUT);
}

void loop()
{
  if(Serial.available() > 0) //checks to see if data is at data port
  { 
   incomingByte[0]=Serial.read(); //read bass first, drum second
   incomingByte[1]=Serial.read(); 
   
   //bass
   digitalWrite(Bg,bitRead(incomingByte[0],0)); //reads the value of the byte and sets the output pin to the value of the bit
   
   digitalWrite(Br,bitRead(incomingByte[0],1));
   
   digitalWrite(By,bitRead(incomingByte[0],2));
   
   digitalWrite(Bb,bitRead(incomingByte[0],3));
  
   digitalWrite(Bo,bitRead(incomingByte[0],4));
  
   delay(strum_delay);
  
   digitalWrite(Bs,!(incomingByte[0] && 0x00));
  
   //drum
   digitalWrite(Df,(incomingByte[1] && 0xFF));
   
   digitalWrite(Dr,bitRead(incomingByte[1],0)); 
   
   digitalWrite(Dy,bitRead(incomingByte[1],1));
   
   digitalWrite(Db,bitRead(incomingByte[1],2));
   
   digitalWrite(Dg,bitRead(incomingByte[1],3)); 
  }
  
  
}
