%% calculate the mean NDVI within WindowSize
DataPath=sprintf('%s','E:\footprint_\fp\mat_all\');
cd(DataPath)
datadir=dir('*.mat');

NDVIpath = 'J:\footprint_second\NDVI\';

%%
meanNDVIallsites = [];
for i = 1:length(datadir)
    DataName=datadir(i).name;
    RTSiteID=DataName(1:end-4);
    cd(NDVIpath)
    filename = strcat(RTSiteID(1:6),'.tif');
    NDVI=imread(filename);  %read NDVI
    [NDVI_row NDVI_col] = size(NDVI);

    % index 
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

    %%  NDVI range of Window size
    meanNDVI=[];
    for j = 1:3:150 % ndvi spatial resolution is 10
        NDVIj = NDVI(row_center-j:row_center+j,col_center-j:col_center+j); % window size=30,90,150....2970 m
        mean = nanmean(nanmean(NDVIj));
        meanNDVI = [meanNDVI ; mean];
    end 
    meanNDVIallsites = [meanNDVIallsites meanNDVI];
end 

%% save to xls
xlswrite('E:\footprint_\WindowSize\meanNDVI.xls',meanNDVIallsites)
