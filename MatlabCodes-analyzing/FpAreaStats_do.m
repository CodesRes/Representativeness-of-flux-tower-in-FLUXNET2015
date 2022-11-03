path = 'E:\footprint_all\analysis\footprint\'; 
suffix = '*.mat';
file_list = dir(strcat(path,suffix));
area=[];
names=[];
for i =1:length(file_list)
    file = file_list(i).name;
    data = strcat(path,file);
    load (data);
    s = FpAreaStats(yrphi);
    area = [area s'];
    names = [names,' ', file];
end 
