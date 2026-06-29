%% Initialization
close all
clear
clc
%% Segmenting a Matrix into the Square Blocks with Compatible Size
I = randi(1000,256);
blk = 8;
N = floor(numel(I)/blk^2);
D = zeros(blk,blk,N);
c = 1;
for i = 1:blk:size(I,1)
    for j = 1:blk:size(I,2)
        D(:,:,c) = I(i:i+blk-1,j:j+blk-1);
        c = c+1;
    end
end