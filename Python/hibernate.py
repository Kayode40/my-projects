import os

shutdown = input("Kayode do you want to hibernate your pc?: ")

if shutdown == "no":
    exit()
else:
    os.system("shutdown /h /f")