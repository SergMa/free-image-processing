function [RGB] = convert_cmyk_to_rgb(CMYK);
% [RGB] = convert_cmyk_to_rgb(CMYK);
%
% �������������� �������� ����������� �� ������������ CMYK � ������������ RGB
%
% ����:   CMYK = double [H x W x 4] - ����������� � ������� CMYK: {0..1,0..1,0..1,0..1}
% �����:  RGB  = double [H x W x 3] - ����������� � ������� RGB:  {0..1,0..1,0..1}

CMY = convert_cmyk_to_cmy(CMYK);
RGB = convert_cmy_to_rgb(CMY);

return;
