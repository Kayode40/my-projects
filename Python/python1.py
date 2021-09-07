approve = input("Are you ready to use my program? ")
approve_list = ["yeah", "yes", "yh", "y"]
if approve in approve_list:

	print("Welcome!, this is a simple python program!")

	name = input("What is your name: ")
	age = int(input("How old are you?: "))
	day = age * 365
	hour = day * 24
	minute = hour * 60
	names = ["Ade", "Bola", "Shade", "Kola", "Bolu"]

	if name in names:
		print("Welcome to the game" ,name, "you are" ,age, "years old. Please proceed to to next stage")
	else:
		print ("I still calculated your age" ,name, "and not in any way close to " ,hour, "hours")
else:
	print("Goodbye!, and thanks for using my program!")