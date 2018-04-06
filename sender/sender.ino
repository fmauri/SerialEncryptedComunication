#include <IRremoteInt.h>
#include <ir_Lego_PF_BitStreamEncoder.h>
#include <boarddefs.h>
#include <IRremote.h>

char key[5] = "Mordo"; //String data
char msg[5] = "CoTam";
long address = 35445; // 0x8a75;
char cipher [5] = "somet";
char negation;
//int conc = 0;
IRsend irsend;

void setup() {
  // Begin the Serial at 9600 Baud
  Serial.begin(9600);
}

void loop() {
  Serial.write(key,5); //Write the serial data
  for(int i=0; i <5;i++){
    long conc = 0;
    cipher[i] = key[i] ^ msg[i];
    negation = ~cipher[i];
    conc = ((((cipher[i]+1)<<8))+negation);
    conc =(conc)+ (address<<16);
    irsend.sendNEC(conc, 32);
    delay(1000);
  } 
//  irsend.sendNEC(255, 32); 
  delay(5000);
}
