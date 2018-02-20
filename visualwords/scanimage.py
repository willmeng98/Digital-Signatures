import os

from skimage import data, io, filters

import numpy as np


image = io.imread('pic1.png')
#print(image[0])
#print(len(image[0]))
#print(len(image))
#print(type(image[0][0][0]))
#print(np.mean(image[1]))
#filename = os.path.join(skimage.data_dir, '1pic.png')
#moon = io.imread(filename)

newimage = []

for i in range(0,len(image)):
	for j in range(0,len(image[i])):
		brightness = float(image[i][j][0])*(0.3) +float(image[i][j][1])*(0.59) +float(image[i][j][2])*(0.11)
		newimage += [brightness]

#print(newimage)
#print(image[0][0])

temp = [0]*(4000)
count = 0;
index = 0;
for i in range(0,200*200):
	temp[index] = temp[index] + newimage[i]
	count = count + 1
	if count == 10:
		count = 0
		index = index + 1
index = 0
count = 0
last = [0]*400
for i in range(0,4000):
	last[index] = last[index] + temp[i]
	index = index + 1
	if((index%20) == 0):
		index = index - 20
	if((i != 0)&(i%200 == 0)):
		index = index + 20

with open("anotherdata.txt", "w") as myfile:
	myfile.close()

with open("anotherdata.txt", "a") as myfile: #destination file to add to
	#myfile.write("appended text")
	for item in last:
		myfile.write(str(item) + ",")
	myfile.write("\n")

print('done')

#print(last)