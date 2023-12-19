
%% Adding paths containing code to default MATLAB workspace
% ---Obtaining the file names in the special directory---
RootPath=sprintf('%s','E:\1_PDH\phd-2-1\footprint\Mcode');
cd('E:\1_PDH\phd-2-1\footprint\Mcode')  % the dir of function AddWorkspace
AddWorkspace(RootPath)

%% information initialized

% DataPath=sprintf('%s','E:\footprint\fpresult\');
DataPath=sprintf('%s','E:\footprint\fpresult\vsigma\');

cd(DataPath)
% datadir=dir('*.mat');
datadir=dir('*vsigma.mat');
[r,c]=size(datadir);

LCPath=sprintf('%s','J:\footprint_second\LC_TIF\整合后所有的\');
cd(LCPath)
LCdir=dir('*.tif');

SavedPath=sprintf('%s','E:\footprint\LC_analysis\vsigma\');
CA_LC=[];
US_LC=[];
%% 
for i=1:r%2:r

    cd(DataPath)
    datadir(i).name  %show the data being processed
    DataName=datadir(i).name; %cumulative footprint
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
    Landcover(Landcover==210)=18;  
    Landcover(Landcover==220)=15;
    Landcover(Landcover==250)=17;

    
    %---------fp---------------
    AddWorkspace('E:\footprint\fpresult\')
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
    % m to km
    x50=xx11./1000;y50=yy11./1000;
    x60=xx22./1000;y60=yy22./1000;
    x70=xx33./1000;y70=yy33./1000;
    x80=xx44./1000;y80=yy44./1000;
    %fp extent
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
    pause(2) 
    clf
    
   
    %% find the range of 50、60、70、80%fooprint
    [row50 col50] = find(in==1);
    lc50 = [];
    for i = 1:length(row50)
        lc = useddata1(row50(i),col50(i));
        lc50 = [lc50 lc];
    end

    [x, y] = meshgrid(x_l, y_l);
    
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

    s=xlswrite(strcat('E:\footprint\LC_analysis\',RTSiteID,'.xlsx'),stats); % 
end


