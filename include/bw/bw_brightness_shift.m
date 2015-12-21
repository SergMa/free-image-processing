% SYNTAX:
%   [out] = bw_brightness( in, K );
%
% Brightness filter (shift): OUT = IN + K
%
% IN     - bw-image        - matrix [H x W], double [0..1]
% K      - brightness coefficient - double
% OUT    - output bw-image - matrix [H x W], double [0..1]

function [ out ] = bw_brightness_shift( in, k )

out = in + k;

return;
