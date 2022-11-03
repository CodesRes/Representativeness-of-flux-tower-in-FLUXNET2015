
%% load .mat data
load('E:\footprint_all\analysis\footprint\RU-SkP.mat');
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

[Cd4,hd4] = contour(x_l,y_l,filtfilt(fir1(20,1e-2,'low'),1,cumu_yrphi),[0,50,70,90,99],'k');
clabel(Cd,hd,'fontsize',10,'color','k','rotation',0);
hold on;
h=line(0,0,...
    'marker','+','markeredgecolor','r','markerfacecolor','r');
ylabel('Distance from tower S-N (m)');
xlabel('Distance from tower W-E (m)');
text(3100, -3100,'log(\phi)','FontSize',16);

