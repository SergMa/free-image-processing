% Syntax:
%   [out] = bw_median( in, r );
%   [out] = bw_median( in, ysize, xsize );
% Description:
%   Median filter.
% Inputs:
%   in - bw-image - matrix [H x W], double
%   size  - size of square filter window
%   ysize - vertical   size of rectangle filter window
%   xsize - horizontal size of rectangle filter window
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [out] = bw_median( in, varargin )

%Check input arguments
if nargin==2
    ysize = varargin{1};
    xsize = varargin{1};
elseif nargin==3
    ysize = varargin{1};
    xsize = varargin{2};
else
    error('Invalid number of arguments');
end

% Get image sizes
h = size(in,1);
w = size(in,2);

% Dont count outside pixels of mask on image edges
out = zeros(h,w);
arr = zeros(1,ysize*xsize);
for i = 1:h
for j = 1:w
    a = 0;
    for k = 1:ysize
    for l = 1:xsize
        im = i+k-1;
        jm = j+l-1;
        if (im >= 1) && (im <= h) && (jm >= 1) && (jm <= w)
            a = a + 1;
            arr(a) = in(im,jm);
        end
    end
    end
    % get median
    out(i,j) = median(arr(1:a));
end
end

return;
