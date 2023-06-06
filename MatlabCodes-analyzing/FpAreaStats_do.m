path = 'E:\footprint\FPresults\'; 
suffix = '*.mat';
file_list = dir(strcat(path,suffix));
area=[];
names=[];
for i =1:length(file_list)
    file = file_list(i).name;
    data = strcat(path,file);
    load (data);
    s = FpAreaStats(yrphi);
    area = [area s'];  % area of 50,70,90,99% ACFC
    names = [names,' ', file];
end 
