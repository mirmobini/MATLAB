% 5.1. 2-D Visualization
%% Initialization of MATLAB
close all
clear
clc
scrsz = get(groot,'ScreenSize');
%% Basics of Visualization
x = -10:0.01:10;
a = -5;
b = 3;
c = 7;

y1 = a*x + b; % Line

y2 = a*x.^2 + b*x + c; % Curve

B = [5 10]; % Dot: A = (x,y)

X = [5 10]; Y = [2 7];

% Line plot
figure('Name','Line','position',scrsz)

subplot(3,1,1)
plot(y1)
xlabel('x'),ylabel('y')
title('Line plot')

subplot 312
plot(x,y1)
xlabel('x'),ylabel('y')
title('Line plot')

subplot 313
line(X,Y)
xlabel('x'),ylabel('y')
title('Line plot')

drawnow,pause(2)
% hold
figure('Name','hold','position',scrsz)
subplot 121
plot(x,y1,x,y2)
xlabel('x'),ylabel('y')
title('plot simultaneously')
subplot 122
plot(x,y1)
hold on
plot(x,y2)
hold off
xlabel('x'),ylabel('y')
title('plot using "hold"')
drawnow,pause(2)
% View Setting
figure('Name','View','position',scrsz)
plot(x,y1,x,y2)
xlabel('x'),ylabel('y')
XL = [-1.5 2.5]; YL = [-8 8];
% xlim(XL),ylim(YL)
axis([XL,YL])
title(sprintf('%g<x<%g and %g<y<%g',XL,YL))
drawnow,pause(2)
% Legend
figure('Name','Legend','position',scrsz)

subplot 121
P1 = plot(x,y1,x,y2);
xlabel('x'),ylabel('y'),title('P1')

subplot 122
P2 = plot(x,y2,x,y1);
xlabel('x'),ylabel('y'),title('P2')

% legend
% legend('Curve','Line')
lgd1 = legend(P1,{'Line','Curve'});
lgd2 = legend(P2,{'Curve','Line'},'Location','south');
pause(2)
subplot 122
hold on
plot(x,y1+y2,'DisplayName','Sum')
title(lgd1,'P1')
title(lgd2,'P2')

drawnow, pause(2)
% Plotting Options
figure('Name','Options','position',scrsz)
hold on
grid on
plot(x,y1,'g--',x,y2,'b:','LineWidth',3)
plot(B(1),B(2),'kx',-B(1),-B(2),'ro','MarkerSize',10)
xlabel('x'),ylabel('y'),title('Plotting options')
% axis([XL,YL])
% axis equal

drawnow, pause(2)
% some miscellaneous commands
x = 0:0.02*pi:2*pi;
y = sin(x);
figure('Name','Text','position',scrsz)
plot(x,y)
text(pi,0,'\leftarrow Sin(\pi)')
gtext('Selected Point')
drawnow
% gcf , gca , gco
fig = gcf;
ax = gca;
obj = gco(fig);
%
pause(2)
cla
pause(2)
clf
pause(2)
plot(sin(x),cos(x),'r')
xline(0);
yline(0);
axis equal
pause(2)
%%
% fill, patch, area
x1 = [1 2 2 1];
y1 = [1 1 2 2];
x2 = [3 5;4 7;4 6];
y2 = [3 1;4 1;3 6];
figure('Name','fill, patch, area','position',scrsz)
subplot 411,plot(x1,y1),axis([.5 2.5 .5 2.5]),title('plot')
subplot 412,fill(x1,y1,'g'),axis([.5 2.5 .5 2.5]),title('fill')
subplot 413,patch(x1,y1,[1 0 0]),title('patch')
hold on,patch(x2,y2,[0;1]),axis([0 8 0 8])
colormap summer
colorbar
subplot 414,area(sin(0:0.01*pi:2*pi)),title('area')
pause(2)
%% Advanced Visualization Functions
% close all
% clearvars
% clc
% scrsz = get(groot, 'ScreenSize');
% variables
n = 20;
x = 0:n-1;
y = randi([-8 8],[1 n]);
g = [ones(1,n/2),2*ones(1,n/2)];
xl = logspace(1,5);
yl = exp(xl);
fig1 = figure('Name','Advanced plots','position',scrsz);
% stem
subplot 431
stem(x,y)
title('stem')
% bar
subplot 432
bar(x,abs(y))
title('bar')
subplot 433
barh(x,abs(y))
title('barh')
% stairs
subplot 434
stairs(x,y)
title('stairs')
% logarithmic
subplot 435
loglog(xl,yl)
title('loglog')
subplot 436
semilogx(xl,yl)
title('semilogx')
subplot 437
semilogy(xl,yl)
title('semilogy')
% scatter plot
subplot 438
scatter(x,y)
title('scatter')
subplot 439
gscatter(x,y,g)
title('gscatter')
% boxplot
subplot(4,3,10)
boxplot(y)
title('boxplot')
% errorbar
subplot(4,3,11)
err = randi(3,[1 n]);
errorbar(x,y,err)
title('errorbar')
% fplot
subplot(4,3,12)
fplot(@(t) sin(2*pi*2*t))
title('fplot')
% set
% set(fig1, 'Position', scrsz);
drawnow, pause(2)
% pie chart
p = [0.1 0.4 0.3 0.2];
labels = {'part1','part2','part3','part4'};
explode = [1 0 0 1];
figure('Name','pie chart','position',scrsz)
subplot 131
pie(p)
subplot 132
pie(p,labels);
subplot 133
P = pie(p,explode,labels);
drawnow, pause(2)
% compass
u = randn(5,5);
v = randn(5,5);
figure('Name','Compass','position',scrsz)
subplot 121,compass(u,v)
subplot 122,compass(u)
drawnow, pause(2)
% contour
X = 1:20; Y = 1:50; Z = randn(length(Y),length(X)); 
figure('Name','Contour plot','position',scrsz)
subplot 121,contour(X,Y,Z)
subplot 122,contour(Z)
drawnow, pause(2)
% pareto chart
values = [5 25 97 20 45 30 8];
labels = {'5','25','97','20','45','30','8'};
figure('Name','Pareto chart','position',scrsz)
pareto(values,labels)
drawnow, pause(2)
% ezplot
syms x y
f(x,y) = 2*sin(x) + 3*cos(y).^2;
f1(x) = sin(x);
figure('Name','ezplot','position',scrsz)
subplot 121,ezplot(f) % Same as fplot
subplot 122,ezplot(f,[-pi pi -pi pi]);
drawnow, pause(2)
% graph plot
s = [1 1 1 4 3 2];
t = [2 3 4 5 5 5];
g1 = graph(s,t);   % Graph with undirected edges
g2 = digraph(s,t); % Graph with directed edges
figure('Name','Graph plot','position',scrsz)
subplot 121, plot(g1,'LineWidth',2,'MarkerSize',6),title('Graph with undirected edges')
subplot 122, plot(g2,'LineWidth',2,'MarkerSize',6),title('Graph with directed edges')
drawnow, pause(2)
% close all
%END