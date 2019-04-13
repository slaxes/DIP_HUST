source1 = imread('DIP-XE.png');
Sx = fspecial('sobel'); %sobel算子 
Sy = Sx';

figure('name', '高频提升', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(1,3,1);imshow(source1);title('原始图像');

filter = abs(imfilter(source1, Sx))+ abs(imfilter(source1, Sy));
subplot(1,3,2);imshow(filter);title('锐化');

out_put = source1 + 2 * filter;
subplot(1,3,3);imshow(out_put);title('叠加');
