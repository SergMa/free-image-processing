% Syntax:
%   [out] = bw_fliplr(in)
% Description:
%   Flip bw-image up-down
% Inputs:
%   in  - bw-image to flip;
% Outputs:
%   out - flipped bw-image.

function [out] = bw_flipup(in)
out = flipud(in);
return
