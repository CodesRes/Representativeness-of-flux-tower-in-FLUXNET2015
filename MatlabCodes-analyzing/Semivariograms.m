%%--------------Semivariograms-----------------
%%
DataPath=sprintf('%s','E:\footprint\FPresults\');
cd(DataPath)
datadir=dir('*.mat');

NDVIpath = 'E:\footprint\NDVI\';

%%
for i = 1:length(datadir)
    DataName=datadir(i).name;
    RTSiteID=DataName(1:end-4);
    cd(DataPath);
    yrphi=load(DataName).yrphi;
    cumufp=footcumsort(yrphi)*100;
    
    pix=30;
    x_max = 2250;
    y_max = 2250;
    x = [-x_max:pix:x_max];
    y = [0:pix:y_max]; y=y(end:-1:1)';
    M = length(x);  % pixels in x direction
    N = length(y);  % pixels in y direction
    x_x = x(ones(1,N),:);
    y_y = y(:,ones(1,M));
    [n2,m2] = size(yrphi);
    [B,TransferF] = footprint_rotate(x_x,y_y,x_x,0);
    x_l = linspace(-pix*(TransferF.Bx+TransferF.x_offset),pix*(TransferF.Bx+TransferF.x_offset),m2);
    x_l = x_l(ones(1,n2),:);
    y_l = linspace(pix*(TransferF.By+TransferF.y_offset),-pix*(TransferF.By+TransferF.y_offset),n2)';
    y_l = y_l(:,ones(1,m2));

    [Cd,hd] = contour(x_l,y_l,filtfilt(fir1(20,1e-2,'low'),1,cumufp),[90 90],'k','LineWidth',2);
   
    % 90% footprint
    Cd1 = Cd(:,2:end);
    xmax = max(Cd1(1,:));
    xmin = min(Cd1(1,:));
    ymax = max(Cd1(2,:));
    ymin = min(Cd1(2,:));

    xmax_ind = min(find(x_l(1,:)>xmax));
    xmin_ind = max(find(x_l(1,:)<xmin));
    ymax_ind = max(find(y_l(:,1)>ymax));
    ymin_ind = min(find(y_l(:,1)<ymin));
    fprows = ymin_ind - ymax_ind;
    fpcols = xmax_ind - xmin_ind;

  
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
    a=fix(row_center-fprows/2);
    b=fix(row_center+fprows/2);
    c=fix(col_center-fpcols/2);
    d=fix(col_center+fpcols/2);

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
    rh_t=ones(1,max_h); 
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