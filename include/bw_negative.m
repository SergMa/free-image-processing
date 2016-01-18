% Syntax:
%   [out] = bw_negative( in );
%   [out] = bw_negative( in, max );
% Description:
%   Negative filter: out = max - in
% Inputs:
%   in    - bw-image - matrix [H x W], double
%   max   - maximum of in pixel value range - double (default is 255)
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [ out ] = bw_negative( in, varargin )

%Check input arguments
if nargin==1
    maxv = 255;
elseif nargin==2
    if isa(varargin{1},'double')
        maxv = varargin{1};
    else
        error('Invalid 2nd argument');
    end
else
    error('Invalid number of arguments');
end

%Make image negative
out = maxv - in;
return
