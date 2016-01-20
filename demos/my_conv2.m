% Syntax:
%   [out] = _conv2( x, y );
%   [out] = _conv2( hcol, hraw, y );
%   [out] = _conv2( x, y, shape );
%   [out] = _conv2( hcol, hraw, y, shape );
% Description:
%   Analog of Matlab/Octave/FreeMat conv2() function, that
%   makes 2D-convolution of matricies x and y OR
%   convolves x first with the vector hcol, then convolves
%   x with the vector hraw - this is equivalent to
%   conv2(hcol(:)*hrow(:)', y).
% Inputs:
%   x - matrix [Mx x Nx], double
%   y - matrix [My x Ny], double
%   hcol - vector [My x 1], double
%   hraw - vector [1 x Ny], double
% Outputs:
%   out   - output bw-image - matrix [Mx+My-1 x Nx+Ny-1], double

function [ out ] = my_conv2( x, y, varargin )

% Check and set arguments
if nargin==2
    % _conv2( x, y )
    form = 1;
    shape = 'full';
elseif nargin==3 && isa(varargin{1},'double')
    % _conv2( hcol, hraw, y )
    form = 2;
    hcol = x;
    hraw = y;
    y = varargin{1};
    shape = 'full';
elseif nargin==3 && isa(varargin{1},'char')
    % _conv2( x, y, shape )
    form = 1;
    shape = varargin{1};
elseif nargin==4 && isa(varargin{1},'double') && isa(varargin{2},'char')
    % _conv2( hcol, hraw, y, shape )
    form = 2;
    hcol = x;
    hraw = y;
    y = varargin{1};
    shape = varargin{2};
else
    error('Invalid arguments');
end

if form==1

    % simple 2D convolution formula
    Mx = size(x,1);
    Nx = size(x,2);
    My = size(y,1);
    Ny = size(y,2);
    Mz = Mx + My - 1;
    Nz = Nx + Ny - 1;
    
    out = zeros(Mz,Nz);
    for i = 1:Mz
    for j = 1:Nz
        for k = 1:My
        for m = 1:Ny
            im = i-k+1;
            jm = j-m+1;
            if (im>=1) && (im<=Mx) && (jm>=1) && (jm<=Nx)
                out(i,j) = out(i,j) + x(im,jm) * y(k,m);
            end
        end
        end
    end
    end
    
else
    % 2 1D convolutions formula
    out = 0;
end

return
