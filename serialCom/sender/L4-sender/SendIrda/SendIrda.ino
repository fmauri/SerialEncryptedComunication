#include <IRremoteInt.h>
#include <ir_Lego_PF_BitStreamEncoder.h>
#include <boarddefs.h>
#include <IRremote.h>

IRsend irsend;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
irsend.sendNec(0x8a75a45b, 32);
delay(300);
irsend.sendNec(0x8a75cb34, 32);
delay(300);
irsend.sendNec(0x8a75dd22, 32);
delay(300);
irsend.sendNec(0x8a75ed12, 32);
delay(300);
irsend.sendNec(0x8a75619e, 32);
delay(300);
irsend.sendNec(0x8a75b44b, 32);
delay(300);
irsend.sendNec(0x8a75a659, 32);
delay(300);
irsend.sendNec(0x8a75827d, 32);
delay(300);
irsend.sendNec(0x8a754eb1, 32);
delay(300);
irsend.sendNec(0x8a75fe01, 32);
delay(300);
irsend.sendNec(0x8a75a956, 32);
delay(300);
irsend.sendNec(0x8a757689, 32);
delay(300);
irsend.sendNec(0x8a7544bb, 32);
delay(300);
irsend.sendNec(0x8a7549b6, 32);
delay(300);
irsend.sendNec(0x8a752cd3, 32);
delay(300);
irsend.sendNec(0x8a75a15e, 32);
delay(300);
irsend.sendNec(0x8a75fa05, 32);
delay(300);
irsend.sendNec(0x8a75c03f, 32);
delay(300);
irsend.sendNec(0x8a75d22d, 32);
delay(300);
irsend.sendNec(0x8a757986, 32);
delay(300);
irsend.sendNec(0x8a7559a6, 32);
delay(300);
irsend.sendNec(0x8a75e21d, 32);
delay(300);
irsend.sendNec(0x8a7523dc, 32);
delay(300);
irsend.sendNec(0x8a7535ca, 32);
delay(300);
irsend.sendNec(0x8a75be41, 32);
delay(300);
delay(600000);
}
