% Syntax:
%   image_hist( img );
%   image_hist( img, cols );
%   image_hist( img, cols, layer );
%   [h] = image_hist( ... );
%   [histv,histx] = image_hist( ... );
% Details:
%   Calculate histogram of image and/or plot it on current axis.
%   If no or one output arguments - calculate and plot histogramm
%   If two output arguments - only calculate histogramm
% Inputs:
%   img     = image in double BW/RGB format
%             double BW format: [0..255]
%             double RGB format: [0..255,0..255,0..255]
%   cols    = number of columns in histogramms (default is 256)
%   layer   = layer(s) to build histogramm: num (1,2,3...), 'r','g','b','i','all' (default is 'all')
% Outputs:
%   h       = pointer to created histogramm plot
%   histv   = matrix double [L x cols] - histogramm values (L depends of number of selected layers)
%   histx   = matrix double [1 x cols] - centers of histogramm bins

function [varargout] = image_hist( img, varargin );

% Idiot syndrom checks
if ~strcmp(class(img),'double')
    error('invalid class of image (must be double)');
end
h = size(img,1);
w = size(img,2);
s = size(img,3);
if (h<=0) || (w<=0) || ((s~=1) && (s~=3))
    error('invalid height/width/layers of image');
end

% Set arguments
switch nargin
case 1
    cols = 256;
    layer = 'all';
case 2
    cols = varargin{1};
    layer = 'all';
case 3
    cols = varargin{1};
    layer = varargin{2};
otherwise
    error('Invalid number of input arguments');
end

%Calculate histogramm of defined single layer
if strcmp(class(layer),'double')
    %layer is num
    %check
    if (layer<1) || (layer>s)
        error('invalid number of layer');
    end
    %buld histogramm
    [histv,histx] = hist( img(:,:,layer)(:), cols );
    plotcolor = 'k';

elseif strcmp(class(layer),'char')
    %layer is string
    switch(layer)
    case 'r'
        if s~=3
            error('layer=r is defined only for RGB images');
        end
        [histv,histx] = hist( img(:,:,1)(:), cols );
        plotcolor = 'r';
    case 'g'
        if s~=3
            error('layer=g is defined only for RGB images');
        end
        [histv,histx] = hist( img(:,:,2)(:), cols );
        plotcolor = 'g';
    case 'b'
        if s~=3
            error('layer=b is defined only for RGB images');
        end
        [histv,histx] = hist( img(:,:,3)(:), cols );
        plotcolor = 'b';
    case 'i'
        if (s~=1) && (s~=3)
            error('layer=i is defined only for RGB images');
        end
        imgi = (img(:,:,1)+img(:,:,2)+img(:,:,3))/3;
        [histv,histx] = hist( imgi(:), cols );
        plotcolor = 'k';
    case 'all'
        histv = [];
        for a=1:s
            [histva,histx] = hist( img(:,:,a)(:), cols );
            histv = [histv; histva];
        end
        if(s==1)
            plotcolor = 'k';
        elseif(s==3)
            plotcolor = 'rgb';
        else
            plotcolor = 'x';
        end
    otherwise
        error('unsupported layer value');
    end
else
    error('invalid class of layer argument');
end

%finish action
if(nargout < 2)
    %only plot histogramm
    switch plotcolor
    case 'r'
        h = plot(histx,histv,plotcolor);
    case 'g'
        h = plot(histx,histv,plotcolor);
    case 'b'
        h = plot(histx,histv,plotcolor);
    case 'k'
        h = plot(histx,histv,plotcolor);
    case 'rgb'
        h = plot(histx,histv(1,:),'r', histx,histv(2,:),'g', histx,histv(3,:),'b');
    case 'x'
        h = plot(histx,histv,plotcolor);
    end
    if(nargout==1)
        varargout{1} = h;
    end

elseif(nargout==2)
    varargout{1} = histv;
    varargout{2} = histx;

else
    error('invalid number of output arguments');
end

return
