%%
close all
clear
clc
%%
n = 103;
S = 1:n;
W = 3;
P = true;
PV = NaN;
%%
SEG = windowing(S,W,P,PV);