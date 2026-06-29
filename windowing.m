function D = windowing(X,W,Pad,PadVal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Help%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function segments the input into the windows
% Inputs:
% X: the Input signal
% W = Window length
% pad:
% true: with padding
% false: withouit padding
% Outputs:
% D: Segmented signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cheking I/O
if nargin>2 && nargin<=4
    P = Pad;
else
    P = false;
end

if nargin == 4
    PV = PadVal;
else
    PV = 0;
end

if nargin<2
    error('not enough input arguments')
elseif nargin>4
    error('too many input arguments')
elseif nargout>1
    error('too many output arguments')
elseif ~isvector(X) || length(X)<=1
    error('X should be a vector')
elseif ~isscalar(W)&& ~isinteger(W)
    error('W should be an 1X1 integer')
elseif W>length(X)
    error('W is greater than Length(X)')
elseif ~islogical(P)
    error('pad should be a logical state')
elseif ~isscalar(PV)
    error('Pad Value should be 1X1')
else
    % Main code
    switch P
        case false
            
            L = length(X);
            n = floor(L/W);
            D = zeros(n,W);
            for i = 1:n
                D(i,:) = X((i-1)*W+1:i*W);
            end
            
        case true
            Npad = W-mod(length(X),W);
            PAD = repmat(PV,[1,Npad]);
            X = [X,PAD];
            L = length(X);
            n = floor(L/W);
            D = zeros(n,W);
            for i = 1:n
                D(i,:) = X((i-1)*W+1:i*W);
            end
    end
end
end