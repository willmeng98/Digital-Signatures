centers_file_name =  'kmeans_centers.txt'
test_data_file_name ='alltestdata_nolabel.txt'
needtoremovecomma =True

writedata = False
final_data_name = 'test_kmeans_final.txt'



import ast

def distance(onepoint,anotherpoint):
	distance = 0
	for i in range(0,len(onepoint)):
		distance = distance + ((onepoint[i]-anotherpoint[i]) ** 2)
	return distance ** 0.5

def closestcenter(listofcenterpositions,listofpoints): 
	listofcenters = [0]*len(listofpoints)
	for i in range(0,len(listofpoints)):
		closestcenter = -1
		closestdistance = float('inf')
		for j in range(0,len(listofcenterpositions)):
			if(distance(listofcenterpositions[j],listofpoints[i]) < closestdistance):
				closestdistance = distance(listofcenterpositions[j],listofpoints[i])
				closestcenter = j
		listofcenters[i] = closestcenter
	return listofcenters

thecenters = open(centers_file_name).readlines()
print(len(thecenters))
for i in range(0,len(thecenters)):
	thecenters[i] = ast.literal_eval(thecenters[i])

print(len(thecenters))
print(len(thecenters[1]))
print(len(thecenters[0][0]))

lines = open(test_data_file_name).read().splitlines()

if needtoremovecomma == True:
	for i in range(len(lines)):
		lines[i] = lines[i][:-2]


for i in range(len(lines)):
	lines[i] = list(map(float, lines[i].split(',')))
#print(lines)



centers = []
for i in range(len(thecenters)):
	centers += [closestcenter(thecenters[i],lines)]
print(centers)


if writedata == True:
	with open(final_data_name, "a") as myfile: #destination file to add to
		for item in centers:
			myfile.write(str(item))
			myfile.write("\n")

#print(lines[0])