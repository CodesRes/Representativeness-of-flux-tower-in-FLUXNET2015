% ===========50，60，70，80%fp-weighted land cover percentage==========

%% Adding paths containing code to default MATLAB workspace
% ---Obtaining the file names in the special directory---
RootPath=sprintf('%s','E:\1_PDH\phd-2-1\footprint\Mcode');
cd('E:\1_PDH\phd-2-1\footprint\Mcode')  % the dir of function AddWorkspace
AddWorkspace(RootPath)

% information initialized

% DataPath=sprintf('%s','E:\footprint\fpresult\');
DataPath=sprintf('%s','E:\footprint_\fp结果\mat_measured_post\');

cd(DataPath)
datadir=dir('*.mat');
% datadir=dir('*vsigma.mat');
[r,c]=size(datadir);

LCPath=sprintf('%s','J:\footprint_second\LC_TIF\整合后所有的\');
cd(LCPath)
LCdir=dir('*.tif');

% footprint weigted
FFP_weightPath='E:\footprint_\fp结果\ffp_measured';
AddWorkspace(FFP_weightPath)

CA_LC=[];
US_LC=[];
%% 
for j=1:9%2:r
    j

    cd(DataPath)
    datadir(j).name  %show the data being processed
    DataName=datadir(j).name; %cumulative footprint
    RTSiteID=DataName(1:end-4);

    % reading LC data
    cd(LCPath)
%     LCName=sprintf('%s%s',RTSiteID,'.tif');
    LCName=sprintf('%s%s',RTSiteID(1:6),'.tif');
    disp(LCName)
    Landcover=imread(LCName);
    Landcover=RegulationMatrix(Landcover,size(Landcover,1),size(Landcover,2),100);
    
    %% mapping
    % reclassify LC types
    Landcover(Landcover==0)=17;
    Landcover(Landcover==12)=12;
    Landcover(Landcover==10)=12;
    Landcover(Landcover==11)=12;
    
    Landcover(Landcover==20)=12;
    Landcover(Landcover==50 | Landcover==51  | Landcover==52)=2;
    Landcover(Landcover==60)=4;
    Landcover(Landcover==61)=4;
    Landcover(Landcover==62)=4;
    Landcover(Landcover==70)=1;
    Landcover(Landcover==71)=1;
    Landcover(Landcover==72)=1;
    Landcover(Landcover==80)=3;
    Landcover(Landcover==81)=3;
    Landcover(Landcover==82)=3;
    Landcover(Landcover==90 | Landcover==91 | Landcover==92)=5;
    Landcover(Landcover==120)=7;
    Landcover(Landcover==121)=7;
    Landcover(Landcover==122)=7;
    Landcover(Landcover==130)=10;
    Landcover(Landcover==140)=16;
    Landcover(Landcover==150)=16;
    Landcover(Landcover==152)=16;
    Landcover(Landcover==153)=16;
    Landcover(Landcover==180)=11;
    Landcover(Landcover==190)=13;
    Landcover(Landcover==200)=16;
    Landcover(Landcover==201)=16;
    Landcover(Landcover==202)=16;
    Landcover(Landcover==210)=18;  % water body=18
    Landcover(Landcover==220)=15;
    Landcover(Landcover==250)=17;

    
    %---------fp---------------
    AddWorkspace('E:\footprint_\fp\mat_measured_post')
    fp=load(DataName).output;
    xx1 = fp(:,1);
    yy1 = fp(:,2);
    xx2 = fp(:,3);
    yy2 = fp(:,4);
    xx3 = fp(:,5);
    yy3 = fp(:,6);
    xx4 = fp(:,7);
    yy4 = fp(:,8);
    %remove origin point
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
    % unit: m——>km
    x50=xx11./1000;y50=yy11./1000;
    x60=xx22./1000;y60=yy22./1000;
    x70=xx33./1000;y70=yy33./1000;
    x80=xx44./1000;y80=yy44./1000;
    %fp range
    maxxfp=max(x80);minxfp=min(x80); 
    maxyfp=max(y80);minyfp=min(y80);
    tmp=[abs(maxxfp);abs(minxfp);abs(maxyfp);abs(minyfp)];
    extentfp=max(tmp);

    if extentfp>1
        x_l = -extentfp-0.2:0.03:extentfp+0.2;
    else
        x_l = -extentfp-0.5:0.03:extentfp+0.5;
    end

    y_l = x_l;
    tmp=size(x_l,2);
    
    mid_index = ceil(150 / 2);
    start_index = mid_index - floor(tmp / 2);
    end_index = mid_index + floor(tmp / 2);
    useddata=Landcover;
    useddata1 = useddata(start_index:end_index,start_index:end_index);

    imagesc(x_l,y_l,useddata1)
    hold on
    plot(x50,-y50,'Color','k','LineWidth',1)
    hold on
    plot(x60,-y60,'Color','k','LineWidth',1)
    hold on
    plot(x70,-y70,'Color','k','LineWidth',1)
    hold on
    plot(x80,-y80,'Color','k','LineWidth',1)
    hold on
    pause(0.3) 
    clf

    %  footprint weighted
    cd(FFP_weightPath)
    ffp_site=strcat(RTSiteID,"_FFP.mat");
    FFP=load(ffp_site)
    fp_weight=FFP.FFP(1).fclim_2d*5*5;  % 5 is the spatial resolution of fp
    x_fp=FFP.FFP(1).x_2d;
    y_fp=FFP.FFP(1).y_2d;
    
    [rows, cols]=size(fp_weight);
    if rows==cols
        new_rows=floor(rows/6);new_cols=new_rows; % 5m->30m
        new_rows_tmp=new_rows*6;
        row_ind=(rows-new_rows_tmp)/2;

    else
        msgbox('fp-weight error')
        pause(5)
    end

    if isinteger(row_ind)
        fp_weight_tmp=fp_weight(row_ind+1:rows-row_ind,row_ind+1:rows-row_ind);
        fp_weight_resample=imresize(fp_weight_tmp, [new_rows, new_cols]);
        x_fp_tmp=x_fp(row_ind+1:rows-row_ind,row_ind+1:rows-row_ind);
        y_fp_tmp=y_fp(row_ind+1:rows-row_ind,row_ind+1:rows-row_ind);
        x_fp_=x_fp_tmp/1000; %units change
        y_fp_=y_fp_tmp/1000;

        new_matrix = zeros(new_rows, new_cols);
        for i = 1:new_rows
            for j = 1:new_cols
                % index
                start_row = (i - 1) * 6 + 1;
                end_row = i * 6;
                start_col = (j - 1) * 6 + 1;
                end_col = j * 6;
                % new value
                new_matrix(i, j) = sum(sum(fp_weight_tmp(start_row:end_row, start_col:end_col)));
            end
        end
    else
        row_ind=floor(row_ind);
        fp_weight_tmp=fp_weight(row_ind+1:rows-row_ind-1,row_ind+1:rows-row_ind-1);
        fp_weight_resample=imresize(fp_weight_tmp, [new_rows, new_cols]);
        x_fp_tmp=x_fp(row_ind+1:rows-row_ind-1,row_ind+1:rows-row_ind-1);
        y_fp_tmp=y_fp(row_ind+1:rows-row_ind-1,row_ind+1:rows-row_ind-1);
        x_fp_=x_fp_tmp/1000; 
        y_fp_=y_fp_tmp/1000;

        new_matrix = zeros(new_rows, new_cols);
        for i = 1:new_rows
            for j = 1:new_cols
                %  index
                start_row = (i - 1) * 6 + 1;
                end_row = i * 6;
                start_col = (j - 1) * 6 + 1;
                end_col = j * 6;
                % new value
                new_matrix(i, j) = sum(sum(fp_weight_tmp(start_row:end_row, start_col:end_col)));
            end
        end
    end
    fp_weight_30m=new_matrix; %30m fp-weight
    fp_weight_30=flipud(fp_weight_30m); %flupud


    
    x_fp_row=x_fp_(1,:);
    new_length = floor(length(x_fp_row) / 6);
    new_array = zeros(1, new_length);
    for i = 1:new_length
        start_index = (i - 1) * 6 + 1;
        end_index = i * 6;
        interval_data = x_fp_row(start_index:end_index);
        average_value = mean(interval_data);
        new_array(i) = average_value;
    end
    x_fp_30m=new_array;

    y_fp_row=y_fp_(:,1);
    new_length = floor(length(x_fp_row) / 6);
    new_array = zeros(1, new_length);
    for i = 1:new_length
        start_index = (i - 1) * 6 + 1;
        end_index = i * 6;
        interval_data = x_fp_row(start_index:end_index);
        average_value = mean(interval_data);
        new_array(i) = average_value;
    end
    y_fp_30m=new_array;


  
    array=y_fp_30m;
    array_length = length(array);
    middle_index = ceil(array_length / 2);
  
    middle_number = array(middle_index);

    diff=middle_number-y_l;
    diff_abs=abs(diff);
    indxs=find(diff_abs==min(diff_abs));
    if diff(indxs)>0
        y_fp_30m=y_fp_30m-min(diff_abs);
    else
        y_fp_30m=y_fp_30m+min(diff_abs);
    end

    array=x_fp_30m;
    array_length = length(array);
    middle_index = ceil(array_length / 2);
    
    middle_number = array(middle_index);

    diff=middle_number-x_l;
    diff_abs=abs(diff);
    indxs=find(diff_abs==min(diff_abs));
    if diff(indxs)>0
        x_fp_30m=x_fp_30m-min(diff_abs);
    else
        x_fp_30m=x_fp_30m+min(diff_abs);
    end


    [xfp, yfp]=meshgrid(x_fp_30m, y_fp_30m);

    [in,on] = inpolygon(xfp,yfp,x50,-y50);
    [row50 col50] = find(in==1);
    fp_weight50 = [];
    for i = 1:length(row50)
        weight = fp_weight_30(row50(i),col50(i));
        fp_weight50 = [fp_weight50 weight];
    end

    [in,on] = inpolygon(xfp,yfp,x60,-y60);
    [row60 col60] = find(in==1);
    fp_weight60 = [];
    for i = 1:length(row60)
        weight = fp_weight_30(row60(i),col60(i));
        fp_weight60 = [fp_weight60 weight];
    end
    
    [in,on] = inpolygon(xfp,yfp,x70,-y70);
    [row70 col70] = find(in==1);
    fp_weight70 = [];
    for i = 1:length(row70)
        weight = fp_weight_30(row70(i),col70(i));
        fp_weight70 = [fp_weight70 weight];
    end
    
    [in,on] = inpolygon(xfp,yfp,x80,-y80);
    [row80 col80] = find(in==1);
    fp_weight80 = [];
    for i = 1:length(row80)
        weight = fp_weight_30(row80(i),col80(i));
        fp_weight80 = [fp_weight80 weight];
    end

    % fp_weight normalized to 100%
    fp_weight_50=100/sum(fp_weight50)*fp_weight50;
    fp_weight_60=100/sum(fp_weight60)*fp_weight60;
    fp_weight_70=100/sum(fp_weight70)*fp_weight70;
    fp_weight_80=100/sum(fp_weight80)*fp_weight80;
  
 
    [x, y] = meshgrid(x_l, y_l);

    [in,on] = inpolygon(x,y,x50,-y50);
    [row50 col50] = find(in==1);
    lc50 = [];
    for i = 1:length(row50)
        lc = useddata1(row50(i),col50(i));
        lc50 = [lc50 lc];
    end
    
    [in,on] = inpolygon(x,y,x60,-y60);
    [row60 col60] = find(in==1);
    lc60 = [];
    for i = 1:length(row60)
        lc = useddata1(row60(i),col60(i));
        lc60 = [lc60 lc];
    end

    [in,on] = inpolygon(x,y,x70,-y70);
    [row70 col70] = find(in==1);
    lc70 = [];
    for i = 1:length(row70)
        lc = useddata1(row70(i),col70(i));
        lc70 = [lc70 lc];
    end

    [in,on] = inpolygon(x,y,x80,-y80);
    [row80 col80] = find(in==1);
    lc80 = [];
    for i = 1:length(row80)
        lc = useddata1(row80(i),col80(i));
        lc80 = [lc80 lc];
    end

    stats50=tabulate(lc50); 
    stats60=tabulate(lc60);
    stats70=tabulate(lc70);
    stats80=tabulate(lc80);

    % LC type
    lc_50_types=unique(lc50);
    lc_60_types=unique(lc60);
    lc_70_types=unique(lc70);
    lc_80_types=unique(lc80);

 
    percts_50=[];
    for ii=1:length(lc_50_types)
        lctype=lc_50_types(ii);
        inds=find(lc50==lctype);
        weights=fp_weight_50(inds);
        perct=sum(weights);
        percts_50=[percts_50 perct];
    end
 
    for iii=1:length(lc_50_types)
        lctype=lc_50_types(iii);
        index=find(stats50(:,1)==lctype);
        stats50(index,4)=percts_50(iii);
    end

    percts_60=[];
    for ii=1:length(lc_60_types)
        lctype=lc_60_types(ii);
        inds=find(lc60==lctype);
        weights=fp_weight_60(inds);
        perct=sum(weights);
        percts_60=[percts_60 perct];
    end
    for iii=1:length(lc_60_types)
        lctype=lc_60_types(iii);
        index=find(stats60(:,1)==lctype);
        stats60(index,4)=percts_60(iii);
    end

    percts_70=[];
    for ii=1:length(lc_70_types)
        lctype=lc_70_types(ii);
        inds=find(lc70==lctype);inds=inds(1:end-1);
        weights=fp_weight_70(inds);
        perct=sum(weights);
        percts_70=[percts_70 perct];
    end
    for iii=1:length(lc_70_types)
        lctype=lc_70_types(iii);
        index=find(stats70(:,1)==lctype);
        stats70(index,4)=percts_70(iii);
    end

    percts_80=[];
    for ii=1:length(lc_80_types)
        lctype=lc_80_types(ii);
        inds=find(lc80==lctype);
        weights=fp_weight_80(inds);
        perct=sum(weights);
        percts_80=[percts_80 perct];
    end
    for iii=1:length(lc_80_types)
        lctype=lc_80_types(iii);
        index=find(stats80(:,1)==lctype);
        stats80(index,4)=percts_80(iii);
    end
    
    A = size(stats50,1);
    B = size(stats60,1);
    C = size(stats70,1);
    D = size(stats80,1);
    
    E = [A,B,C,D];
    class = max(E);
    stats50(A+1:class,:)=0;
    stats60(B+1:class,:)=0;
    stats70(C+1:class,:)=0;
    stats80(D+1:class,:)=0;

    stats = [stats50 stats60 stats70 stats80];

    s=xlswrite(strcat('E:\footprint_\LC_Percent_sites\',RTSiteID,'.xlsx'),stats); 

end


