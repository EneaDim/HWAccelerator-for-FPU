	
def MakeLayers(target, countcarry):						#function to create layer (not valid for the the first) 
	open('Matrix.txt', 'w').close()						#make the matrix file empty (delete the previous matrix)
	f=open('Matrix.txt', 'w')						#open matrix file to write the new matrix
	for row in range(target):						#for cycle to create the new matrix row by row
		for (col,value) in zip(range(64), countcarry):			#for cycle to evaluate for every col the associated #points to write
			if value<target:					#if #points to write is littler than target #row
				if row<value:					# --write #points to write 
					f.write('.')				#
				else:						#
					f.write('0')				#if there is no point to write, fill the gap writing zeros
			else:							#else:
				f.write('.')					#  --no zeros are present, write only points
		f.write('\n')							#
	f.close()								#
										#
def BornMatrix():								#function to create the first matrix (L17) consistently with the  
	f=open('Matrix.txt', 'w')						#booth recording
	start=0									#It's used '.' to indicate one generic bit, S to b(2j+1) Z to 
	stop=33									#not(b(2j+1)) and '1' and '0' for 1 and 0 respectively 
	for j in range(17):							#
		for b in range(64):						#
			if start<=b<stop: 					#
				f.write('.')
			elif (b==start-2 and j>0) or (j==0 and (b==stop or b==stop+1)):
				f.write('S')
			elif (b==stop and ((j != 0) and (j!=16))) or (j==0 and (b==stop+2)):
				f.write('Z')
			elif (b==stop+1 and ((j != 0) and (j!=16))):
				f.write('1')
			else:
				f.write('0')
		start+=2
		stop+=2
		f.write('\n')		
	f.close()

def GenerateHA(col, av_row_in, indexHA, pp_layer, numbHA, av_row_out, layer_target, prev_correction, correction): #generate one HA with its connection
	f=open('DaddaTree.vhd', 'a+')
	f.seek(0,2)
	f.write('HA'+str(indexHA)+'L'+str(pp_layer)+': HA port map( A=>outpp'+str(av_row_in)+'L'+str(pp_layer)+'('+str(col)+'), B=>outpp'+str(av_row_in+1)+'L'+str(pp_layer)+'('+str(col)+'), S=>outpp'+str(av_row_out+prev_correction)+'L'+str(layer_target)+'('+str(col)+') ,cout=>outpp'+str(correction)+'L'+str(layer_target)+'('+str(col+1)+'));\n' )
	f.close()

def GenerateFA(col, av_row_in, indexFA, pp_layer, numbFA, av_row_out, layer_target, prev_correction, correction): #generate one FA with its connection
	f=open('DaddaTree.vhd', 'a+')
	f.seek(0,2)
	f.write('FA'+str(indexFA)+'L'+str(pp_layer)+': FA port map(A=>outpp'+str(av_row_in)+'L'+str(pp_layer)+'('+str(col)+'), B=>outpp'+str(av_row_in+1)+'L'+str(pp_layer)+'('+str(col)+'), cin=>outpp'+str(av_row_in+2)+'L'+str(pp_layer)+'('+str(col)+'), S=>outpp'+str(av_row_out+prev_correction)+'L'+str(layer_target)+'('+str(col)+') ,cout=>outpp'+str(correction)+'L'+str(layer_target)+'('+str(col+1)+'));\n' )
	f.close()

def MakeName(pp_layers):																				#generate one signal for every bit of every layers
	f=open('DaddaTree.vhd', 'a+')
	f.seek(0,2)
	for pp_layer in pp_layers:
		if pp_layer!=2:
			f.write('signal ')
			for i in range(pp_layer):
					f.write('outpp'+str(i)+'L'+str(pp_layer))
					if i!=pp_layer-1:
						f.write(',')
			f.write(': std_logic_vector(63 downto 0);\n')										#the last register of the last layer has an additive bit for the last
		else:																				#carry_out, so it's used a 65 signal instead of one composed by 64,
			f.write('signal outpp0L'+str(pp_layer)+ ': std_logic_vector(64 downto 0);\n')		#but later it remains unused
			f.write('signal outpp1L'+str(pp_layer)+ ': std_logic_vector(63 downto 0);\n')
					
				
	f.write('begin\n')
	MakeConnectionFirst(f)
	f.close()

def MakeConnectionFirst(f):							#this function create the connections beetween the input of DaddaTree
	for g in range(17):							#and its first layer (L17)
		f.write('outpp'+str(g)+'L'+str(17)+'<=IN'+str(g+1)+';\n')


def MakeConnectionOthers(av_row_out, av_row_in, col, layer_target, pp_layer, row, prev_correction, correction): #function that creates an association 
	f=open('DaddaTree.vhd', 'a+')						#between the signal of the previous layer that are not been processed 
	f.seek(0,2)											#by FAs or HAs, and signal of the current layer;
	while av_row_out+prev_correction<layer_target:		#this considering the position yet engaged from the sum and curry of 
		if (av_row_in)<pp_layer:						#the previous computation
			f.write('outpp'+str(av_row_out+prev_correction)+'L'+str(layer_target)+'('+str(col)+')'+'<=outpp'+str(av_row_in)+'L'+str(pp_layer)+'('+str(col)+');\n')
		av_row_in+=1
		av_row_out+=1 
	f.close()





	





