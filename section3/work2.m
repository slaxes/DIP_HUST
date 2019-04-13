source1 = imread('less_light.jpg');
source2 = imread('more_light.jpg');
source3 = imread('low.tif');
source4 = imread('high.tif');

source1_out = uint8(0.8 * double(source1).^1.8);
source2_out = uint8(1.6 * double(source2).^0.90);

figure('name', '٤������', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(2,4,1);imshow(source1);title('�عⲻ��');
subplot(2,4,2);imshow(source1_out);title('����');
subplot(2,4,3);imshow(source2);title('�ع����');
subplot(2,4,4);imshow(source2_out);title('����');
subplot(2,4,5);imshow(source3);title('�Աȶȵ�');
subplot(2,4,6);imshow(imadjust(source3));title('����');
subplot(2,4,7);imshow(source4);title('�Աȶȸ�');
subplot(2,4,8);imshow(imadjust(source4));title('����');
