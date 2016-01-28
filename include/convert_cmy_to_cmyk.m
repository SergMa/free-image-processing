function [CMYK] = convert_cmy_to_cmyk(CMY);
% [CMYK] = convert_cmy_to_cmyk(CMY);
%
% �������������� �������� ����������� �� ������������ CMY � ������������ CMYK
%
% ����:  CMY  = double [H x W x 3] - ����������� � ������� CMY:  {0..1,0..1,0..1}
% �����: CMYK = double [H x W x 4] - ����������� � ������� CMYK: {0..1,0..1,0..1,0..1}

% �������� �� ������� ������
if (isempty(CMY)) || (size(CMY,1)<=0) || (size(CMY,2)<=0) || (size(CMY,3)~=3)
    error('invalid cmy image');
end;

% ������� �����������
H = size(CMY,1);
W = size(CMY,2);

CMYK = zeros(H,W,4);

CMYK(:,:,4) = min( min(CMY(:,:,1),CMY(:,:,2)) , CMY(:,:,3) ); %K=min(C,M,Y)
CMYK(:,:,1) = CMY(:,:,1) - CMYK(:,:,4);                       %C=C-K
CMYK(:,:,2) = CMY(:,:,2) - CMYK(:,:,4);                       %M=M-K
CMYK(:,:,3) = CMY(:,:,3) - CMYK(:,:,4);                       %Y=Y-K

return;
