
function s = FpAreaStats(siteid);

data=load(strcat('E:\footprint\fpresult\',siteid));
fp=data.output;

%% footprint area of 50 60 70 80% 
xx1 = fp(:,1);
yy1 = fp(:,2);
xx2 = fp(:,3);
yy2 = fp(:,4);
xx3 = fp(:,5);
yy3 = fp(:,6);
xx4 = fp(:,7);
yy4 = fp(:,8);

indice1 = find(abs(xx1) ==0 & abs(yy1) ==0);
indice2 = find(abs(xx2) ==0 & abs(yy2) ==0);
indice3 = find(abs(xx3) ==0 & abs(yy3) ==0);
indice4 = find(abs(xx4) ==0 & abs(yy4) ==0);
if isempty(indice1)
    xx11=xx1;yy11=yy1;
else
    indices_to_keep = setdiff(1:length(xx1), indice1);
    xx11 = xx1(indices_to_keep);
    yy11 = yy1(indices_to_keep)
end
if isempty(indice2)
    xx22=xx2;yy22=yy2;
else
    indices_to_keep = setdiff(1:length(xx2), indice2);
    xx22 = xx2(indices_to_keep);
    yy22 = yy2(indices_to_keep)
end
if isempty(indice3)
    xx33=xx3;yy33=yy3;
else
    indices_to_keep = setdiff(1:length(xx3), indice3);
    xx33 = xx3(indices_to_keep);
    yy33 = yy3(indices_to_keep)
end
if isempty(indice4)
    xx44=xx4;yy44=yy4;
else
    indices_to_keep = setdiff(1:length(xx4), indice4);
    xx44 = xx4(indices_to_keep);
    yy44 = yy4(indices_to_keep)
end

s1 = polyarea(xx11,yy11); 
s2 = polyarea(xx22,yy22); 
s3 = polyarea(xx33,yy33); 
s4 = polyarea(xx44,yy44); 
s = [s1,s2,s3,s4];
