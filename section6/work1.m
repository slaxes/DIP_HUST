source1 = imread('character.bmp');
figure('name', 'ͼ��ָ�', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');

f = im2double(source1);
PSF = fspecial('motion', 16, 30);
frest1 = deconvwnr(f, PSF, 0.01);
subplot(1,3,1);imshow(frest1);title('ԭͼ');
img = imadjust(frest1);
subplot(1,3,2);imshow(img);title('�˻�����ͼ��');

% Sx = fspecial('sobel'); Sy = Sx';
% filter = abs(imfilter(imadjust(img), Sx))+ abs(imfilter(imadjust(img), Sy));
% filter = medfilt2(filter, [5,5]); 
% final = imadjust(0.05 * filter + imadjust(img));
u8_final = uint8(img * 255);
for i = 1:393
    for j = 1:279
        if u8_final(i, j) > 170
            u8_final(i, j) = 255;
        end
    end
end
% FA=fft2(u8_final);%��ͼ����и���Ҷ�任
% fA=fftshift(FA); %��ͼ��Ƶ�׽����ƶ�����0Ƶ�ʵ�������
% sA=log(abs(fA));%��ø���Ҷ�任�ķ�����
subplot(1,3,3);imshow(u8_final);title('����');