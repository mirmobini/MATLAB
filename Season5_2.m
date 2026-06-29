% 5.2. 3-D Visualization
%% Initialization of MATLAB
close all
clear
clc
%% Variables
scrsz = get(groot,'ScreenSize');
n = 15;
x1 = [1 4];
y1 = [2 8];
z1 = [3 9];
x = 1:n;
y = 1:n;
zl = 1:n;
zc = 8*x.^5+4*y.^5-4*x.^3;
zb = randi(100,1,n);
zs = randn(length(x),length(y));
[xm,ym] = meshgrid(x,y);
zs1 = xm.^2+ym.^2;
zp = peaks(n);
t = -10*pi:0.01:10*pi;
s1 = sin(t); s2 = cos(t);
%% plot3
figure('Name','plot3','position',scrsz)
subplot(2,2,[1,2])
plot(t,s1,t,s2)
xlabel('t'),ylabel('signal amplitude')
title('plot(t,s1,t,s2)')
subplot(2,2,3)
plot(s1,s2)
xlabel('s1'),ylabel('s2')
title('plot(s1,s2)')
subplot(2,2,4)
plot3(s1,s2,t)
grid on
xlabel('s1'),ylabel('s2'),zlabel('t')
title('plot3(s1,s2,t)')
drawnow,pause(2)

figure('Name','plot3','position',scrsz)
subplot 221
plot3(x1,y1,z1,'-s')
grid on
xlabel('X'), ylabel('Y'), zlabel('Z')
title('plot3 - Line 1')
subplot 222
plot3(x,y,zl)
grid on
xlabel('X'), ylabel('Y'), zlabel('Z')
title('plot3 - Line 2')
subplot 223
plot3(x,y,zb,'ro')
grid on
xlabel('X'), ylabel('Y'), zlabel('Z')
title('plot3 - bubble')
subplot 224
plot3(x,y,zc)
grid on
xlabel('X'), ylabel('Y'), zlabel('Z')
title('plot3 - curve')
drawnow,pause(2)
%% surf
figure('Name','surface plot','position',scrsz)
subplot 131
surf(x,y,zs)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surf')
subplot 132
surfl(x,y,zs)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surfl')
pause(2)
shading flat 
pause(2)
shading faceted 
pause(2)
shading interp
pause(2)
subplot 133
surfc(x,y,zs)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surfc')
drawnow,pause(2)

figure('Name','surface plot','position',scrsz)
subplot 131
surf(x,y,zs1)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surf')
subplot 132
surfl(x,y,zs1)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surfl')
pause(2)
shading flat 
pause(2)
shading faceted 
pause(2)
shading interp 
pause(2)
subplot 133
surfc(x,y,zs1)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surfc')
drawnow,pause(2)

figure('Name','surface plot','position',scrsz)
subplot 131
surf(x,y,zp)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surf')
subplot 132
surfl(x,y,zp)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surfl')
pause(2)
shading flat 
pause(2)
shading faceted 
pause(2)
shading interp 
subplot 133
surfc(x,y,zp)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('surfc') 
drawnow,pause(2)
%% mesh
figure('Name','mesh plot','position',scrsz)
subplot 131
mesh(x,y,zp)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('mesh')
subplot 132
meshz(x,y,zp)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('meshz')
subplot 133
meshc(x,y,zp)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('meshc')
drawnow,pause(2)
%% other visualization functions
figure('Name','3-D plots','position',scrsz)
subplot 321
stem3(z1)
title('stem3')
subplot 322
bar3([zb;zc])
title('bar3')
subplot 323
contour3(x,y,zp)
title('contour3')
subplot 324
scatter3(x,y,randn(1,n))
title('scatter3')
subplot 325 
comet3(z1)
title('comet3')
subplot 326
p = [0.1 0.4 0.3 0.2];
pie3(p)
title('pie3')
drawnow, pause(2)
figure('Name','symbolic 3-D plots','position',scrsz)
fplot3(@(t) sin(t),@(t) cos(t),@(t) t)
title('fplot3')
drawnow, pause(2)
%% Camera tools
figure('Name','Camera','position',scrsz)
surf(peaks)
grid on
pos = campos;
pause(2)
axis off
title('axis off')
pause(2)
axis on tight 
title('axis tight')
pause(2)
axis normal
title('axis normal (reset)')
pause(2)
axis vis3d
title('axis vis3d')
pause(2)

camorbit(gca,50,50)
title('camera orbit')
pause(2)
camorbit(gca,-50,-50)
title('camera orbit')
pause(2)
for i = 1:36
    camorbit(gca,10,0)
    drawnow,pause(0.1)
end
title('camorbit')
pause(2)

t = 0:pi/20:4*pi;
dx = sin(t)./40;
dy = cos(t)./40;
title('camdolly - camera mode')
for i = 1:length(t)
    camdolly(dx(i),dy(i),0)
    drawnow
end
pause(2)
title('camdolly - target mode')
for i = 1:length(t)
    camdolly(dx(i),dy(i),0,'targetmode')
    drawnow
end
pause(2)

title('campan')
for i = 1:length(t)
    campan(dx(i),dy(i))
    drawnow
end
pause(2)

title('camroll')
for i = 1:36
	camroll(10)
	drawnow,pause(0.1)
end
pause(2)

zf = 1:1:10;
zf = [zf,1./zf];
title('camzoom')
for i = 1:length(zf)
	camzoom(zf(i))
	drawnow,pause(0.1)
end
pause(2)

title('campos')
for x = -300:5:300
    campos([x,5,10])
    drawnow
end
pause(2)
campos(pos)
title('reset campos')
pause(2)

camup([1 0 0])
title('camup')
pause(2)
camup([0 0 0])
xt = linspace(25,50,50);
pause(2)

title('camtarget')
for i = 1:50
     camtarget([xt(i),30,0])
     drawnow
end
pause(2)

camproj('perspective')
title('camproj - perspective')
pause(2)
camproj('orthographic')
title('camproj - orthographic')
pause(2)

camva(180)
title('camva')
pause(2)

view(0,90) % view(2)
title('view(2)')
pause(2)
view(-37.5,30) % view(3)
title('view(3)')
pause(2)
view(90,0)
title('view(90,0)')
pause(2)
%% rotation options
figure('Name','rotate3d','position',scrsz)
ax = surf(peaks);

rotate3d on

pause(2)
rotate(ax,[1 0 0],25)
title('rotate x')
pause(2)
rotate(ax,[0 1 0],25)
title('rotate y')
pause(2)
rotate(ax,[0 0 1],25)
title('rotate z')
pause(2)
% close all
%END