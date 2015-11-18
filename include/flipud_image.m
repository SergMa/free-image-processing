% Syntax:
%   [out] = bw_flipud(in)
% Details:
%   Flip image up-down
% Inputs:
%   in  = input image in one of supported formats:
%         double RGB format: [0..255,0..255,0..255]
%         double BW format:  [0..255]
% Outputs:
%   out = result image in one of supported formats:
%         double RGB format: [0..255,0..255,0..255]
%         double BW format:  [0..255]

function [out] = flipud_image(in)
out = flipud(in);
return
