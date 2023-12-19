%% =========80%fp boxplot==========
data=xlsread('E:\footprint\figures\FPAreasPlot.csv');
crop=data(find(data(:,2)==1));
gra=data(find(data(:,2)==4));
wet=data(find(data(:,2)==7));

csh=data(find(data(:,2)==10));
osh=data(find(data(:,2)==11));
sav=data(find(data(:,2)==12));

dnf=data(find(data(:,2)==6));
wsa=data(find(data(:,2)==8));
mf=data(find(data(:,2)==9));

dbf=data(find(data(:,2)==2));
ebf=data(find(data(:,2)==5));
enf=data(find(data(:,2)==3));

% plot
f1=subplot('Position',[0.1 0.54 0.4 0.35])
axes(f1)
x=[crop;gra;wet];
boxplot([crop',gra',wet'])
g1 = repmat({'CRO'},size(crop,1),1);
g2 = repmat({'GRA'},size(gra,1),1);
g3 = repmat({'WET'},size(wet,1),1);
g = [g1; g2; g3];
% scatter
scatter(repmat(0.75, size(crop,1), 1), crop,20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(1.75, size(gra,1), 1), gra, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(2.75, size(wet,1), 1), wet, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
hold on
% boxplot
g = [g1; g2; g3];
h=boxplot(x,g,"Colors","b",'Widths',0.2);
ylim([-0.01 0.15])
set(h,'Linewidth',1.5);
yticks([0 0.05 0.10 0.15])
yticklabels({'0','0.05','0.1','0.15'})
ylabel('80% ACFC area (km^2)')
text(0.5, 0.162,"(a)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

f2=subplot('Position',[0.55 0.54 0.4 0.35])
axes(f2)
x=[csh;osh;sav];
boxplot([csh',osh',sav'])
g1 = repmat({'CSH'},size(csh,1),1);
g2 = repmat({'OSH'},size(osh,1),1);
g3 = repmat({'SAV'},size(sav,1),1);
g = [g1; g2; g3];
% scatter
scatter(repmat(0.75, size(csh,1), 1), csh,20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(1.75, size(osh,1), 1), osh, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(2.75, size(sav,1), 1), sav, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
hold on
% boxplot
g = [g1; g2; g3];
h=boxplot(x,g,"Colors","b",'Widths',0.2);
ylim([-0.015 0.4])
set(h,'Linewidth',1.5);
yticks([0 0.1 0.2 0.3 0.4])
yticklabels({'0','0.1','0.2','0.3','0.4'})
text(0.5, 0.435,"(b)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

f3=subplot('Position',[0.1 0.1 0.4 0.35])
axes(f3)
x=[dnf;wsa;mf];
boxplot([dnf',wsa',mf'])
g1 = repmat({'DNF'},size(dnf,1),1);
g2 = repmat({'WSA'},size(wsa,1),1);
g3 = repmat({'MF'},size(mf,1),1);
g = [g1; g2; g3];

scatter(repmat(0.75, size(dnf,1), 1), dnf,20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(1.75, size(wsa,1), 1), wsa, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(2.75, size(mf,1), 1), mf, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
hold on

g = [g1; g2; g3];
h=boxplot(x,g,"Colors","b",'Widths',0.2);
ylim([-0.1 2.3])
set(h,'Linewidth',1.5);
yticks([0 0.5 1 1.5 2])
yticklabels({'0','0.5','1','1.5','2'})
ylabel('80% ACFC area (km^2)'); xlabel('Vegetation functional types');
text(0.5, 2.5,"(c)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

f4=subplot('Position',[0.55 0.1 0.4 0.35])
axes(f4)
x=[dbf;ebf;enf];
boxplot([dbf',ebf',enf'])
g1 = repmat({'DBF'},size(dbf,1),1);
g2 = repmat({'EBF'},size(ebf,1),1);
g3 = repmat({'ENF'},size(enf,1),1);
g = [g1; g2; g3];

scatter(repmat(0.75, size(dbf,1), 1), dbf,20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(1.75, size(ebf,1), 1), ebf, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
scatter(repmat(2.75, size(enf,1), 1), enf, 20,'filled','MarkerFaceColor',[.85 .85 .85],'jitter', 'on', 'jitterAmount', 0.1);hold on
hold on

g = [g1; g2; g3];
h=boxplot(x,g,"Colors","b",'Widths',0.2);
ylim([-0.3 8])
set(h,'Linewidth',1.5);

text(0.5, 8.7,"(d)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
xlabel('Vegetation functional types');
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

%% ========vsigma validation================
load("VsigmaValidation.mat")

%%
f1=subplot('Position',[0.1 0.58 0.35 0.35])
axes(f1)
x=fetch(:,1);y=fetch(:,2);
scatter(x,y,"filled",'MarkerFaceColor',[.39 0.78 0.95])
hold on

p = polyfit(x, y, 1);

y_fit = polyval(p, x);

plot(x, y_fit, 'color',[0 0.46 0.66 ],LineWidth=1.5);

ref_line = linspace(min(x), max(x), 100);
plot(ref_line, ref_line, '--','color',[0.77 0.77 0.77],LineWidth=1.5);

r_squared = 1 - sum((y - y_fit).^2) / sum((y - mean(y)).^2);

rmse = sqrt(mean((y - y_fit).^2));
obsmin=min(y);obsmax=max(y);range=obsmax-obsmin;tmp=range/10;

n = length(y); 
degree=1 
df = n - (degree + 1); 

pValue = 2 * (1 - tcdf(abs(p(1)) / rmse, df));


text(min(x)-10, max(y), ['n = 9'], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x)-10, max(y)-1.0*tmp, ['y = ' num2str(0.886) 'x + ' num2str(14.369)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x)-10, max(y)-2.0*tmp, ['R² = ' num2str(0.971)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
% text(min(x), max(y)-4.5*tmp, ['p = ' num2str(pValue)], 'HorizontalAlignment', 'left',FontName='times new roman',FontSize=15);
text(0, 649,"(a)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
xlabel(strcat('Footprint fetch','\_','predicted (m)'));ylabel(strcat('Footprint fetch','\_','measured (m)'));
box on
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

%
f2=subplot('Position',[0.55 0.58 0.35 0.35])
axes(f2)
x=sym(:,1);y=sym(:,2);
scatter(x,y,"filled",'MarkerFaceColor',[.39 0.78 0.95])
hold on

p = polyfit(x, y, 1);

y_fit = polyval(p, x);

plot(x, y_fit, 'color',[0 0.46 0.66 ],LineWidth=1.5);

ref_line = linspace(min(x), max(x), 100);
plot(ref_line, ref_line, '--','color',[0.77 0.77 0.77],LineWidth=1.5);

r_squared = 1 - sum((y - y_fit).^2) / sum((y - mean(y)).^2);

rmse = sqrt(mean((y - y_fit).^2));
obsmin=min(y);obsmax=max(y);range=obsmax-obsmin;tmp=range/10;

n = length(y); 
degree=1 
df = n - (degree + 1);

pValue = 2 * (1 - tcdf(abs(p(1)) / rmse, df));


text(min(x)-0.02, max(y)+0.7*tmp, ['n = 9'], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x)-0.02, max(y)-0.3*tmp, ['y = ' num2str(1.088) 'x − ' num2str(0.076)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x)-0.02, max(y)-1.3*tmp, ['R² = ' num2str(0.955)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
% text(min(x), max(y)-4.5*tmp, ['p = ' num2str(pValue)], 'HorizontalAlignment', 'left',FontName='times new roman',FontSize=15);
text(0.1, 0.75,"(b)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
xlabel(strcat('Footprint symmetry','\_','predicted'));ylabel(strcat('Footprint symmetry','\_','measured'));
box on
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

%
f3=subplot('Position',[0.1 0.1 0.35 0.35])
axes(f3)
x=lc(:,1);y=lc(:,2);
scatter(x,y,"filled",'MarkerFaceColor',[.39 0.78 0.95])
hold on

p = polyfit(x, y, 1);

y_fit = polyval(p, x);

plot(x, y_fit, 'color',[0 0.46 0.66 ],LineWidth=1.5);

ref_line = linspace(min(x), max(x), 100);
plot(ref_line, ref_line, '--','color',[0.77 0.77 0.77],LineWidth=1.5);

r_squared = 1 - sum((y - y_fit).^2) / sum((y - mean(y)).^2);

rmse = sqrt(mean((y - y_fit).^2));
obsmin=min(y);obsmax=max(y);range=obsmax-obsmin;tmp=range/10;

n = length(y); 
degree=1 
df = n - (degree + 1);

pValue = 2 * (1 - tcdf(abs(p(1)) / rmse, df));


xlim([40 105]);ylim([40 105])
text(min(x)-3, max(y)-0.9*tmp, ['n = 9'], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x)-3, max(y)-1.9*tmp, ['y = ' num2str(1.052) 'x − ' num2str(5.610)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x)-3, max(y)-2.9*tmp, ['R² = ' num2str(0.987)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
% text(min(x), max(y)-4.5*tmp, ['p = ' num2str(pValue)], 'HorizontalAlignment', 'left',FontName='times new roman',FontSize=15);
text(40, 111,"(c)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
xlabel(strcat('Percentage of DLCT','\_','predicted'));ylabel(strcat('Percentage of DLCT','\_','measured'));
box on
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

%
f4=subplot('Position',[0.55 0.1 0.35 0.35])
axes(f4)
x=ndvi(:,1);y=ndvi(:,2);
scatter(x,y,"filled",'MarkerFaceColor',[.39 0.78 0.95])
hold on

p = polyfit(x, y, 1);

y_fit = polyval(p, x);

plot(x, y_fit, 'color',[0 0.46 0.66 ],LineWidth=1.5);

ref_line = linspace(min(x), max(x), 100);
plot(ref_line, ref_line, '--','color',[0.77 0.77 0.77],LineWidth=1.5);

r_squared = 1 - sum((y - y_fit).^2) / sum((y - mean(y)).^2);

rmse = sqrt(mean((y - y_fit).^2));
obsmin=min(y);obsmax=max(y);range=obsmax-obsmin;tmp=range/10;

n = length(y); 
degree=1 
df = n - (degree + 1);

pValue = 2 * (1 - tcdf(abs(p(1)) / rmse, df));


text(min(x), max(y)+0.2*tmp, ['n = 9'], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x), max(y)-1*tmp, ['y = ' num2str(0.982) 'x + ' num2str(0.010)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
text(min(x), max(y)-2.2*tmp, ['R² = ' num2str(0.996)], 'HorizontalAlignment', 'left',FontName='Times new roman',FontSize=15);
% text(min(x), max(y)-4.5*tmp, ['p = ' num2str(pValue)], 'HorizontalAlignment', 'left',FontName='times new roman',FontSize=15);
text(0.3, 0.85,"(d)",'FontSize',18,'FontWeight','bold','FontName','times new roman')
xlabel(strcat('Mean value of NDVI','\_','predicted'));ylabel(strcat('Mean value of NDVI','\_','measured'));
box on
set(gca,"FontName","times new roman","FontSize",15,"LineWidth",1,'FontWeight','bold');

