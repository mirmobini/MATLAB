%% Initialization
close all
clear
clc
%% Inputs
I = randi(100,[22,44]); % Random matrix (input)
blk = [3,7]; % Block Size
P = true; % padding (0/1)
PV = 0; % Pad value
%% Blocking
X = I; % Saving I before padding
% Zeor padding
if P == true && (mod(size(X,1),blk(1))~=0 || mod(size(X,2),blk(2))~=0)% Checking 
Npad_row = blk(1)-mod(size(X,1),blk(1)); % row pad size
Npad_column = blk(2)-mod(size(X,2),blk(2)); % column pad size
X(end:end+Npad_row,:) = PV; % row padding
X(:,end:end+Npad_column) = PV; % column padding
end
% Segmenting
n_rows = floor(size(X,1)/blk(1));
n_column = floor(size(X,2)/blk(2));
n = n_rows + n_column; % Number of blocks

X_blk = zeros(blk(1),blk(2),n); % Void Space for storing the blocks

c = 1; % block Counter

for i = 1:n_rows
    for j = 1:n_column
        X_blk(:,:,c) = X(1+(i-1)*blk(1):i*blk(1) , 1+(j-1)*blk(2):j*blk(2));
        c = c+1; % Block counting
    end
end
% END