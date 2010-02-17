                
int incomingByte = 0;
int n=0;
int red = 2;
int blue = 5;
int wax = 11;
void setup()
{
  Serial.begin(9600);
  pinMode(red, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(wax, OUTPUT);
}

void loop()
{
  if(Serial.available() > 0)
  {
   incomingByte=Serial.read(); 
   if(bitRead(incomingByte,0)==1)
     {
      digitalWrite(red, HIGH);
     }
     else
     {
     digitalWrite(red, LOW);
     }
    if(bitRead(incomingByte,1)==1)
     {
      digitalWrite(blue, HIGH);
     }
     else
     {
     digitalWrite(blue, LOW);
     } 
     if(bitRead(incomingByte,2)==1)
     {
      digitalWrite(wax, HIGH);
     }
     else
     {
     digitalWrite(wax, LOW);
     } 
  }
}

