function s = FpAreaStats(yrphi);


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

cumu_yrphi = footcumsort(yrphi)*100;

[B,TransferF] = footprint_rotate(x_x,y_y,x_x,0);

%% plot
x_l = linspace(-pix*(TransferF.Bx+TransferF.x_offset),pix*(TransferF.Bx+TransferF.x_offset),m2);
x_l = x_l(ones(1,n2),:);
y_l = linspace(pix*(TransferF.By+TransferF.y_offset),-pix*(TransferF.By+TransferF.y_offset),n2)';
y_l = y_l(:,ones(1,m2));

[Cd1,hd1] = contourf(x_l,y_l,filtfilt(fir1(20,1e-2,'low'),1,cumu_yrphi),[0,50],'k');
[Cd2,hd2] = contour(x_l,y_l,filtfilt(fir1(20,1e-2,'low'),1,cumu_yrphi),[0,70],'k');
[Cd3,hd3] = contour(x_l,y_l,filtfilt(fir1(20,1e-2,'low'),1,cumu_yrphi),[0,90],'k');
[Cd4,hd4] = contour(x_l,y_l,filtfilt(fir1(20,1e-2,'low'),1,cumu_yrphi),[0,99],'k');

hold on;
h=line(0,0,...
    'marker','+','markeredgecolor','r','markerfacecolor','r');
ylabel('Distance from tower S-N (m)');
xlabel('Distance from tower W-E (m)');
text(3100, -3100,'log(\phi)','FontSize',16);
hold off;

%% statistic footprint area of 50 70 90 99% 

xx1 = Cd1(1,1:end);
yy1 = Cd1(2,1:end);
xx2 = Cd2(1,1:end);
yy2 = Cd2(2,1:end);
xx3 = Cd3(1,1:end);
yy3 = Cd3(2,1:end);
xx4 = Cd4(1,1:end);
yy4 = Cd4(2,1:end);
s1 = polyarea(xx1,yy1); 
s2 = polyarea(xx2,yy2); 
s3 = polyarea(xx3,yy3); 
s4 = polyarea(xx4,yy4); 
s = [s1,s2,s3,s4];
