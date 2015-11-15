% Syntax:
%   [rgb] = convert_bw_to_rgb( bw )
% Details:
%   Convert image from RGB to BW format
% Inputs:
%   bw    = image in double BW format: [0..255]
% Outputs:
%   rgb   = image in double RGB format: [0..255,0..255,0..255]

function [rgb] = convert_bw_to_rgb( bw )

    % Idiot syndrom checks
    if ~strcmp(class(bw),'double')
        error('invalid class of image (must be double)');
    end
    h = size(bw,1);
    w = size(bw,2);
    s = size(bw,3);
    if (h<=0) || (w<=0) || (s~=1)
        error('invalid height/width/layers of image');
    end

    % Make conversion
    rgb = zeros(h,w,3);
    rgb(:,:,1) = bw;
    rgb(:,:,2) = bw;
    rgb(:,:,3) = bw;

return
