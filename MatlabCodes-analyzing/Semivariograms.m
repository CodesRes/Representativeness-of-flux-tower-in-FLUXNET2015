%%--------------semivariograms-----------------
%%
DataPath=sprintf('%s','E:\footprint\fpresult\');
cd(DataPath)
datadir=dir('*.mat');

NDVIpath = 'J:\footprint_second\NDVI\';

%%
for i = 1:126%:length(datadir)
    DataName=datadir(i).name;
    RTSiteID=DataName(1:end-4);
    cd(DataPath);
    fp=load(DataName).output;
    
    xx1 = fp(:,1);
    yy1 = fp(:,2);
    xx2 = fp(:,3);
    yy2 = fp(:,4);
    xx3 = fp(:,5);
    yy3 = fp(:,6);
    xx4 = fp(:,7);
    yy4 = fp(:,8);

    indice1 = find(abs(xx1)==0 & abs(yy1) ==0);
    indice2 = find(abs(xx2) ==0 & abs(yy2) ==0);
    indice3 = find(abs(xx3) ==0 & abs(yy3) ==0);
    indice4 = find(abs(xx4) ==0 & abs(yy4) ==0);
    if isempty(indice1)
        xx11=xx1;yy11=yy1;
    else
        indices_to_keep = setdiff(1:length(xx1), indice1);
        xx11 = xx1(indices_to_keep);
        yy11 = yy1(indices_to_keep);
    end
    if isempty(indice2)
        xx22=xx2;yy22=yy2;
    else
        indices_to_keep = setdiff(1:length(xx2), indice2);
        xx22 = xx2(indices_to_keep);
        yy22 = yy2(indices_to_keep);
    end
    if isempty(indice3)
        xx33=xx3;yy33=yy3;
    else
        indices_to_keep = setdiff(1:length(xx3), indice3);
        xx33 = xx3(indices_to_keep);
        yy33 = yy3(indices_to_keep);
    end
    if isempty(indice4)
        xx44=xx4;yy44=yy4;
    else
        indices_to_keep = setdiff(1:length(xx4), indice4);
        xx44 = xx4(indices_to_keep);
        yy44 = yy4(indices_to_keep);
    end
   
    % 80% footprint
    xmax = max(xx44);
    xmin = min(xx44);
    ymax = max(-yy44);
    ymin = min(-yy44);

    
    filename = strcat(RTSiteID(1:6),'.tif')

    cd(NDVIpath)
    NDVI=imread(filename);  %NDVI
    [NDVI_row NDVI_col] = size(NDVI);
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


    a=row_center-ceil(abs(ymin)/10);
    b=row_center+ceil(abs(ymax)/10);
    c=col_center-ceil(abs(xmin)/10);
    d=col_center+ceil(abs(xmax)/10);

    Picolor = NDVI(a:b,c:d);

    [m,n]=size(Picolor); 
    mean_m=mean(Picolor,2); 
    mean_n=mean(Picolor,1); 
    temp=0; 
    max_h=fix(min(m,n)*0.35); 


    sum_h=0;
    Nh_h=0; 
    rh_h=ones(1,max_h); 
    clear h;
    for h = 1:1:max_h 
        for i = 1:1:m    
            for j =1:1:n-h     
                temp=power((Picolor(i,j)-Picolor(i,j+h)),2); 
                if isnan(temp)
                    continue
                else
                    sum_h=sum_h+temp;  
                    Nh_h=Nh_h+1;
                end
            end
        end
        rh_h(1,h)=sum_h/(Nh_h*2); 
    end


    sum_v=0; 
    Nh_v=0;  
    rh_v=ones(1,max_h); 
    for h = 1:1:max_h   
        for j = 1:1:n   
            for i =1:1:m-h     
                temp=power((Picolor(i,j)-Picolor(i+h,j)),2);
                if isnan(temp)
                    continue
                else
                    sum_v=sum_v+temp;  
                    Nh_v=Nh_v+1;
                end
                 
            end
        end
        rh_v(1,h)=sum_v/(Nh_v*2); 
    end

    
    sum_s=0; 
    Nh_s=0; 
    rh_s=ones(1,max_h);
    for h=1:1:max_h
        for i=1:1:m-h 
            for j=1:1:n-h
                temp=power((Picolor(i,j)-Picolor(i+h,j+h)),2);
                if isnan(temp)
                    continue
                else
                    sum_s=sum_s+temp;
                    Nh_s=Nh_s+1;
                end
            end
        end
        rh_s(1,h)=sum_s/(Nh_s*2);
    end


    sum_t=0; 
    Nh_t=0; 
    rh_t=ones(1,max_h); %
    for h=1:1:max_h
        for i=1:1:m-h
            for j=n:-1:1+h
                temp=power((Picolor(i,j)-Picolor(i+h,j-h)),2);
                if isnan(temp)
                    continue
                else
                    sum_t=sum_t+temp;
                    Nh_t=Nh_t+1;
                end
            end
        end
        rh_t(1,h)=sum_t/(Nh_t*2);
    end

    x_0_90=[1:max_h]; 
    x_45_135=[sqrt(2):sqrt(2):max_h*sqrt(2)];
    semivar_0_90=[x_0_90; rh_h ;rh_v];
    semivar_45_135=[x_45_135; rh_t; rh_s]; 
    data = [semivar_0_90; semivar_45_135];
    omni_semivar = mean(data([2 3 5 6],:),1);
    data = [data;omni_semivar];
    xlswrite(strcat('E:\footprint\semivar\',RTSiteID,'.xls'),data);
    clear rh_h rh_v rh_t rh_s;

end