source2 = imread('clock.jpg');
figure('name', 'ͼ��ָ�', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
gray = rgb2gray(source2);
subplot(1,3,1);imshow(gray);title('ԭͼ');
f2 = im2double(gray);
PSF2 = fspecial('disk', 20);
frest2 = deconvwnr(f2, PSF2, 0.0005);
subplot(1,3,2);imshow(frest2);title('�˻�ͼ��');

Sx = fspecial('sobel'); Sy = Sx';
filter = abs(imfilter(frest2, Sx))+ abs(imfilter(frest2, Sy)); % sobel ����
sharp = frest2 + 0.5 * filter;
% subplot(2,3,3);imshow(sharp);title('��');
med_sharp = medfilt2(sharp, [5,5]); 
% subplot(2,3,4);imshow(med_sharp);title('�񻯾�ֵ');

filter = medfilt2(filter, [7,7]); 
filter = medfilt2(filter, [7,7]);

% subplot(2,3,5);imshow(filter);title('��Ե');
sharp = frest2 + 0.4 * filter;
subplot(1,3,3);imshow(sharp);title('��');

imwrite(frest2, './section6/test.bmp');