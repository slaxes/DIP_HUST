source1 = imread('face.tif');

figure('name', '�������˲�', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(3,3,1);imshow(source1);title('ԭʼͼ��');

gauss = imnoise(source1, 'gaussian', 0, 0.01);
subplot(3,3,2);imshow(gauss);title('��˹����');

s_p = imnoise(source1, 'salt & pepper', 0.02);
subplot(3,3,3);imshow(s_p);title('��������');

ws=3;
w=double(ones(ws)./(ws*ws));

Gav = uint8(filter2(w, gauss)); 
Sav = uint8(filter2(w, s_p)); 

subplot(3,3,4);imshow(Gav);title('��˹����-��ֵ�˲�');
subplot(3,3,5);imshow(Sav);title('��������-��ֵ�˲�');

Gmed = medfilt2(gauss); 
Smed = medfilt2(s_p);

subplot(3,3,7);imshow(Gmed);title('��˹����-��ֵ�˲�');
subplot(3,3,8);imshow(Smed);title('��������-��ֵ�˲�');


