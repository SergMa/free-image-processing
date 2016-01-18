% Syntax:
%   [out] = bw_rotate( in, angle )
%   [out] = bw_rotate( in, angle, method )
%
% Rotate bw-image. Background will be filled with black color
%
%   in    - bw-image to rotate: [H x W] matrix of double: [0..1].
%   angle - angle of rotation, graduses
%           or: '0','90'/'-270','180'/'-180','270'/'-90','360'/'-360'
%   method - method of interpolation: 'nearest','bilinear','spline','bicubic'(default)

function [out] = bw_rotate(in,angle,varargin)

% Parse input arguments
if nargin==2
    method = 'bicubic';
elseif nargin==3
    method = varargin{1};
else
    error('Invalid number of arguments');
end

% Rotate image
if isa(angle,'char')
    switch(angle)
    case '0'
        out = in;
        return;
    case '360'
        out = in;
        return;
    case '-360'
        out = in;
        return;
    case '90'
        out = rot90(in);
        return;
    case '-270'
        out = rot90(in);
        return;
    case '180'
        out = rot90(in,2);
        return;
    case '-180'
        out = rot90(in,2);
        return;
    case '270'
        out = rot90(in,3);
        return;
    case '-90'
        out = rot90(in,3);
        return;
    otherwise
        error('Invalid METHOD');
    end
elseif isa(angle,'double')
    %Convert angle from graduses to radians
    angle = pi * angle / 180;

    % Height, width of image (distance between pixels centers = 1)
    h = size(in,1);
    w = size(in,2);

    % Rotation matrix
    sn = sin(angle);
    cs = cos(angle);

    r = [ cs -sn ;
          sn  cs ];

    % Get height,width of rotated image
    % (make rotation around C point)
    %  0--------------> X
    %  |  1-----2
    %  |  |  C  |
    %  |  4-----3
    %Y V
    %

    % Corners  in Old image coordinates system
    % (note centers of pixels!)
    x1 = [ 0.5   ; 0.5   ];
    x2 = [ w-0.5 ; 0.5   ];
    x3 = [ w-0.5 ; h-0.5 ];
    x4 = [ 0.5   ; h-0.5 ];
    xc = [ 0.5*w ; 0.5*h ]; %image center

    % Pixels coordinates in Center coordinate system (not rotated)
    x1c = x1 - xc;
    x2c = x2 - xc;
    x3c = x3 - xc;
    x4c = x4 - xc;

    % Rotate image around C, note only 1,2,3,4 points in Center coordinate system
    x1cr = r * x1c;
    x2cr = r * x2c;
    x3cr = r * x3c;
    x4cr = r * x4c;

    % Get maximums
    maxxcrx = max([ x1cr(1),x2cr(1),x3cr(1),x4cr(1) ]);
    maxxcry = max([ x1cr(2),x2cr(2),x3cr(2),x4cr(2) ]);

    % Size of rotated image
    hnew = round(2*maxxcry) + 1;
    wnew = round(2*maxxcrx) + 1;

    % C coordinates in new image coordinate system
    xcnew = [ 0.5*wnew , 0.5*hnew ];

    % prepare interpolation
    [xnew,ynew] = meshgrid( 0.5:1:wnew , 0.5:1:hnew );

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Get coordinates of new image pixels in old image coordinate system
    xold = 0.5 + xc(1) + cs*(xnew-xcnew(1))-sn*(ynew-xcnew(2));
    yold = 0.5 + xc(2) + sn*(xnew-xcnew(1))+cs*(ynew-xcnew(2));

    switch method
    case 'nearest'
        out = interp2( in, xold, yold, 'nearest' );
    case 'bilinear'
        out = interp2( in, xold, yold, 'linear' );
    case 'spline'
        out = interp2( in, xold, yold, 'spline' );
    case 'bicubic'
        out = interp2( in, xold, yold, 'cubic' );
    otherwise
        error('Invalid METHOD');
    end

else
    error('Invalid ANGLE');
end
return
