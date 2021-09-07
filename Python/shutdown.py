import os

shutdown = input("Kayode do you want to shutdown your pc?: ")

if shutdown == "no":
    exit()
else:
    os.system("shutdown /s /t 1")