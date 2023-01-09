#!/bin/python
import os

string = """#!/bin/python
import os

string = {dq}{dq}{dq}{string}{dq}{dq}{dq}

i = {i}
if i > 0:
	if os.path.exists("Sully_5.py") == True:
		i -= 1
	name = 'Sully_' + str(i) + '.py'
	try :
		f = open(name, 'w+')
		f.write(string.format(dq='"', nl=chr(10), i=i, string=string))
		f.close()
		if i:
			os.system('python ' + name)
	except:
		print("error"){nl}"""

i = 5
if i > 0:
	if os.path.exists("Sully_5.py") == True:
		i -= 1
	name = 'Sully_' + str(i) + '.py'
	try :
		f = open(name, 'w+')
		f.write(string.format(dq='"', nl=chr(10), i=i, string=string))
		f.close()
		if i:
			os.system('python ' + name)
	except:
		print("error")
