#Import the required module for text
# to speech converstaion
import pyttsx3

#init fucntion to get an engine instance
engine = pyttsx3.init()

#say method for input text to be spoken
engine.say("Hello Johnson, how are you doing today")

# run and wait method, it processes teh voice commands.
engine.runAndWait()