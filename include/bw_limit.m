% Syntax:
%   [out] = bw_limit( in );
%   [out] = bw_limit( in, min, max );
% Description:
%   Limit intensity range into [min..max]
% Inputs:
%   in  - bw-image - matrix [H x W], double
%   min - minimal intensity - double (default is 0)
%   max - maximal intensity - double (default is 255)
% Outputs:
%   out   - output bw-image - matrix [H x W], double

function [ out ] = bw_gamma( in, varargin )

%Check input arguments
if nargin==1
    minv = 0;
    maxv = 255;
elseif nargin==3
    if isa(varargin{1},'double')
        minv = varargin{1};
    else
        error('Invalid 2nd argument');
    end

    if isa(varargin{2},'double')
        maxv = varargin{2};
    else
        error('Invalid 3rd argument');
    end
else
    error('Invalid number of arguments');
end

%Limit values
out = min( in,  maxv );
out = max( out, minv );
return
