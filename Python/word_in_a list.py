# Given a single page of a book, find me the longest word on the page.

words = "we are a great teacher teaching kids"  
word_list = words.split() 

def find_longest_word(word_list):
    longest_word = ''
    for word in word_list:
        if len(word) > len(longest_word):
            longest_word = word
    print(longest_word)

find_longest_word(word_list)

#################################################

words = "we are a great teacher teaching kids"  
word_list = words.split() 
data = sorted(word_list, key=len)
longest_word = data[-1:]
print(longest_word)


#######################################
words = "we are a great teacher teaching kids"  
word_list = words.split() 

def find_longest_word(word_list):  
    longest_word =  max(word_list, key=len)
    return longest_word
    print(longest_word)
    
find_longest_word(word_list)

#######################################



