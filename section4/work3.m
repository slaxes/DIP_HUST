source1 = imread('DIP-XE.png');
Sx = fspecial('sobel'); %sobel���� 
Sy = Sx';

figure('name', '��Ƶ����', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(1,3,1);imshow(source1);title('ԭʼͼ��');

filter = abs(imfilter(source1, Sx))+ abs(imfilter(source1, Sy));
subplot(1,3,2);imshow(filter);title('��');

out_put = source1 + 2 * filter;
subplot(1,3,3);imshow(out_put);title('����');
