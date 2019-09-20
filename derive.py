#Project by: Sydnee Belcher
#Due: midnight, 2/21/19
#CS 312, Section 2
#Project desciption: 
#	Use the algorithm given by the professor to create a python code file
#	that reads in a grammar file from the command line and generates all 
#	terminal strings up to a length also specified in the command line.

import string
import sys   #to get command line arguments

filename = (sys.argv[-1])  #get file 
N = len(sys.argv)   #get length from cmd line input
storelist = []   #list to hold the grammer file productions
worklist = []  #worklist 
dict = {}  #dictonary for terminals and non-terminals 
dict2 = {}  #dictionary for 1s and 0s and statistics


for line in open(filename,"r"):    #open file and store each line in the storelist 
	storelist.append(line)

for i in(storelist):               #iterate through storelist and split it where there's an = sign     
	(key, val) = i.split(' = ')    #key = lhs, val = rhs
	if key in dict:              #if key is already in the dictionary, just add the new value to that key
		dict[key]+=(',' + val.rstrip('\n'))  #strip new char line from value
	else:
		dict[key] = val.rstrip('\n')      #if key not in dictionary, add the new key and the new value	

 
worklist.append(storelist[0][0])  #add start symbol to worklist
	
while (len(worklist)!= 0):
	s = worklist.pop(0)

	strsplit = s.split( ) #split current s to get length
	
	if (len(strsplit)) > N:
		continue
	
	index = 0
	for symbol in strsplit:     #iterate thru strsplit and keep track of index 
		if (symbol not in dict):
			index = index + 1

	if index == (len(strsplit)):  #if all the indexes are non-terminal,  
		dict2[symbol] = 1      #update entry for s
		print(dict2)
		continue              #skip next part

		
	for str in dict[strsplit[index]]:   #for the values of dict at that key
		strsplit[index] = str  #replace that index with the values of that key
		tmp = ' '.join(strsplit) #joins list elements together with a space and makes it a string
		worklist.append(tmp)   #push tmp onto worklist
		#print("updated worklist: ")
		#print(worklist)
		