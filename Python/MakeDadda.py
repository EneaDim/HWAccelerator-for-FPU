import FuncDadda							#import functions file
									#
FuncDadda.BornMatrix()							#function to generate the first layer
layers_target=[13, 9, 6, 4, 3, 2]  					#vector with number target of row for every layer
pp_layers=[17, 13, 9, 6, 4, 3, 2]					#vector with number of row for every layer
cnt=0 									#variable cnt is used to count number of points for every column
row=0									#variable row is used to keep value of row 
carry=0									#keep the value of carry for every column 
int_diff=0								#keep the value of FAs for every column
rem_diff=0								#keep the value of HAs for every column
diff=0 									#keep the value of difference between row and row target for every column
totFA=0									#keep the value of FAs for every column (support variable)
totHA=0									#keep the value of HAs for every column (support variable)
firstpoint=0								#keep the value of the first row with a point for every column
correction=0								#keep the number of actual column carry 
out=0									#keep the value of the first row (output matrix) not used yet
prev_correction=0							#keep the number of carry of the previous column

for layer_target, pp_layer  in zip(layers_target, pp_layers):		#for cycle to cycle togheter value of layer and of target layer
	if layer_target==13:						#if it's the first matrix :
		FuncDadda.MakeName(pp_layers)				#   -call function to do a name at each bit(signal) and also make the first connections
	newcnt=[]      							#initialaze an empty list to append the number of points to sum for every line  
	for a in range(64):						#for cycle to analyze every column (0 to 63)
		myfile=open('Matrix.txt', 'r')  			#open file to read the last saved matrix 
		for line in myfile: 					#analyze matrix line by line
			b=line[a]					#save in b variable char by char of the line 
			if b!='0':					#if the char is different from 0:
				cnt+=1					#   -increment count
				if cnt==1:                       	#if it's the first point of the column:
					firstpoint=row			#  --saved the value of row in the firstpoint variable
			row+=1						#every time change line of the file increment of the row variable	
		cnt_carry=cnt+carry					#cnt_carry keep the value of carry+cnt (effective number of points to sum)
		carry=0							#after this cnt reinitialize carry variable to 0 (for every column)
		newcnt.append(cnt_carry)				#append the value of cnt_carry at the list
		diff=(cnt_carry)-layer_target   			#calculate the difference between points to sum and the row of target layer
		if diff>0:						#if difference is grater than 0 it's necessary compression and so:
			int_diff=(diff//2)                              # --calculate number of FAs as the result integer part of 2 division of diff 
			rem_diff=(diff%2)                               # --calculate number of HAs as the reminder part of 2 division of diff 
			carry=int_diff+rem_diff				# --calculate carry as the tot number of resources needed
		if rem_diff!=0:						#if it's necessary to allocate HAs: 
			cntrem=0					#initialize a variable cntrem to generate the appropriate number of HAs
			while cntrem<rem_diff:				#do a while cycle until all HAs are generated
				FuncDadda.GenerateHA(a, firstpoint, totHA, pp_layer, cntrem, out, layer_target, prev_correction, correction) #generate one HA
				firstpoint+=2				#for every HAs num of input row not used increment of 2 (2 input for HA)
				out+=1					#for every HAs num of output row not used inc of 1 (1 output for HA in same col)
				totHA+=1				#number of HAs allocated in total so far 
				cntrem+=1				#increment cntrem(variable used for do the correct number of cycle)
				correction+=1				#variable to correct the available row in the next col considering carry
		if int_diff!=0:						#if it's necessary to allocate FAs: 
			cntint=0					#initialize a variable cntrem to generate the appropriate number of FAs
			while cntint<int_diff:				#do a while cycle until all FAs are generated
				FuncDadda.GenerateFA(a, firstpoint, totFA, pp_layer, cntint, out, layer_target, prev_correction, correction) #generate one FA
				firstpoint+=3				#for every FAs num of input row not used increment of 3 (3 input for FA)
				out+=1					#for every FAs num of output row not used inc of 1 (1 output for FA in same col)
				totFA+=1				#number of FAs allocated in total so far
				cntint+=1				#increment cntint(variable used for do the correct number of cycle)
				correction+=1				#variable to correct the available row in the next col considering carry

		FuncDadda.MakeConnectionOthers(out, firstpoint, a, layer_target, pp_layer, row, prev_correction, correction) #associate signals
		out=0							#reinitialize out to 0
		firstpoint=0						#reinitialize reg to 0
		int_diff=0						#reinitialize int_diff to 0
		rem_diff=0						#reinitialize rem_diff to 0
		diff=0							#reinitialize diff to 0
		cnt=0							#reinitialize cnt to 0
		row=0							#reinitialize row to 0
		prev_correction=correction				#load in prev_correction variable the value of correction (#carry in prev col)
		correction=0						#reinitialize correction to 0
	FuncDadda.MakeLayers(layer_target, newcnt)			#Function to create the next matrix
	myfile.close()							#close matrix file

f=open('DaddaTree.vhd', 'a+')						#open vhd file to write without overwrite	
f.seek(0,2)								#command to start from the bottom of the file
f.write('P1<=outpp0L2(63 downto 0);\n')					#write on vhd file
f.write('P2<=outpp1L2;\n')						#write on vhd file
f.write('end Behavioral;')						#write on vhd file
f.close()								#close file vhd


