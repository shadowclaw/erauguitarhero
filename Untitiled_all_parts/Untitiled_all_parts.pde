                
int incomingByte = 0;
int n=0;

//int Gg = #; //G means guitar g is green, r is red, y is yellow, b is blue, o is orange
int Gr = #;
//int Gy = #;
int Gb = #;
//int Go = #;
//int Gs = #; //Gs is guitar strum

int Dr = #; //D means drums r is red, y is yellow, b is blue, g is green, f is footpedal
int Dy = #;
int Db = #;
int Dg = #;
int Df = #;

//int Bg = #; //B means bass g is green, r is red, y is yellow, b is blue, o is orange
//int Br = #;
//int By = #;
//int Bb = #;
//int Bo = #;
//int Bs = #; //Bs is bass strum

//byte buffer[3];

void setup()
{
  Serial.begin(9600);
  //pinMode(Gg, OUTPUT); //Guitar
  pinMode(Gr, OUTPUT);
  //pinMode(Gy, OUTPUT);
  pinMode(Gb, OUTPUT);
  //pinMode(Go, OUTPUT);
  //pinMode(Gs, OUTPUT);
  
  pinMode(Dr, OUTPUT); //Drums
  pinMode(Dy, OUTPUT);
  pinMode(Db, OUTPUT);
  pinMode(Dg, OUTPUT);
  pinMode(Df, OUTPUT);
  
  //pinMode(Bg, OUTPUT); //Bass
  //pinMode(Br, OUTPUT);
  //pinMode(By, OUTPUT);
  //pinMode(Bb, OUTPUT);
  //pinMode(Bo, OUTPUT);
  //pinMode(Bs, OUTPUT);
}

void loop()
{
  if(Serial.available() > 0) //checks to see if data is at data port
  {
   incomingByte=Serial.read(); 
   if(bitRead(incomingByte,0)==1) //reads byte and checks to see if it is equal to one if so sets pin to true
     //{
     // digitalWrite(Gg, HIGH);
     //}
     //else                        //if the byte is not equal to one sets the pin to false
     //{
     //digitalWrite(Gg, LOW);
     //}
    //if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(Gr, HIGH);
     }
     else
     {
     digitalWrite(Gr, LOW);
     } 
    //if(bitRead(incomingByte,2)==1)
     //{
      //digitalWrite(Gy, HIGH);
     //}
     //else
     //{
     //digitalWrite(Gy, LOW);
     }
    if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(Gb, HIGH);
     }
     else
     {
     digitalWrite(Gb, LOW);
     } 
    //if(bitRead(incomingByte,4)==1)
     //{
      //digitalWrite(Go, HIGH);
     //}
     //else
     //{
     //digitalWrite(Go, LOW);
     //}
     
     
    if(bitRead(incomingByte,2)==1)
     {
      digitalWrite(Dr, HIGH);
     }
     else
     {
     digitalWrite(Dr, LOW);
     }
    if(bitRead(incomingByte,3)==1)
     {
      digitalWrite(Dy, HIGH);
     }
     else
     {
     digitalWrite(Dy, LOW);
     }
    if(bitRead(incomingByte,4)==1)
     {
      digitalWrite(Db, HIGH);
     }
     else
     {
     digitalWrite(Db, LOW);
     }
    if(bitRead(incomingByte,5)==1)
     {
      digitalWrite(Dg, HIGH);
     }
     else
     {
     digitalWrite(Dg, LOW);
     }
    if(bitRead(incomingByte,6)==1)
     {
      digitalWrite(Df, HIGH);
     }
     else
     {
     digitalWrite(Df, LOW);
     }
  }
}

