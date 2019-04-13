source1 = imread('face.tif');

figure('name', '加噪与滤波', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(3,3,1);imshow(source1);title('原始图像');

gauss = imnoise(source1, 'gaussian', 0, 0.01);
subplot(3,3,2);imshow(gauss);title('高斯噪声');

s_p = imnoise(source1, 'salt & pepper', 0.02);
subplot(3,3,3);imshow(s_p);title('椒盐噪声');

ws=3;
w=double(ones(ws)./(ws*ws));

Gav = uint8(filter2(w, gauss)); 
Sav = uint8(filter2(w, s_p)); 

subplot(3,3,4);imshow(Gav);title('高斯噪声-均值滤波');
subplot(3,3,5);imshow(Sav);title('椒盐噪声-均值滤波');

Gmed = medfilt2(gauss); 
Smed = medfilt2(s_p);

subplot(3,3,7);imshow(Gmed);title('高斯噪声-中值滤波');
subplot(3,3,8);imshow(Smed);title('椒盐噪声-中值滤波');


