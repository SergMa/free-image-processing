% Syntax:
%   [bw] = convert_rgb_to_bw( rgb )
%   [bw] = convert_rgb_to_bw( rgb, formula )
% Details:
%   Convert image from RGB to BW format
% Inputs:
%   rgb     = image in double RGB format: [0..255,0..255,0..255]
%   formula = [string] - formula of RGB to BW conversion:
%             'i' - (default) BW=(R+G+B)/3
%             'g' - BW=G
%             'y' - BW=0.299*R + 0.587*G + 0.114*B
% Outputs:
%   bw      = image in double BW format: [0..255]

function [bw] = convert_rgb_to_bw( rgb, varargin )

    % Idiot syndrom checks
    if ~strcmp(class(rgb),'double')
        error('invalid class of image (must be double)');
    end
    h = size(rgb,1);
    w = size(rgb,2);
    s = size(rgb,3);
    if (h<=0) || (w<=0) || (s~=3)
        error('invalid height/width/layers of image');
    end

    if nargin<1 || nargin>2
        error('invalid number of input arguments');
    end

    if nargin==1
        formula = 'i';
    else
        formula = varargin{1};
    end

    % Make conversion
    switch formula
    case 'i'
        bw = sum(rgb,3)/3;
    case 'g'
        bw = rgb(:,:,2);
    case 'y'
        bw = 0.299*rgb(:,:,1) + 0.587*rgb(:,:,2) + 0.114*rgb(:,:,3);
    otherwise
        error('unsupported formula');
    end

    % Limit to [0..255]
    bw = round(bw);
    bw = max(bw,0);
    bw = min(bw,255);

return
