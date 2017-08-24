clear all;
close all;
clc;

superindexi = 0;
superindexj = 0;

fidres = fopen('results.csv',"w");
debuglvl = 0;

for i=1991:2012
	filename = strcat(num2str(i),'.html');
	disp(filename);
	fid = fopen(filename, "r");
	while (!feof(fid))
		textline = fgetl(fid);
		posdash = findstr(textline,"-");
		if debuglvl >= 1
			disp(textline);
			disp(posdash);
			disp(length(posdash));
		endif
		jj = 0;
		for j=1:length(posdash)
			if debuglvl >= 1
				disp(jj);
				disp(j);
			endif
			j = j + jj; 
			if j > length(posdash)
			else
				if posdash(j) < 2 || posdash(j) > (length(textline) - 11)
				else
					auxstrnum0 = (substr(textline,posdash(j),1));
					auxstrnum1 = (substr(textline,posdash(j)-2,1));
					auxstrnum2 = (substr(textline,posdash(j)-1,1));
					auxstrnum3 = (substr(textline,posdash(j)+1,1));
					auxstrnum4 = (substr(textline,posdash(j)+2,1));
					if debuglvl >= 1
						disp(auxstrnum0);				
						disp(auxstrnum1);				
						disp(auxstrnum2);				
						disp(auxstrnum3);				
						disp(auxstrnum4);	
					endif
					if (auxstrnum1 >= 48 && auxstrnum1 <= 57) && (auxstrnum2 >= 48 && auxstrnum2 <= 57) && (auxstrnum3 >= 48 && auxstrnum3 <= 57) && (auxstrnum4 >= 48 && auxstrnum4 <= 57) 
							% need to read - it is a sequence
							superindexi = superindexi + 1;
							subtext = substr(textline,posdash(j)-2,14);
							jj = jj + 3;
							% process the sub_text
							auxnumbers = strsplit(subtext,"-");
							if debuglvl >= 1
								disp("Passei!");
								disp(jj);
								disp(j);
								disp(subtext);
								disp(auxnumbers);
							endif
							for k=1:5
								superindexj = k;
								supermatrix(superindexi,superindexj) = str2num(auxnumbers{k});
							endfor
					endif 
				endif
			endif
		endfor
	endwhile	
	fclose(fid);
endfor

nindex= 0; 
for i=1:size(supermatrix,1)
	nindex = nindex + 1;
	fprintf(fidres,'%d', nindex);
	for j=1:size(supermatrix,2)
		fprintf(fidres,',%d', supermatrix(i,j));
	endfor
	fprintf(fidres,'\n');
endfor

fclose(fidres);


