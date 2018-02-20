with open('picture.txt') as f:
    content = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
content = [x.strip() for x in content] 
print(len(content))

g = open("newdata.txt", "w")

for i in range(0,len(content)):
	g.write(content[i] + " ")
	if((i%20)==19):
		g.write("\n")