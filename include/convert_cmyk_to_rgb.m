function [RGB] = convert_cmyk_to_rgb(CMYK);
% [RGB] = convert_cmyk_to_rgb(CMYK);
%
% Преобразование цветного изображения из пространства CMYK в пространство RGB
%
% ВХОД:   CMYK = double [H x W x 4] - изображение в формате CMYK: {0..1,0..1,0..1,0..1}
% ВЫХОД:  RGB  = double [H x W x 3] - изображение в формате RGB:  {0..1,0..1,0..1}

CMY = convert_cmyk_to_cmy(CMYK);
RGB = convert_cmy_to_rgb(CMY);

return;
