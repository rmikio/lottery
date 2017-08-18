clear all;
close all;
clc;

nindex = 0;
fid = fopen('results.csv',"r");
	while (!feof(fid))
		nindex = nindex + 1;
		textline = fgetl(fid);
		auxnumbers = strsplit(textline,",");
		for j=1:5
			supermatrix(nindex,j) = str2num(auxnumbers{j+1});
		endfor
	endwhile
fclose(fid);

% process data

% most numbers sorted
% 1 to 35

freqnum = zeros(35,1);
nums = [1:35]';

for i=1:size(supermatrix,1)
	for j=1:size(supermatrix,2)
		freqnum(supermatrix(i,j),1) = freqnum(supermatrix(i,j),1) + 1;
	endfor
endfor

%hist(freqnum, nums);

%hist(freqnum, nums);
bar(nums,freqnum);

