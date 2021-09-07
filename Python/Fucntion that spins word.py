# Write a function that takes in a string of one or more words, and returns the same string, 
# but with all five or more letter words reversed (Just like the name of this Kata). 
#Strings passed in will consist of only letters and spaces. 
#Spaces will be included only when more than one word is present.

# Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
# spinWords( "This is a test") => returns "This is a test" spinWords( "This is another test" )=> returns "This is rehtona test"

def spin_words(sentence):
    # Your code goes here
    start_index = 0
    last_index = len(sentence) - 1
    result = ""
    while last_index >= start_index:
        result += sentence[last_index]
        last_index -= 1
    return result

spin_words("we are happy")