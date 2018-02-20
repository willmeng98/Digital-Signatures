from PIL import Image

import os

from skimage import data, io, filters

import numpy as np
import copy

img_name = 'train2a.jpg'
text_file_name = 'featurestest2.txt'
add_label = True
thelabel = 2; # what to label these pictures

feature_size = 45 #square size of feature

different_feature_bias


#picture is a 2d array, cannot be smaller than featuresize
#returns 2d array indicating intensity of feature at each point
def feature_rating(featuresize,picture):
	ratings = [[0]*(len(picture[0]) - featuresize)]*(len(picture) - featuresize)
	newarray = []
	index = 0
	for pixelx in range(0,len(ratings)):
		for pixely in range(0,len(ratings[pixelx])):
			#print('1 ' + str(pixelx) + " " + str(pixely))
			average = 0 #average of the pixels in the featuresize
			for i in range(0,featuresize):
				for j in range(0,featuresize):
					average = average + picture[pixelx+i][pixely+j]
			average = average/(featuresize*featuresize)
			# print("average",  average)
			totaldifference = 0 #difference between each pixel and the average
			for i in range(0,featuresize):
				for j in range(0,featuresize):
					totaldifference = totaldifference + abs(picture[pixelx+i][pixely+j] - average)
			ratings[pixelx][pixely] = totaldifference
			#print(type(ratings[pixelx][pixely]))
			#print(type(totaldifference))
		#print(ratings[pixelx])
		newarray.append(list(ratings[pixelx]))
		#print(ratings[pixelx])
		#print(newarray[index])
		index = index + 1
		#print(type(ratings[pixelx]))
		#print(type(newarray))
			# print ("ratings[%s][%s]"% (pixelx, pixely), ratings[pixelx][pixely])
			#print(str(pixelx) + " " + str(pixely) + " " + str(average) + " " + str(totaldifference))
			#print(ratings[pixelx][pixely])
			#print(str(pixelx) + " " + str(pixely))
	#print(ratings[150][50])
	#print(np.sum(newarray, 0))
	#print(newarray)
	return newarray

#takes in a 2d array and returns a list of the positions of the most distinct features
def highest_features(featureslist,numberoffeatures):
	thelist = []
	while numberoffeatures != 0:
		highestx = -1;
		highesty = -1;
		highestintensity = -1
		for i in range(0,len(featureslist)):
			for j in range(0,len(featureslist[0])):
				if(featureslist[i][j] > highestintensity):
					highestintensity = featureslist[i][j]
					highestx = i
					highesty = j
		thelist.append([highestx,highesty])
		#print([highestx,highesty])
		#print(thelist)
		#clear the ones around it so we do not take same features in the same area multiple times
		#20x20 pixels around it
		therange = 20

		#5
		if((highestx >= therange )&(highesty >= therange)&(highestx < (len(featureslist) - therange)) &(highesty < (len(featureslist[0]) - therange))):
			for i in range(highestx - therange,highestx + therange):
				for j in range(highesty - therange,highesty + therange):
					featureslist[i][j] = -1

		#2
		if((highestx >= therange )&(highestx <= (len(featureslist) - therange))&(highesty < therange)):
			for i in range(highestx - therange,highestx + therange):
				for j in range(0,highesty + therange):
					featureslist[i][j] = -1

		#4
		if((highestx < therange )&(highesty >= therange)&(highesty < (len(featureslist[0]) - therange))):
			for i in range(0,highestx + therange):
				for j in range(highesty - therange,highesty + therange):
					featureslist[i][j] = -1
		#1
		if((highestx < therange )&(highesty < therange)):
			for i in range(0,highestx + therange):
				for j in range(0,highesty + therange):
					featureslist[i][j] = -1

		#3
		if((highestx >= (len(featureslist) - therange))& (highesty < therange)):
			for i in range(highestx - therange,len(featureslist)):
				for j in range(0,highesty + therange):
					featureslist[i][j] = -1

		#6
		if((highestx >= (len(featureslist) - therange))& (highesty >= therange)&(highesty < (len(featureslist[0]) - therange)) ):
			for i in range(highestx - therange,len(featureslist)):
				for j in range(highesty - therange,highesty + therange):
					featureslist[i][j] = -1

		#7
		if((highestx < therange )&(highesty >= (len(featureslist[0]) - therange))):
			for i in range(0,highestx + therange):
				for j in range(highesty - therange,len(featureslist[0])):
					featureslist[i][j] = -1

		#8
		if((highestx >= therange )&(highestx < (len(featureslist) - therange))&(highesty >= (len(featureslist[0]) - therange))):
			for i in range(highestx - therange,highestx + therange):
				for j in range(highesty - therange,len(featureslist[0])):
					featureslist[i][j] = -1

		#9
		if((highestx >= (len(featureslist) - therange))&(highesty >= (len(featureslist[0]) - therange))):
			for i in range(highestx - therange,len(featureslist)):
				for j in range(highesty - therange,len(featureslist[0])):
					featureslist[i][j] = -1

		numberoffeatures = numberoffeatures - 1
	return thelist

########NEEED TO TEST COULD BE VERY BUGGY###########


def extractfeatures(picturelist,featurepositions,featuresize):
	allfeatures = []
	for aposition in featurepositions:
		xpositions = list(picturelist[aposition[0]:aposition[0]+featuresize])
		#print(aposition[0],aposition[1])
		entirefeature = [item[aposition[1]:aposition[1] + featuresize] for item in xpositions] #same as flatten()
		entirefeature = sum(entirefeature, [])
		#print(entirefeature)
		#feature = picturelist[aposition[0]:aposition[0]+featuresize][aposition[1]:aposition[1]+featuresize]
		allfeatures.append(entirefeature)
	print(len(allfeatures))
	print(len(allfeatures[0]))
	return allfeatures

########NEXT TIME: ^THAT IS NOT OK, NEED TO LOOK AT A4 AND DO THE SAME, ALSO DO NOT FORGET TO FLATTEN KKBYE



img = Image.open(img_name) # image extension *.png,*.jpg

new_width  = 800
new_height = 1120
img = img.resize((new_width, new_height), Image.ANTIALIAS)
img.save('newimg.png') # format may what u want ,*.png,*jpg,*.gif

image = io.imread('newimg.png')
#print(len(image))
#
#print(len(image[0]))

firstcol = [i[0:200] for i in image]
secondcol = [i[200:400] for i in image]
thirdcol = [i[400:600] for i in image]
fourthcol = [i[600:800] for i in image]

image1 = (np.mean(firstcol[0:200],2)).tolist()

#print(image1)
#print(type(image1))
print(len(image1))
print(len(image1[0]))

thelist = feature_rating(feature_size,image1)
#print(thelist)

highestfeatures = highest_features(thelist,10)
print(highestfeatures)

the_features = extractfeatures(image1,highestfeatures,feature_size)


#print(feature_rating(20,image1))


with open(text_file_name, "w") as myfile: #destination file to add to
	for afeature in the_features:
		for item in afeature:
			myfile.write(str(item) + ",")
		if add_label == True:
			myfile.write(str(thelabel))
		myfile.write("\n")




