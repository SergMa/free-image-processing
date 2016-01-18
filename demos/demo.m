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

%rgb = load_image('../samples/lena.bmp','rgb');
%rgb = load_image('../samples/lena_bw.jpg','rgb');
%rgb = load_image('../samples/lena.jpg','file');

bw = load_image('../samples/lena.bmp','bw');

figure(1);
show_image(bw);

figure(2);
bw_show(bw,'blue');

figure(3);
%bw2 = bw_fliplr(bw);
%bw2 = bw_flipud(bw);
%bw2 = bw_resize(bw,1.3,1.3,'nearest');
%bw2 = bw_resize(bw,0.3,0.3,'bicubic');
%bw2 = bw_rotate(bw,'-90');
bw2 = bw_rotate(bw,45);
%bw2 = bw_brightness(bw,-50);
%bw2 = bw_contrast(bw,3);
%bw2 = bw_linear(bw,2,-128);
%bw2 = bw_gamma(bw,1.5);
%bw2 = bw_limit(bw);
bw_show(bw2,'grey');




%figure(2);
%image_hist(bw,50,'all');

%figure(3);
%image_hist(img,50,'i');

%save_image(img,'tmp','bmp');
%save_image(img,'tmp','jpg');
%save_image(img,'tmp','png');
%save_image(img,'tmp','tif');

