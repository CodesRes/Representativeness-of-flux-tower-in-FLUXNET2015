%% To footprint contours
function s = FpAreaStats(siteid);
%% prepare parems
data=load(strcat('E:\footprint_\fp结果\mat_all\',siteid));
fp=data.output;

%% footprint 50 60 70 80% areas stats
xx1 = fp(:,1);
yy1 = fp(:,2);
xx2 = fp(:,3);
yy2 = fp(:,4);
xx3 = fp(:,5);
yy3 = fp(:,6);
xx4 = fp(:,7);
yy4 = fp(:,8);
%remove origin point
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

% clear NaN 
valid_indices = ~isnan(xx11) & ~isnan(yy11);
x1_clean = xx11(valid_indices);
y1_clean = yy11(valid_indices);
valid_indices = ~isnan(xx22) & ~isnan(yy22);
x2_clean = xx22(valid_indices);
y2_clean = yy22(valid_indices);
valid_indices = ~isnan(xx33) & ~isnan(yy33);
x3_clean = xx33(valid_indices);
y3_clean = yy33(valid_indices);
valid_indices = ~isnan(xx44) & ~isnan(yy44);
x4_clean = xx44(valid_indices);
y4_clean = yy44(valid_indices);

s1 = polyarea(x1_clean,y1_clean); 
s2 = polyarea(x2_clean,y2_clean); 
s3 = polyarea(x3_clean,y3_clean); 
s4 = polyarea(x4_clean,y4_clean); 
s = [s1,s2,s3,s4];
