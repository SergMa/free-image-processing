% Syntax:
%   show_image( img )
%   [h] = show_image( img )
% Details:
%   Show image img on current axis
% Inputs:
%   img = image in one of supported formats:
%         double RGB format: [0..255,0..255,0..255]
%         double BW format:  [0..255]
% Outputs:
%   h   = pointer to created plot

function show_image( img )

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

    % Limit to [0..255]
    img = min(img,255);
    img = max(img,0);

    % Convert image into RGB if needed
    if(s==1)
        rgb = uint16(zeros(h,w,3));
        rgb(:,:,1) = uint16((65535/255)*img);
        rgb(:,:,2) = rgb(:,:,1);
        rgb(:,:,3) = rgb(:,:,1);
        h = image( uint16(rgb) );
        axis image;
        axis off;
    else
        % Plot image on current axes
        h = image( uint16((65535/255)*img) );
        axis image;
        axis off;
    end



return
