#!/bin/python

top = """#!/bin/python

top = {dq}{dq}{dq}{top}{dq}{dq}{dq}
"""
filename = "Grace_kid.py"
bottom = """filename = "{filename}"
bottom = {dq}{dq}{dq}{bottom}{dq}{dq}{dq}
try:
	f = open("{filename}", "w+")
	f.write(top.format(dq='"', top=top))
	f.write(bottom.format(dq='"', bottom=bottom, filename=filename))
	f.close()
except:
	print("error")
#c
"""
try:
	f = open("Grace_kid.py", "w+")
	f.write(top.format(dq='"', top=top))
	f.write(bottom.format(dq='"', bottom=bottom, filename=filename))
	f.close()
except:
	print("error")
#c
