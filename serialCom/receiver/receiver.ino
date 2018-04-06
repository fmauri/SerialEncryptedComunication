char mystr[5]; //Initialized variable to store recieved data
#include <IRremote.h>

int RECV_PIN = 11;

IRrecv irrecv(RECV_PIN);

decode_results results;
int address_rev = 0x8a75;
char prevCmd = ' ';
void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
}
int iteration = 0;
char msg[6] = "BEDZI";
void loop()
{
  Serial.readBytes(mystr,5); //Read the serial data and store KEY
//  Serial.print(mystr);
  
  if (irrecv.decode(&results)) 
  {
    int i = 0;
    for(i=0; i<16; i++)
      if(bitRead(results.value, i)==bitRead(address_rev, i)) 
      {
//        Serial.println(results.value, BIN);
        char addr = results.value >> 24;// << 24;
        char revAddr = (( (results.value)  << 8 ) >> 24);
        bool areTheSame = (addr == ~revAddr);
//        Serial.println(addr, BIN);
//        Serial.println(revAddr, BIN);
//        Serial.println(areTheSame);
        if(areTheSame)
        {
          char cmd = results.value << 16 >> 24;
          char revCmd = results.value << 24 >> 24;
          if(cmd == ~revCmd && prevCmd != cmd) {
            prevCmd = cmd;
            msg[iteration] = cmd ^ mystr[iteration];
            Serial.print(iteration);
            Serial.print(" ");
            Serial.print(cmd, HEX);
            Serial.print(" ");
            Serial.print(mystr[iteration]);
            Serial.print(" ");
            Serial.println(msg[iteration]);
            iteration = (iteration + 1); 
          } else if (cmd == revCmd) {
            iteration = 0;
            Serial.println("-----");
          } else {
            Serial.println("+++");
          }
        } else {
          Serial.println("SOMETHING VERY STRANGE");
        }
      }
         
    irrecv.resume(); // Receive the next value }
  
  }
}
