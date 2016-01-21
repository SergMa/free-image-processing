% Syntax:
%   [out] = bw_autocontrast_highlow( in, thresh );
%   [out] = bw_autocontrast_highlow( in, thresh, histcols );
%   [out] = bw_autocontrast_highlow( in, thresh, minv, maxv );
%   [out] = bw_autocontrast_highlow( in, thresh, histcols, minv, maxv );
% Description:
%   Auto-contrast filter with high-low cutting: expand pixel values to [minv..maxv] limits
% Inputs:
%   in - bw-image - matrix [H x W], double
%   thresh   - threshold value - double, percents of total number of pixels
%   histcols - number of columns in pixel values histogram (default is 256)
%   minv - minimum needed intensity (default is 0)
%   maxv - maximum needed intensity (default is 255)
% Outputs:
%   out - output bw-image - matrix [H x W], double

function [ out ] = bw_autocontrast_highlow( in, thresh, varargin )

% Parse input arguments
if nargin==2
    histcols = 256;
    minv     = 0;
    maxv     = 255;
elseif nargin==3
    histcols = varargin{1};
    minv     = 0;
    maxv     = 255;
elseif nargin==4
    histcols = 256;
    minv     = varargin{1};
    maxv     = varargin{2};
elseif nargin==5
    histcols = varargin{1};
    minv     = varargin{2};
    maxv     = varargin{3};
else
    error('Invalid number of arguments');
end;

% Get min, max pixel value
low  = min(min(in));
high = max(max(in));

% Total number of image pixels
n = size(in,1) * size(in,2);
tr = thresh * 0.01 * n;

% Get histogramm of pixels values
[histi,histx,colw] = bw_hist( in, histcols, low, high );

colw_half = colw * 0.5;

% Get histogramm limits
for i=1:histcols
    if sum(histi(1:i)) >= tr
        low = histx(i) - colw_half; %low limit
        break;
    end
end

for i=histcols:-1:1
    if sum(histi(i:end)) >= tr
        high = histx(i) + colw_half; %high limit
        break;
    end
end

% High-low autocontrast filter
if high > low
    out = ((in - low)/(high - low)) * (maxv - minv) + minv;
else
    out = in;
end

return;
