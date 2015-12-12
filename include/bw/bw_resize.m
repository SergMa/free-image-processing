% SYNTAX:
%   [out] = bw_resize( in, scale )
%   [out] = bw_resize( in, scale, method )
%   [out] = bw_resize( in, yscale, xscale )
%   [out] = bw_resize( in, yscale, xscale, method )
% DESCRIPTION:
%   Resize bw-image.
% INPUTS:
%   img    - bw-image to resize
%   scale  - scale over Y,X axes
%   yscale - scale over Y axis
%   xscale - scale over X axis
%   method - method of interpolation: 'nearest','bilinear','spline','bicubic'(default)
% OUTPUTS:
%   out - resized bw-image.

function [out] = bw_resize(in,scale,varargin)

% Prepare arguments
if nargin==2
    yscale = scale;
    xscale = scale;
    method = 'bicubic';
elseif nargin==3
    if isa(varargin{1},'double')
        yscale = scale;
        xscale = varargin{1};
        method = 'bicubic';
    elseif isa(varargin{1},'char')
        yscale = scale;
        xscale = scale;
        method = varargin{1};
    else
        error('Invalid 3rd argument');
    end
elseif nargin==4
    yscale = scale;
    xscale = varargin{1};
    method = varargin{2};
else
    error('Invalid number of arguments');
end

% Size of IN (distance between pixels centers = 1)
h = size(in,1);
w = size(in,2);

% New size of image
hout = round(h * yscale);
wout = round(w * xscale);

% Distance between pixels of new image
ys = (h-1)/(hout-1);
xs = (w-1)/(wout-1);

% Initialize array for new image (note centers of pixels)
[x,y] = meshgrid( 0.5:1:w, 0.5:1:h );
z = in;
[xi,yi] = meshgrid( 0.5:xs:w-0.5, 0.5:ys:h-0.5 );

switch method
case 'nearest'
    out = interp2(x,y,z, xi,yi, 'nearest');
case 'bilinear'
    out = interp2(x,y,z, xi,yi, 'linear');
case 'spline'
    out = interp2(x,y,z, xi,yi, 'spline');
case 'bicubic'
    out = interp2(x,y,z, xi,yi, 'cubic');
otherwise
    error('invalid resize method');
end

return
