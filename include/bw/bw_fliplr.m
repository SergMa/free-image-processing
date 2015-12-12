% SYNTAX:
%   [out] = bw_fliplr(in)
% DESCRIPTION:
%   Flip bw-image left-right
% INPUTS:
%   in  - bw-image to flip;
% OUTPUTS:
%   out - flipped bw-image.

function [out] = bw_fliplr(in)

out = fliplr(in);

return
