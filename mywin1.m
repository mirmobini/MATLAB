function D = mywin1(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Help%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function segments the input "X" into windows
% Inputs:
%   X: the Input Vector (1-D Vector)
%   W = Window length (Scalar <= length(X))
%   pad (optional):
%       true: with padding
%       false: withouit padding (default)
%   PadVal (optional): Pad value (default = 0)
%   ovp (optional): Overlap Percent (default = 0)
%   show (optional):
%       true: plot the vector and segments (default)
%       false: don't plot
% Outputs:
%   D: Segmented signal
%   Figure:
%           Original Vector
%           Segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cheking I/O
if nargin>2
    P = varargin{3};
    
    if nargin>3
        PV = varargin{4};
    else
        PV = 0;
    end
    
else
    P = false;
    PV = 0;
end

if nargin>4
    OL = floor(varargin{2}*varargin{5}/100);
else
    OL = 0;
end

if nargin>5
    Vis = varargin{6};
else
    Vis = true;
end

if nargin<2
    error('not enough input arguments')
elseif nargin>6
    error('too many input arguments')
elseif nargout>1
    error('too many output arguments')
elseif ~isvector(varargin{1}) || length(varargin{1})<=1
    error('X should be a vector')
elseif ~isscalar(varargin{2})&& ~isinteger(varargin{2})
    error('W should be an 1x1 integer')
elseif varargin{2}>length(varargin{1})
    error('W is greater than Length(X)')
elseif ~islogical(P) && P~=1 && P~=0
    error('pad should be a logical state')
elseif ~isscalar(PV)
    error('Pad Value should be 1X1')
elseif ((~isscalar(OL) && ~isinteger(OL)) || OL>99 || OL<0)
    error('overlap should be entered in percent (0% - 99%)')
elseif ~islogical(Vis) && Vis~=1 && Vis~=0
    error('show should be a logical state')
else
    % Main code
    X = varargin{1};
    W = varargin{2};
    % Padding
    switch P
        case false
            L = length(X);
            n = floor(L/(W-OL))-OL;
            D = zeros(n,W);
        case true
            Npad = W-mod(length(X),(W-OL));
            PAD = repmat(PV,[1,Npad]);
            X = [X,PAD];
            L = length(X);
            n = floor(L/(W-OL))-OL;
            D = zeros(n,W);
    end
    
    % Windowing
    D(1,:) = X(1:W);
    for i = 2:n
        D(i,:) = X((i-1)*(W-OL)+1:i*(W-OL)+OL);
    end
    
    % Visualizing
    if Vis==true
        figure('Name','Original and Segmented Vector')
        subplot 211
        plot(X);
        subplot 212
        hold on;
        for i = 1: size(D,1)
            plot(D(i,:));
        end
    end
    
end


end
