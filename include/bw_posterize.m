function [out] = bw_posterize(in, levels);
% [OUT] = bw_posterize(IN, LEVELS);
%
% Posterize bw-image (Low down number of brightness levels)
%
% IN     - bw-image        - matrix [H x W], double [0..1]
% LEVELS - desired number of brightness levels
% OUT    - output bw-image - matrix [H x W], double [0..1]

if levels<1
    error('invalid levels');
end;

% Get size of image levels
h = size(in,1);
w = size(in,2);

% Get min,max of brightness
imin = min(min(in));
imax = max(max(in));

if imin==imax
    out = in; % 1 value of brightness - do not change image
    return;
end;

% Normalize to [0..1]
k = (1 - 0) / (imax - imin);
b = 1 - k*imax;
out = k*in + b;

% Multiply brigtness on levels and add 0.5 shift (posterize on centers of intervals)
out = out * levels - 0.5;





% ограничиваем значения яркости [0..1] - на всякий случай
OUT = min(IN,1);
OUT = max(IN,0);

% Умножаем яркости на число уровней (и добавляем сдвиг на пол-интервала
% (т.к. постеризуем по серединам интервалов)
OUT = OUT*LEVELS - 0.5;
% Постеризуем
OUT = round(OUT);
% Ограничение - на всякий случай
OUT = min(OUT,LEVELS-1);
OUT = max(OUT,0);
% Сдвиг на пол-диапазона обратно
OUT = OUT + 0.5;
% Возвращаем обратно в диапазон [0..1]
OUT = OUT / LEVELS;

% ограничиваем значения яркости [0..1] - на всякий случай
OUT = min(OUT,1);
OUT = max(OUT,0);

return;
