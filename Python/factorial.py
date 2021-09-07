#answer = 1
#def factorial(number):
    #while number >= 1:
        #answer *= number 
        #number -= 1
        #return answer

#print(factorial(5))

#########################################
# def factorial(number):
#     array = [] 
#     value = number

#     while value > 0:
#         array.append(value)
#         value -= 1

#         result = 1
#         for i in array:
#             result *= i
#     print(result)

# factorial(5)
##########################################

#number = int(input("What number are you looking for it's factorial: "))

number = 5
factorial = 1

if number == 0 or number == 1:
    print("The factorial of", number, "is 1")
else:
    for i in range(1, number+1):
        factorial *= i
    print("The factorial of", number, "is", factorial)
