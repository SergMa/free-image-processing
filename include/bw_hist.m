% [histn]            = bw_hist( img );
% [histn]            = bw_hist( img, cols );
% [histn]            = bw_hist( img, cols, min, max );
% [histn,histx,colw] = bw_hist( ... );
%
% Returns image histogramm
%
% in      - bw-image - matrix [H x W], double [0..1]
% cols    - number of histogram columns, double (default is 100)
% min,max - limits of pixels values (default is MIN=0,MAX=255).
%           Pixels with outside values will not be counted.
% histn   - N(pixel value)         - vector [1 x COLS] - height of histogramm columns
% histx   - centers(pixels values) - vector [1 x COLS] - centers of columns (pixels values)
% colw    - width of hist columns

function [varargout] = bw_hist( img, varargin );

if nargin==1
    cols = 100;
    mini = 0;
    maxi = 255;
elseif nargin==2
    cols = varargin{1};
    mini = 0;
    maxi = 255;
elseif nargin==4
    cols = varargin{1};
    mini  = varargin{2};
    maxi  = varargin{3};
else
    error('Invalid number of input arguments');
end;

% Get image size
h = size(img,1);
w = size(img,2);

% Find hist params
colw = (maxi-mini)/cols;  % width of hist column
colw_ = 1/colw;           % for speed improving
delta = colw*0.1;

% Build hist
histn = zeros(1,cols);
for i = 1:h
for j = 1:w
    % Calculate hist column number
    x = img(i,j);
    if (x>=mini) && (x<=maxi)
        x = x - mini;
        colx = fix( x*colw_-delta ) + 1;
        histn(colx) = histn(colx) + 1;
    end
end
end

% Parse output arguments
if nargout==1
    varargout{1} = histn;
elseif nargout==2 || nargout==3
    % Form histx - centers of hist columns
    histx = zeros(1,cols);
    for col = 1:cols
        histx(col) = mini + (col-1)*colw;
    end
    varargout{1} = histn;
    varargout{2} = histx;
    if nargout==3
        varargout{3} = colw;
    end
else
    error('Invalid number of output arguments');
end

return;
