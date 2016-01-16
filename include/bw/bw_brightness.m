% Syntax:
%   [out] = bw_brightness( in, shift );
% Description:
%   Brightness filter (shift): out = in + shift
% Inputs:
%   in    - bw-image - matrix [H x W], double
%   shift - brightness coefficient - double
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [ out ] = bw_brightness( in, k )
out = in + k;
return
