%              8. Solving Equations Symbolically
%%
close all
clear
clc
%%
syms x
f = 3*x^2+2*x-4;
F = solve(f);
%%
clear,clc
syms x a b c
f = a*x^2+b*x+c==0;
F = solve(f);
%%
clear,clc
syms x a
fx1 = a*x-x^2==2;
Fx1 = solve(fx1);

syms a x
fx2 = a*x-x^2==2;
Fx2 = solve(fx2);

syms x a
fa = a*x-x^2==2;
Fa = solve(fa,a);
%%
clear,clc
syms x y z
f1 = 3*x+4*y-2*z==5;
f2 = -4*x-3*y+7*z==3;
f3 = 8*x+2*y-3*z==4;
F = solve(f1,f2,f3);
x = F.x;
y = F.y;
z = F.z;
[x,y,z] = solve(f1,f2,f3);
%%
clear,clc
syms x
p = x^3+2*x^2-3*x+4;
R = root(p,x);
%%
clear,clc
syms x
p = x^3+2*x^2-3*x+4;
R = solve(p,x,'MaxDegree',3);
%%
clear,clc
syms x
f = 14*x^3+7*x^2-3*x+2*x^3-4*x^2+17;
F = simplify(f);
%%
clear,clc
syms a y(t)
eqn = diff(y,t) == a*y;
E = dsolve(eqn);
%%
clear,clc
syms y(t) a
eqn = diff(y,t) == a*y;
cond = y(0) == 5;
ySol(t) = dsolve(eqn,cond);
%%
clear,clc
fun = @(x) 3*x(1)^2+2*x(1)-3+2*exp(x(2));
x0 = [0,2];
fsolve(fun,x0)
%%
clear,clc
fun = @root2d;
x0 = [0,0];
options = optimoptions('fsolve','Display','iter','PlotFcn',@optimplotfirstorderopt);
x = fsolve(fun,x0,options);
%%%%%%%%%%%%%%%%%%%%%
function F = root2d(x)
F(1) = exp(-exp(-(x(1)+x(2)))) - x(2)*(1+x(1)^2);
F(2) = x(1)*cos(x(2)) + x(2)*sin(x(1)) - 0.5;
end
