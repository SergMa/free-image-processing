% Syntax:
%   [out] = bw_contrast( in, K );
% Description:
%   Contrast filter: out = K*(in–avg)+avg,
%   where avg is average intensity of image
% Inputs:
%   in - bw-image - matrix [H x W], double
%   K  - contrast coefficient - double
% Outputs:
%   out - output bw-image - matrix [H x W], double

function [ out ] = bw_brightness( in, K )
%Find average intensity
avgv = mean(mean(in));
out = K*(in-avgv) + avgv;
return
