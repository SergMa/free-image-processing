function [RGB] = convert_yuv_to_rgb(YUV);
% [RGB] = convert_yuv_to_rgb(YUV);
%
% Преобразование цветного изображения из пространства YUV в пространство RGB
%
% ВХОД:    YUV = double [H x W x 3] - изображение в формате YUV: {0..1,0..1,0..1}
% ВЫХОД:   RGB = double [H x W x 3] - изображение в формате RGB: {0..1,0..1,0..1}

% Проверки на синдром идиота
if (isempty(YUV)) || (size(YUV,1)<=0) || (size(YUV,2)<=0) || (size(YUV,3)~=3)
    error('invalid rgb image');
end;

% Размеры изображения
H = size(YUV,1);
W = size(YUV,2);


RGB = zeros(H,W,3);

RGB(:,:,1) =  YUV(:,:,1) + 1.13983 * YUV(:,:,3);
RGB(:,:,2) =  YUV(:,:,1) - 0.39465 * YUV(:,:,2) - 0.58060 * YUV(:,:,3);
RGB(:,:,3) =  YUV(:,:,1) + 2.03211 * YUV(:,:,2);

return;
