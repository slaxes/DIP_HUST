source1 = imread('low.tif');

[m,n] = size(source1);
figure('name', 'ֱ��ͼ����', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(2,4,1);imshow(source1);title('ԭʼͼ��');
C=double(zeros(256)); %ֱ��ͼͳ�� 
for j=1:m
    for k=1:n 
        r=source1(j,k);
        C(r)=C(r)+1; 
    end
end
subplot(2,4,2);stem(C,'.');title('ԭʼֱ��ͼ');
for j=2:256 %ֱ��ͼ�ۼƺ���
    C(j)=C(j)+C(j-1); 
end
subplot(2,4,3);plot(C);title('ԭʼ�ۼƺ���');
subplot(2,4,4);imhist(source1);title('imhist');

source2 = imread('less_light.jpg');
subplot(2,4,5);imshow(source2);title('origin-picture');
source2_out = histeq(source2);
subplot(2,4,6);imshow(source2_out);title('after-histeq');

[m,n,p] = size(source2);
source2_out2 = uint8(zeros(m, n, p));
for i=1:3
    source2_out2(:,:,i) = adapthisteq(source2(:,:,i), 'ClipLimit', 0.05);
end

subplot(2,4,7);imshow(source2_out2);title('after-adapthisteq');
subplot(2,4,8);imshow(histeq(source1));title('histeq');


