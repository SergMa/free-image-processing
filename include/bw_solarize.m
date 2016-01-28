% Syntax:
%   [OUT] = bw_solarize( IN );
%   [OUT] = bw_solarize( IN, K );
% Description:
%   Solarization filter: OUT = K*IN*(max(IN)-IN)
% Inputs:
%   IN     - bw-image        - matrix [H x W], double
%   K      - solarization coefficient (contrast) - double (default = 4/max(IN))
% Outputs:
%   OUT    - output bw-image - matrix [H x W], double

function [ out ] = bw_solarize( in, varargin )

% Parse input arguments
if nargin==1
    maxin = max(max(in));
    k = 4/maxin;
elseif nargin==2
    maxin = max(max(in));
    k = varargin{1};
else
    error('Invalid number of arguments');
end;

if maxin==0
    out = in;
else
    out = k*in.*(maxin-in);
end;
