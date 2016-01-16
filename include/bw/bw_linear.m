% Syntax:
%   [out] = bw_linear( in, k, b );
% Description:
%   Linear filter: out = k*in + b
% Inputs:
%   in - bw-image - matrix [H x W], double
%   k  - coefficient k - double
%   b  - coefficient b - double
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [ out ] = bw_linear( in, k )
out = k*in + b;
return
