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
totsize = length(nums);

for i=1:size(supermatrix,1)
	for j=1:size(supermatrix,2)
		freqnum(supermatrix(i,j),1) = freqnum(supermatrix(i,j),1) + 1;
	endfor
endfor

for i=1:totsize
	freqnum2(i,1) = i;
	freqnum2(i,2) = freqnum(i,1);
endfor

% order freqnum

%hist(freqnum, nums);

%hist(freqnum, nums);
figure
bar(nums,freqnum);

% order freq numbers sorted - order freqnum2

notcomplete = 1;
orderfreqnum = freqnum2;
counter = 0;

while notcomplete
	notcomplete = 0;
	counter = counter + 1;
	% printf("Passei %d \n",counter);
	for i=1:totsize-1
		if orderfreqnum(i,2) > orderfreqnum(i+1,2)
			notcomplete = 1;	
			aux = orderfreqnum(i,2);
			orderfreqnum(i,2) = orderfreqnum(i+1,2);
			orderfreqnum(i+1,2) = aux;
			aux = orderfreqnum(i,1);
			orderfreqnum(i,1) = orderfreqnum(i+1,1);
			orderfreqnum(i+1,1) = aux;
		endif
	endfor
endwhile

% show top 5 numbers less sorted
%figure
%bar(orderfreqnum(1:5,2),orderfreqnum(1:5,1));
printf("-----\n");
printf("Frequency\tNumber\n");
printf("-----\n");

for i=1:5
	printf("%d\t%d\n",orderfreqnum(i,2),orderfreqnum(i,1));
endfor

% show bottom 5 numbers less sorted (top 5 most sorted)
%figure
%bar(orderfreqnum(totsize-5:totsize,2),orderfreqnum(totsize-5:totsize,1));

for i=totsize-5:totsize
	printf("%d\t%d\n",orderfreqnum(i,2),orderfreqnum(i,1));
endfor




