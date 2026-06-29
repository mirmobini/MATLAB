%                   6. Text, Files and, I/O
%% Initializing MATLAB
close all
clear
clc
%% Displaying Texts
disp('It is a char')
disp("It is a String")
TXT = 'This is a variable';
disp(TXT)
TXT1 = {'Hello'; 'My name is Soroush';['I am ',num2str(32)]};
disp(TXT1)
X = '<a href = "https://www.google.com">Google</a>';
disp(X)

A = 2019;
B = 'MATLAB';
TXT2 = sprintf('Hello'); disp(TXT2)
TXT3 = sprintf(B); disp(TXT3)
TXT4 = sprintf('I am %d years old',32); disp(TXT4)
TXT5 = sprintf('We are using %s %u',B,A); disp(TXT5)
TXT6 = sprintf('Hello\nMy name is Soroush\nI am 32'); disp(TXT6)
TXT7 = sprintf('Hello\tMy name is Soroush\tI am 32'); disp(TXT7)

fprintf('\nEnter your codes here')
pause()
%% Some Useful Commands
clearvars, clc

txt = "abcd"; disp(upper(txt))
txt1 = "ABCD"; disp(lower(txt1))
txt2 = "Hello"; disp(reverse(txt2))
st = split('abcd ABCD');
st1 = split("abcd ABCD");
t = join(st);
t1 = join(st1);
st2 = strsplit("A B C D");
t2 = strjoin(st2);
txt3 = sprintf('Hello\nMy name is Soroush\nI am 32');
st3 = splitlines(txt3);
old = 'Soroush';
new = 'Mirmobini';
rtxt3 = replace(txt3,old,new);
ertxt3 = erase(txt3,'Hello');
txt4 = ["Mehdi" "Marzieh" "Mahdiyeh" "Taraneh" "Tara"];
TF = contains(txt4,"Eh",'IgnoreCase',true);
pause()
%% Files and I/O
clearvars, clc

In = input('Please input your desired dimension (in this format: row    column): ','s');
scz = str2double(split(In))';
A = rand(scz);

[x,y] = ginput(2);

Data.A = A;
Data.x = x;
Data.y = y;

save('Random Variables.mat','Data');
save('randvars','A','x','y');
save -ascii xy.txt x y

clearvars,clc
load('Random Variables.mat');
load('randvars.mat','A');
load xy.txt -ascii

Sigmat = readmatrix('fNIRSSignal.xlsx');
% xlsread('fNIRSSignal.xlsx');
% dlmread('xy.txt'); or dlmread('FileName.dat')
Sigcsv = csvread('fNIRSSignal.csv');
Sigcsv1 = importdata('fNIRSSignal1.csv');
XY = textread('xy.txt','%s');
%% Binary files
clearvars, clc
A = sprintf('Hello\nThis is a binary file writing test');

ID = fopen('Test.bin');
XY1 = fread(ID);
fclose(ID);

ID = fopen('Test.bin');
XY2 = fscanf(ID,'%s');
fclose(ID);

ID = fopen('Test1.bin','w');
fwrite(ID,A);
fclose(ID);

ID = fopen('Test2.bin','w');
fprintf(ID,'%s',A);
fclose(ID);

ID = fopen('Test1.bin');
XY3 = fscanf(ID,'%s');
fclose(ID);

ID = fopen('Test2.bin');
XY4 = fscanf(ID,'%s');
fclose(ID);

% END