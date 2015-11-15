%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demos for Image Processing Functions (MATLAB, Octave, FreeMat)               %
% demos.m                                                                      %
% (c) Sergei Mashkin                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

STDOUT = 1;

addpath('../include');

if is_octave
    fprintf(STDOUT,'Octave detected\n');
elseif is_matlab
    fprintf(STDOUT,'MATLAB detected\n');
elseif is_freemat
    fprintf(STDOUT,'FreeMat detected\n');
else
    fprintf(STDOUT,'Unknown environment detected\n');
    error('Unknown environment');
end

rgb = load_image('../samples/lena.bmp','rgb');
%rgb = load_image('../samples/lena_bw.jpg','rgb');
%rgb = load_image('../samples/lena.jpg','file');

img = rgb;
img = convert_rgb_to_bw(rgb);

%bw = sum(img,3)/3;

figure(1);
show_image(img);

%figure(2);
%image_hist(bw,50,'all');

%figure(3);
%image_hist(img,50,'i');

save_image(img,'tmp','bmp');
save_image(img,'tmp','jpg');
save_image(img,'tmp','png');
save_image(img,'tmp','tif');

