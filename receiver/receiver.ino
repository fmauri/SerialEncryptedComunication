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
char msg[6]; // Received via IR (wireless)
char key[6]; // Received via UART (wires)
void loop()
{
  Serial.readBytes(key,6); //Receive KEY from UART
  Serial.println(key);
  if (irrecv.decode(&results)) 
  {
    int i = 0;
    for(i=0; i<16; i++)
      if(bitRead(results.value, i)==bitRead(address_rev, i)) 
      {
        char addr = results.value >> 24;
        char revAddr = (( (results.value)  << 8 ) >> 24);
        bool areTheSame = (addr == ~revAddr);
        if(areTheSame)
        {
          char cmd = results.value << 16 >> 24;
          char revCmd = results.value << 24 >> 24;
          if(cmd == ~revCmd && prevCmd != cmd) {
            prevCmd = cmd;
            msg[iteration] = cmd ^ key[iteration];
            iteration = (iteration + 1);
          } else if (cmd == revCmd) {
            Serial.println(msg);
            iteration = 0; // Message will start again
          } else { }
        } else { }
      }
    irrecv.resume(); // Receive the next value }
  }
}

