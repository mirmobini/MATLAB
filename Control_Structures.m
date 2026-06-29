%              4. Control Structures
%% Initializing MATLAB
close all
clear
clc
%% "for" Loop
% 1-D for loops
n = 15;
A = zeros(n,1);
for i = 1:n
    A(i) = i;
end

% B = zeros(1,length(A));
B = zeros(size(A));
for i = 1:length(A)
    B(i) = exp(A(i));
end
% 2-D (Nested) for loops
a = rand(n);
b = zeros(size(a));
for i = 1:size(a,2)
    for j = 1:size(a,1)
        b(j,i) = a(i,j);
    end
end
%% "if-elseif-else" Condition
clearvars, clc % Clear previous variables and outputs

Cond = true;
if Cond == 1
    message = "Condition is true";
end
    
if Cond == 1
    message = "Condition is true";
else
    message = "Condition is false";
end

a = 5;
b = 6;
Con = 3;
if Con == 1
    c = a+b;
elseif Con == 2
    c = a-b;
elseif Con == 3
    c = a*b;
elseif Con == 4
    c = a/b;
else
    c = a^b;
end
% if once condition is met,then stop
if a == 5
   disp('a') 
elseif b == 6
    disp('b')
end
% Multi-conditioning
A = 1;
B = 0;
if(A == 2 && B == 5)
    S = A*B;
elseif(B ~= 0)
    S = A/B;
else
    S = A+B;
end
% Comparative Conditions
if A>B
    C1 = A-B;
elseif A<B
    C1 = B-A;
else
    C1 = A*B;
end
% Nested Conditioning
s = input('Are you a woman? Y/N: ','s');
if(s == 'n' || s == 'N')
    Response = "No";
elseif(s == 'y' || s == 'Y')
    Response = "Yes";
    k = input('Do you have any children? Y/N: ','s');
    if(k == 'n' || k == 'N')
        Kids = "No";
    elseif(k == 'y' || k == 'Y')
        Kids = "Yes";
    else
        Kids = "Unknown";
    end
else
    Response = "Non-binary";
end
%% "switch-case" Condition
clearvars, clc % Clear previous variables and outputs

a = 5;
b = 6;
Con = 2;

switch Con
    case 1
        c = a+b;
    case 2
        c = a-b;
    case 3
        c = a*b;
    case 4
        c = a/b;
    otherwise
        c = a^b;
end

for i = 1:10
    switch i
        case{1,3,5,7,9}
            A(i) = i;
        case{2,4,6,8}
            B(i) = i;
    end
end
%% "while" Loop
clearvars, clc % Clear previous variables and outputs
n = 0;
while n<15
     disp(n)
    n = n+1;
    pause(0.5)
end

Npad = 0;
while 1
    Npad = Npad+1;
    pause(0.5)
    disp(Npad)
    if Npad>=15
        break
    end
end
%% Supplementary Functions
clearvars, clc % Clear previous variables and outputs

n = 10;
a = zeros(1,n);
tic
for i = 0:length(a)
    if i==0
        continue
    end
    a(i) = i;
    pause(1);
    disp(a);
end
t = toc;
%% Some examples
clearvars, clc
% Even or Odd
n = 103;
A = cell(3,n);

for i = 1 : n
    A{1,i} = i;
    switch (mod(i,2))
        case 0
            A{2,i} = 'Even';
        otherwise
            A{2,i} = 'Odd';
            if mod(i,3) == 0
                A{3,i} = 3;
            elseif mod(i,7) == 0
                A{3,i} = 7;
            end
    end
end
% 1-D
% Factorial
f = 20;
a = 1;
for i = 1:f
    a = a*i;
end
% Sumation
b = 1:100;
sb = 0;
for i = 1:length(b)
    sb = sb+b(i);
end
% Windowing
S = 1:n;
w = 5;

WS = zeros(floor(n/w),w);
c = 1;
for i = 0:floor(n/w)-1
    WS(c,:) = S(i*w+1:(i+1)*w);
    c = c+1;
end

WS1 = zeros(floor(n/w),w);
for i = 1:floor(n/w)
    WS1(i,:) = S((i-1)*w+1:i*w);
end

EQ = isequal(WS,WS1);
if EQ
    disp('WS and WS1 are equal')
end
% Windowing with padding
Npad = 0;
if mod(n,w)~=0
    Npad = w-mod(n,w);
end

Z = zeros(1,Npad);
SZ = [S,Z];

SZ1 = padarray(S,[0,Npad],0,'post');

EQ = isequal(SZ,SZ1);
if EQ
    disp('Manual Zero Padded Signal and "padarray" Function Output Signal are equal')
end

L = length(SZ);
WS2 = zeros(L/w,w);
WS3 = WS2;
for i = 1:L/w
    WS2(i,:) = SZ((i-1)*w+1:i*w);
    WS3(i,:) = SZ1((i-1)*w+1:i*w);
end

EQ = isequal(WS2,WS3);
if EQ
    disp('WS2 and WS3 are equal')
end
% 2-D
% Direct addressing
SCZ = [10 15];
MAT = zeros(SCZ);
for i = 1:SCZ(2)
    for j = 1:SCZ(1)
        MAT(j,i) = j+(i-1)*SCZ(1);
    end
end
% Reshape
SCZr = [5 30];
MATr = zeros(SCZr);
M = MAT(:);
for i = 1:SCZr(2)
    for j = 1:SCZr(1)
        MATr(j,i) = M(j+(i-1)*SCZr(1));
    end
end
% Block process
% C = rand(512);
C = imread('cameraman.tif');
blk = 8;
N = floor(numel(C)/blk^2);
D = cell(1,N);
D1 = zeros(blk,blk,N);
c = 1;
for i = 1:blk:size(C,1)
    for j = 1:blk:size(C,2)
        D{c} = C(i:i+blk-1,j:j+blk-1);
        D1(:,:,c) = C(i:i+blk-1,j:j+blk-1);
        c = c+1;
    end
end
% END
%% Important Note
clearvars, clc
a = 1:20;
stp = [5 10 9 17 1];
for i = stp
    a(i) = NaN;
end
