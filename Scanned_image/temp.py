







print(len(image1))
print(image1[0:1000])
print(len(image1))
#image.tolist()

for i in range(0,200):
	for j in range(0,160):
		oneimage[index1][index2]= (float(image.item((i,j,0)))*(0.3)) +(float(image.item((i,j,1)))*(0.59)) + (float(image.item((i,j,2)))*(0.11))
		#print(str(i) + " " + str(j) + " " + str(index1) + " " + str(index2) + " " + str(image[i][j]) + " " + str(oneimage[index1][index2])) #+ str((float(image[i][j][0])*(0.3)) +(float(image[i][j][1])*(0.59)) + (float(image[i][j][2])*(0.11))))
		#print(oneimage[index1][index2])
		index2 = index2 + 1
		if(index2 == 40):
			index2 = 0;
			index1 = index1 + 1
		#print(str(oneimage[index1][index2]) + " " + str(index1) + " " + str(index2))
#print(oneimage)
finals = [[0]]*20
index1=0

image1 = image[0:40][0:40]

print('---------')

print(oneimage[0])
print(oneimage[1])
oneimage[1][0] = 138.0
oneimage[1][1] = 99.9
print(oneimage[0])
print(oneimage[1])
#print(oneimage)

print('==================')
print(len(oneimage))
print(len(oneimage[0]))

print(finals[0])
print(finals[1])
print(oneimage[0])
print(oneimage[1])

finals[0] += oneimage[0]

print(len(finals[0]))
print(len(finals[1]))

print(finals[0])
print(finals[1])

justtest = []
nextimage1 = oneimage[0:160]
nextimage2 = oneimage[160:320]
nextimage3 = oneimage[320:480]
justtest += nextimage1[::4]
res = [x for lst in justtest for x in lst]



#for i in range(0,160):
#	finals[index1] += oneimage[i]
#	print(str(len(finals[0]))+ ' ' + str(len(finals[1])))
#	index1 = index1 + 1
#	if(index1 == 4):
#		index1 = 0
#index1 = 4
#for i in range(160,320):
#	finals[index1] += oneimage[i]
#	index1 = index1 + 1
#	if(index1 == 8):
#		index1 = 4
#
#index1 = 8
#for i in range(320,480):
#	finals[index1] += oneimage[i]
#	index1 = index1 + 1
#	if(index1 == 12):
#		index1 = 8
#index1 = 12
#for i in range(480,640):
#	finals[index1] += oneimage[i]
#	index1 = index1 + 1
#	if(index1 == 16):
#		index1 = 12
#index1 = 16
#for i in range(640,800):
#	finals[index1] += oneimage[i]
#	index1 = index1 + 1
#	if(index1 == 20):
#		index1 = 16

print(len(finals[1]))