import ast

text_file_name = 'kmeanseval.txt' #kmeans data

lines = open(text_file_name).read().splitlines()

#print(lines)
for i in range(len(lines)):
	lines[i] = ast.literal_eval(lines[i])

#print(lines)




#================
output = ""
file_name = "alltrainingdata_nolabel.txt"
final_file_name = "alltrainingdata_nolabel_kmeans.txt"

lines2 = open(file_name).readlines()

for k in range(0,len(lines2)):
	for i in range(0,len(lines)):
		string_to_add = str(lines[i][k]) + ","
		lines2[k] = ''.join([lines2[k].strip(), string_to_add, '\n'])

#print(len)

#for i in range(0,len(lines)):
#	for j in range(0,len(lines[0])):
#		for k in range(0,len(lines2)):
#			string_to_add = str(lines[i][j]) + ","
#			lines2[k] = ''.join([lines2[k].strip(), string_to_add, '\n'])

#sprint(lines2)



#====== adds label too!
with open(final_file_name, "w") as myfile:
	for i in range(0,60):
		myfile.write(''.join([lines2[i].strip(), '1', '\n']))
	for i in range(60,100):
		myfile.write(''.join([lines2[i].strip(), '2', '\n']))

print('Added kmeans data AND designated label!')

