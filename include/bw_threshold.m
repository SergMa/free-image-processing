% Syntax:
%   [out] = bw_threshold( in, threshold );
%   [out] = bw_threshold( in, threshold, lo, hi );
% Description:
%   Threshold filter.
% Inputs:
%   in        - bw-image - matrix [H x W], double
%   threshold - threshold value
%   lo        - intensity value if <  threshold (default is 0)
%   hi        - intensity value if >= threshold (default is 255)
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [out] = bw_median( in, threshold, varargin )

%Check input arguments
if nargin==2
    lo = 0;
    hi = 255;
elseif nargin==4
    lo = varargin{1};
    hi = varargin{2};
else
    error('Invalid number of arguments');
end

%Threshold filter

%ver1:
%out = (hi-lo) * double( in >= threshold ) + lo;

%ver2:
h=size(in,1);
w=size(in,2);

out = zeros(h,w);
for i=1:h
for j=1:w
    if in(i,j) < threshold
        out(i,j) = lo;
    else
        out(i,j) = hi;
    end
end
end

return;
