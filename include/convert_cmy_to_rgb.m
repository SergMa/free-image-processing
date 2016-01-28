function [RGB] = convert_cmy_to_rgb(CMY);
% [RGB] = convert_cmy_to_rgb(CMY);
%
% �������������� �������� ����������� �� ������������ CMY � ������������ RGB
%
% ����:  CMY = double [H x W x 3] - ����������� � ������� CMY: {0..1,0..1,0..1}
% �����: RGB = double [H x W x 3] - ����������� � ������� RGB: {0..1,0..1,0..1}

% �������� �� ������� ������
if (isempty(CMY)) || (size(CMY,1)<=0) || (size(CMY,2)<=0) || (size(CMY,3)~=3)
    error('invalid cmy image');
end;

% ������� �����������
H = size(CMY,1);
W = size(CMY,2);

RGB = zeros(H,W,3);

RGB(:,:,1) = 1.0 - CMY(:,:,1); %R=1-C
RGB(:,:,2) = 1.0 - CMY(:,:,2); %G=1-M
RGB(:,:,3) = 1.0 - CMY(:,:,3); %B=1-Y

return;
