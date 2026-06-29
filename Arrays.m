%                            3. Arrays
%% Initializing MATLAB
close all
clear
clc
%% Vectors and Matrices
n = 10;
A = 0 : 1 : 10; a = 1:10;

B = [0,1,2,3,4,5,6,7,8,9,10];
b = [0 1 2 3 4 5 6 7 8 9 10];

C = linspace(0,10);
c = linspace(0,10,n);

D = logspace(0,10);
d = logspace(0,10,n);
%%
clearvars, clc
A = [1 2 3 4 5];
B = [6 7 8 9 10];
% Vector addressing
a0 = A(1);
a1 = A(end);
a2 = A(end-1);
a3 = A(1:end-1);
a4 = A(2:2:end);
a5 = A(1:2:end);
a6 = A(end:1);
a7 = A(end:-1:1);
a8 = A([1 3 5]);
adr = [1 3 5];
a9 = A(adr);
L = length(A);
% Catenating (2-D)
C = [1 2 3 4 5 6 7 8 9 10];
C1 = [1 2 3 4 5 ...
    6 7 8 9 10];

D = [1 2 3 4 5;6 7 8 9 10];
D1 = [1 2 3 4 5
    6 7 8 9 10];

c = [A,B];
c1 = horzcat(A,B);
c2 = cat(2,A,B);

d = [A;B];
d1 = vertcat(A,B);
d2 = cat(1,A,B);

s = size(d);
[row,column] = size(d);
% Matrix addressing (2-D)
e = d(5);
[Ro,Col] = ind2sub(size(d),5);
ind = sub2ind(size(d),Ro,Col);
e0 = d(2,2);
e1 = d(1,end);
e2 = d(end,1);
e3 = d(end,end);
e4 = d(s(1),s(2));
e5 = d(1,1:2);
e6 = d(1:2,1);
e7 = d(1:2,1:2);
e8 = d(1:row,1:column);
% catenating and addressing (more than 2-D)
A1 = rand(5);
A2 = rand(5);

F(:,:,1) = A1;
F(:,:,2) = A2;
F1 = cat(3,A1,A2);

S = size(F);
[Row, Column, Depth] = size(F);
N = numel(F);
Nd = ndims(F);

f1 = F(:,:,1); isequal(f1,A1)
f2 = F(:,:,2); isequal(f2,A2)
%% Functions
clearvars, clc

r = 5; c = 6;
% Creating matrices
a = randi(10,r,c); % Random integer (uniform distributed)
b = randn(r,c); % Random (0-1) (normally distributed)
d = rand(r,c); % Random (0-1) (uniform distributed)
e = randperm(20); % Random Permutation
f = zeros(r,c);
g = ones(r,c);
h = eye(r); % Identity Matrix
h1 = eye(r,c);
di = diag([100,200,300 400 500]);
% Testing Matrix values
k = [f;g];
NNZ = nnz(k);
NZ = nonzeros(k);
kztest = all(k); katest = any(k);
gztest = all(g); fatest = any(f);
% find
L = randi(50,10,15);
idx = find(L<10|L>40);
[row,column] = find(L<10|L>40);
[row1,column1] = find((L<10|L>40),3);
[row2,column2] = find((L<10|L>40),3,'last');
LL = [1 2 0 0 5 1 9 0];
idx1 = find(LL);
% sort
E = sort(e);
[E1,IDX] = sort(e);
% Repeat Matrix (repmat)
erep1 = repmat(e,[1,4]);
erep2 = repmat(e,[4,1]);
[ER,IDXR] = sort(erep2,2);
erep3 = repmat(e,2);
erep4 = repmat(e,2,3);
% reshape
A = repmat(1:8,[5,1]);
Atotal = A(:);
Are = reshape(Atotal,[5,8]);
Are1 = reshape(Atotal,5,8);
Are2 = reshape(Atotal,[10,4]);
% flip
fdi = flip(di);
fA1 = flip(Are2,1);  fudA = flipud(Are2);
fA2 = flip(Are2,2);  flrA = fliplr(Are2);
flip('Hello World')
%% Linear Algebra
clearvars, clc

a = [1;2;3]; b = [4;5;6]; c = [2 4 6 8 10 12 14 16];
A = [1 2 3;4 5 6;7 8 9]; B = [9 8 7;6 5 4;3 2 1]; C = [1 2 3 4;5 6 7 8];

C1 = a+b;
C2 = a-b;
C3 = a.*b;
C4 = a./b;

n0a = nnz(a); % 0-norm
n1a = norm(a,1); %1-norm
n2a = norm(a); % n2a = norm(a,2): 2-norm
ninfa = norm(a,inf); % infinite-norm
an = a./n2a; % Normalizied by norm (direction of vector or unit vector)
C5 = 5*A; % Scalar-Vector product
C6 = dot(A,B); % Inner product or Dot product
C7 = A*a; % Matrix-Vector product
C8 = A*B; % Matrix product
C9 = eye(size(A,1))*A; % Identity
C10 = A*eye(size(A,1)); % Identity
C11 = eye(size(C,1))*C; % Identity
C12 = C*eye(size(C,2)); % Identity
AT = A'; % Transpose
isequal(dot(a,b),b'*a) % x.y = Transpose(y)x
C13 = a*b'; % Outer product
isequal(trace(C13),dot(a,b)) % The Trace of outer product = inner peroduct
% Trace = Sumation of all diagonal elements of a square matrix

C14 = cross(a,b); % Cross product
rA_90 = rot90(A); % Matrix Rotation (90 Degrees)
rA_Kx90 = rot90(A,3); % Matrix Rotation (K*90 Degrees)

sa = sum(a);
sA = sum(A);
sA1 = sum(A,1);
sA2 = sum(A,2);

pa = prod(a);
pA = prod(A);
pA1 = prod(A,1);
pA2 = prod(A,2);

cpa = cumprod(a);
cpA = cumprod(A);
cpA1 = cumprod(A,1);
cpA2 = cumprod(A,2);

ma = mean(a);
mA = mean(A);
mA1 = mean(A,1);
mA2 = mean(A,2);

dA = det(A); % Determinant
iA = inv(A); % Inverse
piC = pinv(C); % Pseudo Inverse

da = diff(c); % Difference
dda = diff(diff(c));
isequal(diff(c,2),diff(diff(c)))
difA1 = diff(A,1,1);
difA2 = diff(A,1,2);

ranka = rank(a);
rankA = rank(A);

spa = sparse(A);
fa = full(spa);
% Eigen Values and Eigen Vectors
EA = eig(A); % Eigen Values of Square Matrix A
[VA,DA] = eig(A); % Eigen values and right eigen vector
[VA1,DA1,WA] = eig(A); % Eigen values and full eigen vectors
EAB = eig(A,B); % Eigen Values of Square Matrix A and B

Mina = min(a);
MinA = min(A);
Maxa = max(b);
MaxA = max(B);

sig = 3*randn(1,100)+2*rand(1,100);
[PKS,locs,widths,prominences] = findpeaks(sig);
findpeaks(sig);
%% Cells
clearvars, clc

scz = [2,3];
C1 = cell(5);
C2 = cell(2,3);
C3 = cell(scz);
C4 = {127,"R1C2",'Hello',1:50;"R2C1",true,rand(25,25),255};

c13 = C4{1,3};
c14 = C4{1,4};
cc14 = C4{1,4}(15:25);
%% Structures
clearvars, clc

S1 = struct([]);

FN = "Soroush";
LN = "Mirmobini";
G = "Male";
A = 32;
H = 170;
W = 70;

S2 = struct('First_name',FN,'Last_name',LN,'Gender',G,'Age',A,...
    'Height',H,'Weight',W);

S3.First_name = FN;
S3.Last_name = LN;
S3.Gender = G;
S3.Age = A;
S3.Height = H;
S3.Weight = W;

m1 = rand(5,5);
m2 = zeros(10,15);
m3 = {1,2,1:20,"Hello"};

S4 = struct('M1',m1,'M2',m2,'M3',m3);

M1 = S4.M1;
M2 = S4.M2;
M3 = S4.M3;
%% Table and Categorical Variables
clearvars, clc

Names = {'Ali';'Mohammad';'Narges';'Nazanin'};
Grades = [10;14;18;5];
Pass = logical([0;1;1;0]);

T = table(Names,Grades,Pass);
disp(T)

G = T.Grades(1);
M = mean(T.Grades);

T.Properties
T.Properties.Description = 'Final Grade Table';
T.Properties
%% Converting Between Types
clearvars, clc
% Matrix to ...
a = [12 15.8 13 9];   b = [5 9 15 7.5];

astr = mat2str(a); A = eval(astr);

acell = mat2cell(rand(60,50),[30 30],50);
% Cell to ...
amat = cell2mat(acell);

bcell = {1:50;11:60;21:70}; bfields = ['A';'B';'C'];
bstruct = cell2struct(bcell,bfields,1);

Patients = {'Gender' 'Age' 'Height' 'Weight' 'Smoker';...
    'M' 38 71 176 true;...
    'M' 43 69 163 false;...
    'M' 38 64 131 false;...
    'F' 38 64 131 false;...
    'F' 40 67 133 false;...
    'F' 49 64 119 false};
ptable = cell2table(Patients(2:end,:));
ptable.Properties.VariableNames = Patients(1,:);
% Structure to ...
Ccell = struct2cell(bstruct);

S.Name = {'CLARK';'BROWN';'MARTIN'};
S.Gender = {'M';'F';'M'};
S.SystolicBP = [124;122;130];
S.DiastolicBP = [93;80;92];

S_table = struct2table(S);
% Table to ...
SCell = table2cell(S_table);
SS = table2struct(S_table);
parray = table2array(ptable(2:end,2:end));

% END