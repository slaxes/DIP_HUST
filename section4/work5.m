source1 = imread('face.tif');
noise = imnoise(source1, 'gaussian', 0, 0.01);
figure('name', '对比', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(1,3,1);imshow(noise);title('高斯噪声');

lap = fspecial('laplacian'); G5 = uint8(filter2(lap, noise));
log = fspecial('log'); L5 = uint8(filter2(log, noise));

subplot(1,3,2);imshow(G5);title('laplacian');
subplot(1,3,3);imshow(L5);title('log');