from PIL import Image

import os

from skimage import data, io, filters

import numpy as np
import copy

img_name = 'test2.jpg'
text_file_name = 'test2.txt'
thelabel = 2; # what to label these pictures



img = Image.open(img_name) # image extension *.png,*.jpg
new_width  = 160
new_height = 224
img = img.resize((new_width, new_height), Image.ANTIALIAS)
img.save('newimg.png') # format may what u want ,*.png,*jpg,*.gif

image = io.imread('newimg.png')
#print(len(image))
#
#print(len(image[0]))

newimage = [[0]*160]*200


#for i in range(0,200):
#	for j in range(0,160):
		#newimage[i][j] = np.mean(image[i][j])
#		brightness = (float(image.__getitem__((i,j,0)))*(0.3)) +(float(image.__getitem__((i,j,1)))*(0.59)) + (float(image.__getitem__((i,j,2)))*(0.11))
#		newimage[i][j]=brightness
		#print(str(i)+"  "+str(j))

#print(len(image))
#print(len(image[0]))
#print(type(image))
#print(newimage)




#=================
oneimage = [[0]*40]*800
index1=0
index2=0


firstcol = [i[0:40] for i in image]
secondcol = [i[40:80] for i in image]
thirdcol = [i[80:120] for i in image]
fourthcol = [i[120:160] for i in image]


image1 = (np.mean(firstcol[0:40],2)).flatten()
image2 = (np.mean(firstcol[40:80],2)).flatten()
image3 = (np.mean(firstcol[80:120],2)).flatten()
image4 = (np.mean(firstcol[120:160],2)).flatten()
image5 = (np.mean(firstcol[160:200],2)).flatten()
image6 = (np.mean(secondcol[0:40],2)).flatten()
image7 = (np.mean(secondcol[40:80],2)).flatten()
image8 = (np.mean(secondcol[80:120],2)).flatten()
image9 = (np.mean(secondcol[120:160],2)).flatten()
image10 = (np.mean(secondcol[160:200],2)).flatten()
image11 = (np.mean(thirdcol[0:40],2)).flatten()
image12 = (np.mean(thirdcol[40:80],2)).flatten()
image13 = (np.mean(thirdcol[80:120],2)).flatten()
image14 = (np.mean(thirdcol[120:160],2)).flatten()
image15 = (np.mean(thirdcol[160:200],2)).flatten()
image16 = (np.mean(fourthcol[0:40],2)).flatten()
image17 = (np.mean(fourthcol[40:80],2)).flatten()
image18 = (np.mean(fourthcol[80:120],2)).flatten()
image19 = (np.mean(fourthcol[120:160],2)).flatten()
image20 = (np.mean(fourthcol[160:200],2)).flatten()


#for element in finals:
#	element.pop(0)

#with open("anotherdata.txt", "w") as myfile:
#	myfile.close()



with open(text_file_name, "w") as myfile: #destination file to add to
	#myfile.write("appended text")
	for item in image1:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image2:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image3:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image4:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image5:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image6:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image7:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image8:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image9:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image10:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image11:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image12:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image13:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image14:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image15:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image16:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image17:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image18:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image19:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")
	for item in image20:
		myfile.write(str(item) + ",")
	myfile.write(str(thelabel)) #label
	myfile.write("\n")



#print(newimage)

#print(oneimage[0])
#print(oneimage[1])
#print(oneimage[2])
#print(oneimage[3])
#print(finals[0])

print('Done converting A4 scanned image ' + img_name + " into the text file "+ text_file_name+ " with label " + str(thelabel))


