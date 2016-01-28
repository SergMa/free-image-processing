function [CMY] = convert_rgb_to_cmy(RGB);
% [CMY] = convert_rgb_to_cmy(RGB);
%
% �������������� �������� ����������� �� ������������ RGB � ������������ CMY
%
% ����:   RGB = double [H x W x 3] - ����������� � ������� RGB: {0..1,0..1,0..1}
% �����:  CMY = double [H x W x 3] - ����������� � ������� CMY: {0..1,0..1,0..1}

% �������� �� ������� ������
if (isempty(RGB)) || (size(RGB,1)<=0) || (size(RGB,2)<=0) || (size(RGB,3)~=3)
    error('invalid cmy image');
end;

% ������� �����������
H = size(RGB,1);
W = size(RGB,2);

CMY = zeros(H,W,3);

CMY(:,:,1) = 1.0 - RGB(:,:,1); %C=1-R
CMY(:,:,2) = 1.0 - RGB(:,:,2); %M=1-G
CMY(:,:,3) = 1.0 - RGB(:,:,3); %Y=1-B

return;
