function [HSI] = convert_rgb_to_hsi(RGB);
% [HSI] = convert_rgb_to_hsi(RGB);
%
% Преобразование цветного изображения из пространства RGB в пространство HSI
%
% ВХОД:  RGB = double [H x W x 3] - изображение в формате RGB: {0..1,0..1,0..1}
% ВЫХОД: HSI = double [H x W x 3] - изображение в формате HSI: {0..1,0..1,0..1}

% Проверки на синдром идиота
if (isempty(RGB)) || (size(RGB,1)<=0) || (size(RGB,2)<=0) || (size(RGB,3)~=3)
    error('invalid rgb image');
end;

% Размеры изображения
H = size(CMY,1);
W = size(CMY,2);

HSI = zeros(H,W,3);

k = 1/3;

for i=1:H
for j=1:W
    R = RGB(:,:,1);
    G = RGB(:,:,2);
    B = RGB(:,:,3);
    sumrgb = R + G + B;
    minrgb = min( [R,G,B] );

    %I=(1/3)*(R+G+B)
    I = k*sumrgb;               

    %S=1 - 3*min(R,G,B)/(R+G+B)       
    if(sumrgb < 1e-9)
        S = 1; %проверка на деление на 0
    else
        S = 1 - 3*minrgb/sumrgb;
    end;

    %H=cos^-1( (1/2)*((R-G)+(R-B))/sqrt((R-G)^2 + (R-B)(G-B)) )
    rg = R - G;
    rb = R - B;
    gb = G - B;
    sq = sqrt(rg*rg + rb*gb);
    if(sq < 1e-9)
        H = acos(1); %проверка на деление на 0
    else
        H = acos( 0.5*(rg + rb)/sq );
    end;

    if(B > G)
        H = 2*pi - H;
    end;

    HSI(i,j,1) = H;
    HSI(i,j,2) = S;
    HSI(i,j,3) = I;
end;
end;

return;
