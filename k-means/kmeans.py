
text_file_name = "kmeanstest.txt"
text_file = open(text_file_name, "r")
needtoremovecomma = False
number_of_clusters = 2
writedata = False #write the data to file?
final_file_name = "kmeanseval.txt" #final file to add to
final_file_centers = 'kmeans_centers.txt' #file with the found centers of clusters



from random import randint

def file_len(fname):  #returns the length of file
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

 #returns the distance from one point to another / Make sure onepoint and anotherpoint are lists of same length
def distance(onepoint,anotherpoint):
	distance = 0
	for i in range(0,len(onepoint)):
		distance = distance + ((onepoint[i]-anotherpoint[i]) ** 2)
	return distance ** 0.5


#randomly initiates number of centers as points
def random_init(listofexamples,numclusters): 
	listofcenterpositions = [0]*numclusters
	for i in range(0,len(listofcenterpositions)):
		listofcenterpositions[i] = listofexamples[randint(0,len(listofexamples))]
	return listofcenterpositions #returns a list of the center points


#returns a list same length as the list of examples that corresponds to the center each point is closest to
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

#updates the positions of the centers to the middle of its assigned points
def updatecenterpositions(listofcenters,listofpoints,listofcenterpositions):
	emptycenters = 0
	for i in range(0,len(listofcenterpositions)):
		listofclosestpoints = []
		for j in range(0,len(listofcenters)):
			#print(str(listofcenters[j]) + " " + str(i))
			if(listofcenters[j] == i):
				listofclosestpoints.append(listofpoints[j])
		
		center = [0]*len(listofpoints[0])
		for y in range(0,len(center)):
			total = 0;
			for z in range(0,len(listofclosestpoints)):
				total = total + listofclosestpoints[z][y]
			center[y] = total/len(listofclosestpoints)
		listofcenterpositions[i] = center
	return listofcenterpositions

#computes the cost aka the sum of all the points to its centers
def compute_cost(listofcenters,listofpoints,listofcenterpositions):
	totaldistance = 0
	for i in range(0,len(listofpoints)):
		totaldistance = totaldistance + distance(listofpoints[i],listofcenterpositions[listofcenters[i]])
	return totaldistance


thelength = file_len(text_file_name)

lines = open(text_file_name).read().splitlines()

#gets rid of comma in the end of each line(if necessary)
if needtoremovecomma == True:
	for i in range(len(lines)):
		lines[i] = lines[i][:-2]

#print(lines[0])
#reads the points in the file
for i in range(len(lines)):
	lines[i] = list(map(float, lines[i].split(',')))

Lowest_cost = float('inf')
lowest_cost_listofcenters = []
lowest_cost_thecenters = []

#randomly initializes the centers

for moretimes in range(0,20):
	thecenters = random_init(lines,number_of_clusters) #2 is the desired number of clusters right now
	for times in range(0,10):
		#list of centers should be same length as number of points with each correspoinding to the point's closest center
		listofcenters = closestcenter(thecenters,lines) 
		print(listofcenters)
		thecenters = updatecenterpositions(listofcenters,lines,thecenters)
		print("Trial: " + str(moretimes) +" Iteration: "+ str(times) + " Cost: " + str(compute_cost(listofcenters,lines,thecenters))) #+ "  Centers: " + str(thecenters))
	if compute_cost(listofcenters,lines,thecenters) < Lowest_cost:
		Lowest_cost = compute_cost(listofcenters,lines,thecenters)
		lowest_cost_listofcenters = listofcenters
		lowest_cost_thecenters = thecenters


print(lowest_cost_listofcenters[0:60])
print(lowest_cost_listofcenters[60:100])
print(len(lines))
print(len(thecenters[0]))

if writedata == True:
	with open(final_file_name, "a") as myfile: #destination file to add to
		#myfile.write("appended text")
		myfile.write(str(listofcenters))
		myfile.write("\n")

	with open(final_file_centers, "a") as myfile: #destination file to add to
		#myfile.write("appended text")
		myfile.write(str(thecenters))
		myfile.write("\n")


