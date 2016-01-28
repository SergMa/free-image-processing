function [CMYK] = convert_rgb_to_cmyk(RGB);
% [CMYK] = convert_rgb_to_cmyk(RGB);
%
% �������������� �������� ����������� �� ������������ RGB � ������������ CMYK
%
% ����:  RGB  = double [H x W x 3] - ����������� � ������� RGB:  {0..1,0..1,0..1}
% �����: CMYK = double [H x W x 4] - ����������� � ������� CMYK: {0..1,0..1,0..1,0..1}

CMY = convert_rgb_to_cmy(RGB);
CMYK = convert_cmy_to_cmyk(CMY);

return;

