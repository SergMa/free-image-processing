% Syntax:
%   save_image(img,filename,format)
% Details:
%   Save image of BW or RGB format into file with defined format
% Inputs:
%   img = image in one of supported formats:
%         double RGB format: [0..255,0..255,0..255]
%         double BW format:  [0..255]
%   filename = string - name of file
%   format   = string - format of file: 'bmp','jpeg' or 'jpg','png','tiff' or 'tif'
% Outputs:
%   no outputs

function [] = save_image(img,filename,format);

% Idiot syndrome check
if ~ischar(filename)
    error('invalid filename (bad class)');
end;
if length(filename) <= 0
    error('invalid filename (bad length)');
end;
if ~ischar(format)
    error('invalid format (bad class)');
end;
if length(format) <= 0
    error('invalid format (bad length)');
end;

if ~strcmp(class(img),'double')
    error('invalid class of image (must be double)');
end
h = size(img,1);
w = size(img,2);
s = size(img,3);
if (h<=0) || (w<=0) || ((s~=1) && (s~=3))
    error('invalid height/width/layers of image');
end

% Limit to [0..255]
img = min(img,255);
img = max(img,0);
img = uint8(img);

switch format
case 'bmp'
    % 24 bits, no commpression
    if is_matlab || is_octave
        imwrite(img,filename,'bmp');
    elseif is_freemat
        imwrite(img, [filename,'.bmp']);
    end

case 'jpeg'
    % 8 bits
    if is_matlab || is_octave
        imwrite(img,filename,'jpg','Quality',100);
    elseif is_freemat
        imwrite(img, [filename,'.jpg']);
    end

case 'jpg'
    % 8 bits
    if is_matlab || is_octave
        imwrite(img,filename,'jpg','Quality',100);
    elseif is_freemat
        imwrite(img, [filename,'.jpg']);
    end

case 'png'
    % 24 bits
    if is_matlab || is_octave
        imwrite(img,filename,'png','BitDepth',16);
    elseif is_freemat
        imwrite(img, [filename,'.png']);
    end

case 'tiff'
    % 24 bits
    if is_matlab || is_octave
        imwrite(img,filename,'tif','Compression','packbits');
    elseif is_freemat
        imwrite(img, [filename,'.tif']);
    end

case 'tif'
    % 24 bits
    if is_matlab || is_octave
        imwrite(img,filename,'tif','Compression','packbits');
    elseif is_freemat
        imwrite(img, [filename,'.tif']);
    end

otherwise
    error('not supported format');
end

return
