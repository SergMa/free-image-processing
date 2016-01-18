% Syntax:
%   [out] = bw_gamma( in, gamma );
% Description:
%   Gamma filter: out = in^(1/gamma)
% Inputs:
%   in    - bw-image - matrix [H x W], double [0..255]
%   gamma - gamma coefficient - double
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [ out ] = bw_gamma( in, gamma )
out = in/255; %scale into [0..1] range
out = out.^(1/gamma); %gamma correction
out = 255*out; %scale back into [0..255] range
return
