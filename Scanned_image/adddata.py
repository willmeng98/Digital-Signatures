
destination_file_name = "alltestdata.txt"
origin_file_name = 'test2.txt'


with open(destination_file_name, "a") as myfile: #destination file to add to
	#myfile.write("appended text")

	with open(origin_file_name) as f:  #other file to read from
		content = f.readlines()
		# you may also want to remove whitespace characters like `\n` at the end of each line
		content = [x.strip() for x in content] 
		for item in content:
			myfile.write("\n")
			myfile.write(item)

print('Added all data from ' + origin_file_name + " to "+ destination_file_name)