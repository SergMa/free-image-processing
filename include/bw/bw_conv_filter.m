% SYNTAX:
%   [out] = bw_conv_filter( in, mask, origin );
% DESCRIPTION:
%   Convolution filter (without mask normalization)
% INPUTS:
%   in     - bw-image        - matrix [H x W], double
%   mask   - mask of filter  - matrix [HM x WM], double
%   origin - center of mask  - vector [1 x 2] = { row,col }
% OUTPUTS:
%   out    - output bw-image - matrix [H x W], double

function [ out ] = bw_conv_filter( in, mask, origin )

% Get image size
h = size(in,1);
w = size(in,2);

% Get mask size
hm = size(mask,1);
wm = size(mask,2);

if (origin(1) < 1) || (origin(1) > hm) || (origin(2) < 1) || (origin(2) > wm)
    error('Invalid origin');
end

% 2D-convolution filter (returns out with the same size as in,
% at edges we do not consider outside pixels of mask)
out = zeros(h,w);
for i = 1:h
for j = 1:w
    for k = 1:hm
    for l = 1:wm
        im = i+k-origin(1);
        jm = j+l-origin(2);
        if (im > 0) && (im <= h) && (jm > 0) && (jm <= w)
            out(i,j) = out(i,j) + mask(k,l) * in(im ,jm);
        end
    end
    end
end
end

return;
