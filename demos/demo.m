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

% %test for _conv2()
% X = [1 2;
%      4 5];
% Y = [1 2 3 4 5;
%      3 4 5 6 7];
% 
% %X = rand(2,3);
% %Y = rand(5,4);
% 
% X
% Y
% Z = conv2(X,Y,'same');
% Z2 = my_conv2(X,Y);
% Z
% Z2
% 
% %diff = max(max(abs(Z-Z2)));
% %diff
% 
% 
% break;

%rgb = load_image('../samples/lena.bmp','rgb');
%rgb = load_image('../samples/lena_bw.jpg','rgb');
%rgb = load_image('../samples/lena.jpg','file');

bw = load_image('../samples/lena_bw_pepper.jpg','bw');
bw = load_image('../samples/lena_bw_low_contrast.jpg','bw');

figure(1);
show_image(bw);

%figure(2);
%bw_show(bw,'blue');

figure(3);
%bw2 = bw_fliplr(bw);
%bw2 = bw_flipud(bw);
%bw2 = bw_resize(bw,1.3,1.3,'nearest');
%bw2 = bw_resize(bw,0.3,0.3,'bicubic');
%bw2 = bw_rotate(bw,'-90');
%bw2 = bw_rotate(bw,45);
%bw2 = bw_brightness(bw,-50);
%bw2 = bw_contrast(bw,3);
%bw2 = bw_linear(bw,2,-128);
%bw2 = bw_gamma(bw,1.5);
%bw2 = bw_limit(bw);
%bw2 = bw_negative(bw);
%bw2 = bw_median(bw, 5);
bw2 = bw_autocontrast(bw);
bw2 = bw_autocontrast_highlow(bw,40);
bw_show(bw2,'grey');




%figure(2);
%image_hist(bw,50,'all');

%figure(3);
%image_hist(img,50,'i');

%save_image(img,'tmp','bmp');
%save_image(img,'tmp','jpg');
%save_image(img,'tmp','png');
%save_image(img,'tmp','tif');

