% ============NDVIwindow size analysis==============
DataPath=sprintf('%s','E:\footprint_all\analysis\footprint\');
cd(DataPath)
datadir=dir('*.mat');

NDVIpath = 'E:\footprint_all\analysis\NDVI\';
%%
meanNDVIallsites = [];
for i = 1:length(datadir)
    DataName=datadir(i).name;
    RTSiteID=DataName(1:end-4);
    cd(NDVIpath)
    filename = strcat(RTSiteID,'.tif');
    NDVI=imread(filename);  
    [NDVI_row NDVI_col] = size(NDVI);

    % NDVI center location
    if mod(NDVI_row,2)==0
        row_center = NDVI_row/2;
    else
        row_center = (NDVI_row+1)/2;
    end 
    if mod(NDVI_col,2)==0
        col_center = NDVI_col/2;
    else
        col_center = (NDVI_col+1)/2;
    end 

    %% NDVI range of window size
    meanNDVI=[];
    for j = 1:3:148
      
        NDVIj = NDVI(row_center-j:row_center+j,col_center-j:col_center+j); 
        mean = mean2(NDVIj);
        meanNDVI = [meanNDVI ; mean];
    end 
    meanNDVIallsites = [meanNDVIallsites meanNDVI];
end 

%% save to xls
xlswrite('E:\footprint_all\analysis\WindowSize\meanNDVI.xls',meanNDVIallsites)

data = xlsread('E:\footprint_all\analysis\WindowSize\meanNDVI.xls')
for k=1:196
    plot(data(:,1),data(:,k+1));
    hold on
end 
xlabel('Window width (m)');
ylabel('NDVI')
print('-djpeg', 'E:\footprint_all\analysis\WindowSize\meanNDVI')

