from subprocess import call
import serial
# import os


ser = serial.Serial('/dev/ttyACM0', 9600)
call("./make.sh", shell=True)
# os.system('a5.sh')
key = open('output.txt', 'r').read()
key = key.splitlines()
key = key[:-1]
key = ''.join([str(x) for x in key])
key = map(''.join, zip(*[iter(key)]*8))
key = key[:-1]
for i,x in enumerate(key):
    print hex(int(x,2))
    key[i] = int(x,2)
# key = ''.join(x.encode('hex') for x in key)
# key = ''.join([chr(x) for x in key])
key = ''.join([chr(x) for x in key])
print key
ser.write(key)
