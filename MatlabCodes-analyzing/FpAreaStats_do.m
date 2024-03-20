path = 'E:\footprint_\fp\mat_all\'; 
cd(path)
suffix = '*.mat';
file_list = dir(strcat(path,suffix));
area=[];
names=[];


for i =1:length(file_list)
    file = file_list(i).name;
    s = FpAreaStats(file);
    area = [area s'];  % 50,60,70,80% footprint area
    names = [names,' ', file];
end 
