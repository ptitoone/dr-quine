#!/bin/python


#c
string = """#!/bin/python


#c
string = {dq}{dq}{dq}{string}{dq}{dq}{dq}
def out():
	print(string.format(dq='"', string=string)),

def main():
	#c
	out()

if __name__=="__main__":
	main()"""
def out():
	print(string.format(dq='"', string=string)),

def main():
	#c
	out()

if __name__=="__main__":
	main()
