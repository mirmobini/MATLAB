% 9. Statistics
%% Initializing MATLAB
close all
clear
clc
%% Descriptive Statistics
% Statistical Data Types
Names = categorical({'Bita';'Negin';'Hatef';'Bahar';'Sanaz';'Davood'}); % Categorical
Gender = categorical({'F';'F';'M';'F';'F';'M'}); % Categorical
Ranks = {'1st';'2nd';'3rd';'4th';'5th';'6th'}; % Ranked
BodyTemp = [36.5;37.2;37;36.7;36.8;36.6]; % Continuous
Dice = randi(6,[6 1]); % Discrete
% Statistical plots (data visualization)
T = table(Names,Gender,Ranks,BodyTemp,Dice);disp(T) % Table show
figure('Name','Data Visualization')
subplot 131,plot(BodyTemp,Names,'kx'), title('Dot plot') % Dot plot
subplot 132,histogram(BodyTemp,4); title('Histogram') % Histogram
subplot 133,bar(Names,BodyTemp), title('Bar plot') % Bar chart

A = randn(1,200); % random numbers picked from a normal distribution
B = rand(1,200);  % random numbers picked from a uniform distribution

figure('Name','Univariate Histogram')
subplot 221,plot(A,'ro');title('A') % Dot plot
subplot 223,HA = histogram(A);title('histogram(A)')% Histogram
subplot 222,plot(B,'go');title('B')
subplot 224,HB = histogram(B);title('histogram(B)') % hist(B)


Mean = mean(A);
Standard_Deviation = std(A);
Variance = var(A);
Median = median(A);
Mode = mode(A);
IQR = iqr(A);

figure('Name','Bivariate Histogram')
histogram2(A,B),title('histogram2(A,B)') % hist3(x)
figure
scatterhist(A,B) % scatterhistogram(A,B)
Correlation = corr(A,B);
Cross_Correlation = xcorr(A,B);
Covariance = cov(A,B);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause()
%% Book Data
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
%% Bivariate Data
load('AlzheimersData.mat');
figure
scatter(AlzheimersData(:,1),AlzheimersData(:,2))
figure
plot(AlzheimersData(:,1),AlzheimersData(:,2))
figure
hist3(AlzheimersData,'CdataMode','auto')
COV = cov(AlzheimersData(:,1),AlzheimersData(:,2));
Cor_Pearson = corr(AlzheimersData(:,1),AlzheimersData(:,2),'Type','Pearson');
Cor_Kendall = corr(AlzheimersData(:,1),AlzheimersData(:,2),'Type','Kendall');
Cor_Spearman = corr(AlzheimersData(:,1),AlzheimersData(:,2),'Type','Spearman');
Cor_Coefs = corrcoef(AlzheimersData(:,1),AlzheimersData(:,2)); % Pearson's Correlation "Matrix"