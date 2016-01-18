% Syntax:
%   [out] = bw_fliplr(in)
% Description:
%   Flip bw-image left-right
% Inputs:
%   in  - bw-image to flip;
% Outputs:
%   out - flipped bw-image.

function [out] = bw_fliplr(in)
out = fliplr(in);
return
