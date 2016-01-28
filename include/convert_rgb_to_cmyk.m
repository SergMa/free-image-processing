function [CMYK] = convert_rgb_to_cmyk(RGB);
% [CMYK] = convert_rgb_to_cmyk(RGB);
%
% Преобразование цветного изображения из пространства RGB в пространство CMYK
%
% ВХОД:  RGB  = double [H x W x 3] - изображение в формате RGB:  {0..1,0..1,0..1}
% ВЫХОД: CMYK = double [H x W x 4] - изображение в формате CMYK: {0..1,0..1,0..1,0..1}

CMY = convert_rgb_to_cmy(RGB);
CMYK = convert_cmy_to_cmyk(CMY);

return;

