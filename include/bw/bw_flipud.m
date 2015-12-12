% SYNTAX:
%   [out] = bw_fliplr(in)
% DESCRIPTION:
%   Flip bw-image up-down
% INPUTS:
%   in  - bw-image to flip;
% OUTPUTS:
%   out - flipped bw-image.

function [out] = bw_flipup(in)

out = flipud(in);

return
