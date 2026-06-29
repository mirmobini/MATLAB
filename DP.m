%% Initialization
close all
clear
clc
%% Loading the Data
load fortyStudentHeightData
load fortyStudentGenderData
%% Dot Plot
y = zeros(length(heights),1);
for i = 1: length(heights)
    for j = 1: length(heights)
       if heights(j) == heights(i)
           y(j) = y(j)+1;
       end
    end
end
figure
plot(heights,y,'o')
figure
bar(y)
%% Histogram
nbins = 10;
figure
histogram(heights)
figure
histogram(heights,nbins)
%% Bar chart
male = find(gender=='M');
female = find(gender=='F');
x = categorical({'Male','Female'});
M = length(male);
F = length(female);
figure
bar(x,[M,F])
%% Calculating
skew = 3*(mean(heights)-median(heights))/std(heights);
if skew>=-1 && skew<=1
MH = mean(heights);
SH = std(heights);
VH = var(heights);
figure
errorbar(MH,SH)
else
MdH = median(heights);
IQR = iqr(heights);
Range = range(heights);
LQ = quantile(heights,0.25);
UQ = quantile(heights,0.75);
figure
boxplot(heights)
end
MFH = mode(heights);
disp(['Most Frequent Height:  ',num2str(MFH)])
%%



