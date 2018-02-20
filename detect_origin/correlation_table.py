import ast

words_file_name = 'all_words_training.txt'

data_file_name = 'training_data_noheader.txt'

allwords = open(words_file_name).readlines()

words_list = ast.literal_eval(lines[0])

the_matrix = [[0]*len(words_list)]*len(words_list)


lines = open(data_file_name).readlines()

for i in range(0,len(lines)):
