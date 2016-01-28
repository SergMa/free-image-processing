function [RGB] = convert_hsi_to_rgb(HSI);
% [RGB] = convert_hsi_to_rgb(HSI);
%
% Преобразование цветного изображения из пространства HSI в пространство RGB
%
% ВХОД:  HSI = double [H x W x 3] - изображение в формате HSI: {0..1,0..1,0..1}
% ВЫХОД: RGB = double [H x W x 3] - изображение в формате RGB: {0..1,0..1,0..1}

% Проверки на синдром идиота
if (isempty(HSI)) || (size(HSI,1)<=0) || (size(HSI,2)<=0) || (size(HSI,3)~=3)
    error('invalid cmy image');
end;

% Размеры изображения
H = size(HSI,1);
W = size(HSI,2);

RGB = zeros(H,W,3);

k = 1/3;

a60 = 60*pi/180;
a120 = 120*pi/180;
a240 = 240*pi/180;

rghi = 120*pi/180; % Верхняя граница RG-сектора
gbhi = 240*pi/180; % Верхняя граница GB-сектора
brhi = 360*pi/180; % Верхняя граница BR-сектора

for i=1:H
for j=1:W
    H = HSI(:,:,1);
    S = HSI(:,:,2);
    I = HSI(:,:,3);

    if (H>=0) && (H<rghi)
        b = k*(1-S);
        r = k*(1+S*cos(H)/cos(a60-H));
        g = 1-(r+b);
    elseif (H>=rghi) && (H<gbhi)
        H = H - a120;
        g = k*(1+S*cos(H)/cos(a60-H));
        r = k*(1-S);
        b = 1-(r+b);
    else %(H>=gbhi) && (H<brhi)
        H = H - a240;
        g = k*(1+S*cos(H)/cos(a60-H));
        r = k*(1-S);
        b = 1-(r+b);
    end;

    R = 3*I*r;
    G = 3*I*g;
    B = 3*I*b;

    RGB(i,j,1) = R;
    RGB(i,j,2) = G;
    RGB(i,j,3) = B;
end;
end;

return;

