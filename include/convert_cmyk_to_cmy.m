function [CMY] = convert_cmyk_to_cmy(CMYK);
% [CMY] = convert_cmyk_to_cmy(CMYK);
%
% �������������� �������� ����������� �� ������������ CMYK � ������������ CMY
%
% ����:   CMYK = double [H x W x 4] - ����������� � ������� CMYK: {0..1,0..1,0..1,0..1}
% �����:  CMY  = double [H x W x 3] - ����������� � ������� CMY:  {0..1,0..1,0..1}

% �������� �� ������� ������
if (isempty(CMYK)) || (size(CMYK,1)<=0) || (size(CMYK,2)<=0) || (size(CMYK,3)~=4)
    error('invalid cmyk image');
end;

% ������� �����������
H = size(CMYK,1);
W = size(CMYK,2);

CMY = zeros(H,W,3);

CMY(:,:,1) = CMYK(:,:,1) + CMYK(:,:,4); %C=C+K
CMY(:,:,2) = CMYK(:,:,2) + CMYK(:,:,4); %M=M+K
CMY(:,:,3) = CMYK(:,:,3) + CMYK(:,:,4); %Y=Y+K

return;
