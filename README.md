# SerialEncryptedComunication
## Securing IrDA transmission with A5/1 - two-weeks long assignment.
* Using Arduino platform and the IrDA hardware from the showcase build a transmission link protected with A5/1 (or similar, taken from List 2) implementation of stream cipher. 
* There are two cases to implement:
  * The two communicating PCs separately produce the keychains from A5/1 and pass it to Arduino boards using UART. The encrypted message is sent between the Arduinos over IrDA link.
  * The two communicating Adruino boards are connected via UART link for message transmission. The keystream is received from the sending PC via UART link and forwared in parallel with the cryptogram via IrDA link.
