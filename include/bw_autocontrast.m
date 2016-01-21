% Syntax:
%   [out] = bw_autocontrast( in );
%   [out] = bw_autocontrast( in, minv, maxv );
% Description:
%   Auto-contrast filter: expand pixel values to [minv..maxv] limits
% Inputs:
%   in - bw-image - matrix [H x W], double
%   minv - minimum needed intensity (default is 0)
%   maxv - maximum needed intensity (default is 255)
% Outputs:
%   out - output bw-image - matrix [H x W], double

function [ out ] = bw_autocontrast( in, varargin )

if nargin==1
    minv = 0;
    maxv = 255;
elseif nargin==3
    minv = varargin{1};
    maxv = varargin{2};
else
    error('Invalid number of arguments');
end

% Get min, max pixel value
mini = min(min(in));
maxi = max(max(in));

% Auto-contrast
if maxi > mini
    out = ((in - mini)/(maxi - mini)) * (maxv - minv) + minv;
else
    out = in;
end

return;
