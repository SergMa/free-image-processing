% Syntax:
%   [img] = load_image(filename)
%   [img] = load_image(filename,format)
% Details:
%   Load image from file and convert it into defined format
% Inputs:
%   filename = [string] - name of image file
%   format   = [string] - wanted format of loaded image:
%              'rgb' - double RGB format: [0..255,0..255,0..255]
%              'bw'  - double BW format:  [0..255]
%              'file'- (default) format depends of original image file format
% Outputs:
%   img      = loaded image in defined format

function [img] = load_image( filename, varargin )

    % Idiot syndrom checks
    if ~ischar(filename)
        error('invalid filename (must be string)');
    end
    if length(filename) <= 0
        error('invalid filename (zero length string)');
    end
    if nargin > 2
        error('invalid number of input arguments');
    end
    if nargin==1
        format = 'file'; %set to default value
    else
        format = varargin{1};
        if ~ischar(format)
            error('invalid format (must be string)');
        end
        switch format
        case 'rgb'
        case 'bw'
        case 'file'
        otherwise
            error('unsupported format');
        end
    end
    
    % Read image from file
    [img,map] = imread(filename);
    h = size(img,1);
    w = size(img,2);
    s = size(img,3);
    if (h<=0) || (w<=0) || ((s~=1) && (s~=3))
        error('invalid height/width/layers of image');
    end
    if (s==3) && (~isempty(map))
        error('invalid layers for indexed image');
    end

    % Convert image into double [0..255] format
    if isempty(map)
        % non-indexed image (1 or 3 layers)
        switch class(img)
        case 'logical'
            img = 255*double(img);
        case 'uint8'
            img = 1*double(img);
        case 'uint16'
            img = (255/65535)*double(img);
        case 'uint32'
            img = (255/4294967295)*double(img);
        case 'double'
            img = 255*img;
        otherwise
            error('unexpected type of image format');
        end
    else
        % indexed image: img is picture, map is color table [0..1,0..1,0..1]
        if exist('ind2rgb')
            img = 255*double( ind2rgb(img,map) );
        else
            rgb = zeros(h,w,3);
            for i = 1:h
            for j = 1:w
                rgb(i,j,:) = map( double(img(i,j))+1, : );
            end
            end
            img = 255*rgb;
        end
    end
    h = size(img,1);
    w = size(img,2);
    s = size(img,3);

    % Convert image into defined format
    if strcmp(format,'file')
        if (s==1)
            format = 'bw';
        else (s==3)
            format = 'rgb';
        end
    end

    switch format
    case 'bw'
        if s==3
            img(:,:,1) = sum(img,3) / 3; %simple rgb to bw conversion formula
            img = img(:,:,1);
        end
    case 'rgb'
        if s==1
            rgb = zeros(h,w,3); %make 3-layers image
            rgb(:,:,1) = img;
            rgb(:,:,2) = img;
            rgb(:,:,3) = img;
            img = rgb;
        end
    end
    
    %check and round colors
    img = round(img);
    img = max(img,0);
    img = min(img,255);

return
