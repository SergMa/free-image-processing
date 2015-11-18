% Syntax:
%   [out] = bw_fliplr(in)
% Details:
%   Flip image left-right
% Inputs:
%   in  = input image in one of supported formats:
%         double RGB format: [0..255,0..255,0..255]
%         double BW format:  [0..255]
% Outputs:
%   out = result image in one of supported formats:
%         double RGB format: [0..255,0..255,0..255]
%         double BW format:  [0..255]

function [out] = fliplr_image(in)
out = fliplr(in);
return
