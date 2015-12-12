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
%   background - intensity to fill empty (background) area
%   method - method of interpolation: 'nearest','bilinear','spline','bicubic'(default)
% OUTPUTS:
%   out

function [ out ] = bw_shift( in, yshift, xshift, varargin )



return
