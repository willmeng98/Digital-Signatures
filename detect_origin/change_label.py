f = open("newcircleslabeled.txt", "w") #destination file

parsed_file = []
with open('will_circles2.txt','r') as inf: #file to open
    for line in inf:
        parsed_file.append(list(eval(line)))

for i in parsed_file:
    i[len(i)-1]  = 2  # NEW LABEL
    f.write((", ".join( repr(e) for e in i ))  + '\n')
    