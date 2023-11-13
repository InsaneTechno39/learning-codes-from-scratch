#introduction: Python syntax cheatsheet.

#Datatypes: int, float, string, touple, list, etc.

a, b = 12, 3.141
c = "String"
d = 'Single Quote String'
e = '1'
j = complex(1 ,2)


#Operations on variables

print(a+b)
print(c+d)
print("Here is a complex number: ", j)
print('This is the conjugate of the complrx number: ', j.conjugate())
print(int(e)- b)
print(e+str(a))
print(e+c)

#Taking user input

f = input('Give an input: ')        #Takes user input and stores in the container f as a string.

g = int(input('Enter a Number: '))     #Takes user input and stores in the container f as an integer.

print('An input "', f , '" has been passed')

print(a+int(f))

print('Type of the input is:', type(f))  #This funnction will print the datatype of the variable

#Operation on Strings

s = 'This is a "String" of characters.'

print(s)

#1. Casing of String

print("Uppercase: ", s.upper())
print("Lowercase: ", s.lower())



# 2. Slicing of string

