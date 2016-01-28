function [RGB] = convert_yuv_to_rgb(YUV);
% [RGB] = convert_yuv_to_rgb(YUV);
%
% �������������� �������� ����������� �� ������������ YUV � ������������ RGB
%
% ����:    YUV = double [H x W x 3] - ����������� � ������� YUV: {0..1,0..1,0..1}
% �����:   RGB = double [H x W x 3] - ����������� � ������� RGB: {0..1,0..1,0..1}

% �������� �� ������� ������
if (isempty(YUV)) || (size(YUV,1)<=0) || (size(YUV,2)<=0) || (size(YUV,3)~=3)
    error('invalid rgb image');
end;

% ������� �����������
H = size(YUV,1);
W = size(YUV,2);


RGB = zeros(H,W,3);

RGB(:,:,1) =  YUV(:,:,1) + 1.13983 * YUV(:,:,3);
RGB(:,:,2) =  YUV(:,:,1) - 0.39465 * YUV(:,:,2) - 0.58060 * YUV(:,:,3);
RGB(:,:,3) =  YUV(:,:,1) + 2.03211 * YUV(:,:,2);

return;
