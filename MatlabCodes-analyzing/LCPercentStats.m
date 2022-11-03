path = 'E:\footprint_all\analysis\LCoverStats\data\';
file_list = dir(path);
result = zeros(196,18);
for i=3:length(file_list)
    name = strcat(path,file_list(i).name);
    name
    [A B] = xlsread(name);
    data = A(:,7:9);
    data(data(:,1)==0)=18;
    

    [new_id, ~, percent_summed] = find(sparse(data(:,1), data(:,1), data(:,3)));
    for j=1:length(new_id)
        index = new_id(j);
        result(i-2,index) = percent_summed(j);
    end
end
xlswrite('E:\footprint_all\analysis\LCoverStats\LCPercent.xlsx',result)

