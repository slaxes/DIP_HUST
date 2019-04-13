source1 = imread('face.tif');

Sx = fspecial('sobel'); %sobel���� 
Sy = Sx';
Px = fspecial('prewitt'); %prewitt���� 
Py = Px';
threshold = 175;

figure('name', '�������˲�', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');

gauss = imnoise(source1, 'gaussian', 0, 0.01);
subplot(3,2,1);imshow(gauss);title('��˹����');

s_p = imnoise(source1, 'salt & pepper', 0.02);
subplot(3,2,2);imshow(s_p);title('��������');

% gauss_sobel = abs(filter2(Sx, gauss))+abs(filter2(Sy, gauss));
gauss_sobel = abs(imfilter(gauss, Sx))+ abs(imfilter(gauss, Sy));
subplot(3,2,3);imshow(gauss_sobel);title('sobel�˲���˹����');

% sp_sobel = abs(filter2(Sx, s_p))+abs(filter2(Sy, s_p));
sp_sobel = abs(imfilter(s_p, Sx)) + abs(imfilter(s_p, Sy));
subplot(3,2,4);imshow(sp_sobel);title('sobel�˲���������');

% gauss_sobel = abs(filter2(Sx, gauss))+abs(filter2(Sy, gauss));
gauss_prewitt = abs(imfilter(gauss, Px))+ abs(imfilter(gauss, Py));
subplot(3,2,5);imshow(gauss_prewitt);title('prewitt�˲���˹����');

% sp_sobel = abs(filter2(Sx, s_p))+abs(filter2(Sy, s_p));
sp_prewitt = abs(imfilter(s_p, Px)) + abs(imfilter(s_p, Py));
subplot(3,2,6);imshow(sp_prewitt);title('prewitt�˲���������');