import subprocess
import os

subprocess.call("./lfsr/make.sh")
# os.system('a5.sh')
print open('lfsr/output.txt', 'r').read()
