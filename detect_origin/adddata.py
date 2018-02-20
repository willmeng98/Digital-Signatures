with open("will_onetwo.txt", "a") as myfile: #destination file to add to
	#myfile.write("appended text")

	with open('data5.txt') as f:  #other file to read from
		content = f.readlines()
		# you may also want to remove whitespace characters like `\n` at the end of each line
		content = [x.strip() for x in content] 
		for item in content:
			myfile.write("\n")
			myfile.write(item)

print('done')