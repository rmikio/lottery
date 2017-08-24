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

ntotalgames = size(supermatrix,1);

analysislottery(supermatrix);


% Last 5 games
analysislottery(supermatrix(ntotalgames-5+1:ntotalgames,:));


% Last 10 games
analysislottery(supermatrix(ntotalgames-10+1:ntotalgames,:));


% Last 20 games
analysislottery(supermatrix(ntotalgames-20+1:ntotalgames,:));

% Last 30 games
analysislottery(supermatrix(ntotalgames-30+1:ntotalgames,:));

