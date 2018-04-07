#include <IRremoteInt.h>
#include <ir_Lego_PF_BitStreamEncoder.h>
#include <boarddefs.h>
#include <IRremote.h>

char key[5] = "Mordo"; //String data
char msg[5] = "CoTam";
long address = 35445; // 0x8a75;
char cipher [5] = "somet";
char negation;
long start = 0x8a75FFFF;
long ending = 0x8a750000;
long conc = 0;

IRsend irsend;

void setup() {
  // Begin the Serial at 9600 Baud
  Serial.begin(9600);
}

void loop() {
  Serial.write(key,5); //Write the serial data
//  irsend.sendNEC(start, 32);
  delay(1000);
  for(int i=0; i <5;i++){
    cipher[i] = key[i] ^ msg[i];
//    Serial.print(i);
//    Serial.print(" ");  
//    Serial.println(cipher[i],HEX);
    negation = ~cipher[i];
    conc = ((((cipher[i]+1)<<8))+negation);
    conc =(conc)+ (address<<16);
    irsend.sendNEC(conc, 32);
//    Serial.print(i);
//    Serial.print(" ");
//    Serial.println(conc,HEX);
    delay(1000);
  }
  irsend.sendNEC(start, 32);
  delay(5000);
}

