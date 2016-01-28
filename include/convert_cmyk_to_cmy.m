function [CMY] = convert_cmyk_to_cmy(CMYK);
% [CMY] = convert_cmyk_to_cmy(CMYK);
%
% Преобразование цветного изображения из пространства CMYK в пространство CMY
%
% ВХОД:   CMYK = double [H x W x 4] - изображение в формате CMYK: {0..1,0..1,0..1,0..1}
% ВЫХОД:  CMY  = double [H x W x 3] - изображение в формате CMY:  {0..1,0..1,0..1}

% Проверки на синдром идиота
if (isempty(CMYK)) || (size(CMYK,1)<=0) || (size(CMYK,2)<=0) || (size(CMYK,3)~=4)
    error('invalid cmyk image');
end;

% Размеры изображения
H = size(CMYK,1);
W = size(CMYK,2);

CMY = zeros(H,W,3);

CMY(:,:,1) = CMYK(:,:,1) + CMYK(:,:,4); %C=C+K
CMY(:,:,2) = CMYK(:,:,2) + CMYK(:,:,4); %M=M+K
CMY(:,:,3) = CMYK(:,:,3) + CMYK(:,:,4); %Y=Y+K

return;
