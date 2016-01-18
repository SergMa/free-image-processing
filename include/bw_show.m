% Syntax:
%   bw_show( img )
%   bw_show( img, color )
%   [h] = bw_show(..)
% Description:
%   Show bw-image in current axes.
% Inputs:
%   img - bw-image to show: [H x W] matrix of double: [0..255].
%   color - color to show image: 'red','green','blue','grey','gray',[0..255,0..255,0..255].
% Returns:
%   h = pointer to created axis

function [h] = bw_show( img, varargin )

% Prepare arguments
if nargin==1
    color = [255 255 255];
elseif nargin==2
    if isa(varargin{1},'char')
        switch varargin{1}
        case 'red'
            color = [255 0 0];
        case 'green'
            color = [0 255 0];
        case 'blue'
            color = [0 0 255];
        case 'grey'
            color = [255 255 255];
        case 'gray'
            color = [255 255 255];
        otherwise
            error('Invalid COLOR');
        end
    elseif isa(varargin{1},'double')
        color = varargin{1};
        if length(color)~=3
            error('Invalid COLOR');
        end
    else
        error('Invalid COLOR');
    end
else
    error('Invalid number of arguments');
end

%Convert bw-image into RGB array
rgb(:,:,1) = uint16(round(img * color(1)));
rgb(:,:,2) = uint16(round(img * color(2)));
rgb(:,:,3) = uint16(round(img * color(3)));

h = image( rgb );
axis image;
axis off;
return
