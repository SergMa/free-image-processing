% SYNTAX:
%   [out] = bw_shift( in, yshift, xshift )
%   [out] = bw_shift( in, yshift, xshift, method )
%   [out] = bw_shift( in, yshift, xshift, background )
%   [out] = bw_shift( in, yshift, xshift, background, method )
% DESCRIPTION:
%   Shift bw-image in plane, increase size of result image,
%   fill background with defined intensity.
% INPUTS:
%   in - input bw-image
%   yshift - shift over Y axis;
%   xshift - shift over X axis;
%   background - intensity to fill empty (background) area - 0 is default
%   method - method of interpolation: 'nearest','bilinear','spline','bicubic'(default)
% OUTPUTS:
%   out

function [ out ] = bw_shift( in, yshift, xshift, varargin )

% Prepare arguments
if nargin==3
    background = 0;
    method = 'bicubic';
elseif nargin==4
    if isa(varargin{1},'double')
        background = varargin{1};
        method = 'bicubic';
    elseif isa(varargin{1},'char')
        background = 0;
        method = varargin{1};
    else
        error('Invalid 4th argument');
    end
elseif nargin==5
    background = varargin{1};
    method = varargin{2};
else
    error('Invalid number of arguments');

% Make shift





return
