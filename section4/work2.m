source1 = imread('face.tif');

Sx = fspecial('sobel'); %sobelËã×Ó 
Sy = Sx';
Px = fspecial('prewitt'); %prewittËã×Ó 
Py = Px';
threshold = 175;

figure('name', '¼ÓÔëÓëÂË²¨', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');

gauss = imnoise(source1, 'gaussian', 0, 0.01);
subplot(3,2,1);imshow(gauss);title('¸ßË¹ÔëÉù');

s_p = imnoise(source1, 'salt & pepper', 0.02);
subplot(3,2,2);imshow(s_p);title('½·ÑÎÔëÉù');

% gauss_sobel = abs(filter2(Sx, gauss))+abs(filter2(Sy, gauss));
gauss_sobel = abs(imfilter(gauss, Sx))+ abs(imfilter(gauss, Sy));
subplot(3,2,3);imshow(gauss_sobel);title('sobelÂË²¨¸ßË¹ÔëÉù');

% sp_sobel = abs(filter2(Sx, s_p))+abs(filter2(Sy, s_p));
sp_sobel = abs(imfilter(s_p, Sx)) + abs(imfilter(s_p, Sy));
subplot(3,2,4);imshow(sp_sobel);title('sobelÂË²¨½·ÑÎÔëÉù');

% gauss_sobel = abs(filter2(Sx, gauss))+abs(filter2(Sy, gauss));
gauss_prewitt = abs(imfilter(gauss, Px))+ abs(imfilter(gauss, Py));
subplot(3,2,5);imshow(gauss_prewitt);title('prewittÂË²¨¸ßË¹ÔëÉù');

% sp_sobel = abs(filter2(Sx, s_p))+abs(filter2(Sy, s_p));
sp_prewitt = abs(imfilter(s_p, Px)) + abs(imfilter(s_p, Py));
subplot(3,2,6);imshow(sp_prewitt);title('prewittÂË²¨½·ÑÎÔëÉù');