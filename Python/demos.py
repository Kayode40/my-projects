# number = 10
# great = "The value selected is greater than 10"
# small = "The value selected is less than 10"

# result = great if 20 > number else small

# print(result)


# def reverse(word):
#     start = 0
#     last = len(word) - 1
#     r_word = ""

#     while last >= start:
#         r_word += word[last] 
#         last -= 1
#     return r_word

# print(reverse("group"))


def factorial(number):
    array = [] 
    value = number

    while value > 0:
        array.append(value)
        value -= 1

        result = 1

        for i in array:
            result *= i

    print(result)

factorial(5)



