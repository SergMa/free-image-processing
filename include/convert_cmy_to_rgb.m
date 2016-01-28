function [RGB] = convert_cmy_to_rgb(CMY);
% [RGB] = convert_cmy_to_rgb(CMY);
%
% Преобразование цветного изображения из пространства CMY в пространство RGB
%
% ВХОД:  CMY = double [H x W x 3] - изображение в формате CMY: {0..1,0..1,0..1}
% ВЫХОД: RGB = double [H x W x 3] - изображение в формате RGB: {0..1,0..1,0..1}

% Проверки на синдром идиота
if (isempty(CMY)) || (size(CMY,1)<=0) || (size(CMY,2)<=0) || (size(CMY,3)~=3)
    error('invalid cmy image');
end;

% Размеры изображения
H = size(CMY,1);
W = size(CMY,2);

RGB = zeros(H,W,3);

RGB(:,:,1) = 1.0 - CMY(:,:,1); %R=1-C
RGB(:,:,2) = 1.0 - CMY(:,:,2); %G=1-M
RGB(:,:,3) = 1.0 - CMY(:,:,3); %B=1-Y

return;
