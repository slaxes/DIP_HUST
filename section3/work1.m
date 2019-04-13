source1 = imread('face.tif');
source1_out1 = 255 - source1;
source1_out2 = 0.5 * source1 + 20;
source1_out3 = uint8((256/log(256))*log(1+double(source1)));
source1_out4 = uint8((256/exp(2.56))*exp(double(source1/100)));
source1_out5 = 1.5 * source1 - 130;

figure('name', 'ӳ��任', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(2,3,1);imshow(source1);title('ԭͼ');
subplot(2,3,2);imshow(source1_out1);title('ȡ��');
subplot(2,3,3);imshow(source1_out2);title('ѹ��');
subplot(2,3,4);imshow(source1_out3);title('����');
subplot(2,3,5);imshow(source1_out4);title('ָ��');
subplot(2,3,6);imshow(source1_out5);title('��չ');