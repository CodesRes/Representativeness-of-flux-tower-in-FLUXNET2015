path = 'E:\footprint\fpresult\'; 
cd(path)
suffix = '*.mat';
file_list = dir(strcat(path,suffix));
area=[];
names=[];
for i =1:length(file_list)
    file = file_list(i).name;
    s = FpAreaStats(file);
    area = [area s'];  % Area of 50,60,70,80% footprint 
    names = [names,' ', file];
end 
