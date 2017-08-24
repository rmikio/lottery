# GNU Octave script
# Usage: findgame([2,3,8,10,27])
#        numbers need to be provided in crescent order
# MassCash numbers go from 0 to 35

function y = findgame(seq)

close all;
clc;

nindex = 0;
fid = fopen('results.csv',"r");
	while (!feof(fid))
		nindex = nindex + 1;
		textline = fgetl(fid);
		auxnumbers = strsplit(textline,";");
		for j=1:5
			supermatrix(nindex,j) = str2num(auxnumbers{j+2});
		endfor
	endwhile
fclose(fid);

ngames = size(supermatrix,1)

seq

igame = 0;
found = 0;
notfound = 1;

while (notfound)
	igame = igame + 1;

	if igame > ngames
		notfound = 0;
	else
		for j=1:5
			if seq(j) == supermatrix(igame,j)
				found = found + 1;
			endif
		endfor
		if found == 5
			notfound = 0;
			printf("Found sequence at game %d !!! \n\n\n", igame);
		else
			found = 0;
			notfound = 1;
		endif
	endif

endwhile

if (found==0)
	printf("Sequence was not found! \n\n\n");
endif
