m=500; %图像大小 
n=500;
figure('name', '傅立叶变换', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
A=zeros(m,n);
xn=100; %网格间隔 
yn=100;
B=zeros(2*m,2*n);
for j=0:m/xn-1
    for k=0:n/yn-1
        if rem((j+k),2) 
            A(j*xn+1:(j+1)*xn,k*yn+1:(k+1)*yn)=200; 
        end
    end
end
for j=1:m
    for k=1:n
        B(2*j,2*k) = A(j,k);
    end
end
subplot(2,3,1); imshow(A); title('原图');
FA=fft2(A);%对图像进行傅里叶变换
fA=fftshift(FA); %对图像频谱进行移动，是0频率点在中心
sA=log(abs(fA));%获得傅里叶变换的幅度谱
phA=log(angle(fA)*180/pi);%获得傅里叶变换的相位谱
subplot(2,3,2); imshow(sA,[]); title('幅度谱'); %显示图像的幅度谱，参数与[]是为了将sA的值线形拉伸
subplot(2,3,3); imshow(phA,[]); title('相位谱'); %显示图像傅里叶变换的相位谱
subplot(2,3,4); imshow(log(abs(FA)),[]); title('平移之前的幅度谱');
subplot(2,3,5); imshow(B,[]); title('尺度变化');
subplot(2,3,6); imshow(log(abs(fftshift(fft2(B)))),[]); title('尺度变化的幅度谱');

figure('name', '幅频相频变换', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
source1 = imread('washington_infrared.tif');
source2 = imread('rose1024.tif');
subplot(2,3,1); imshow(source1); title('图一');
subplot(2,3,2); imshow(source2); title('图二');
f1=fft2(source1);
s1=abs(f1);
ph1=angle(f1)*180/pi;
f2=fft2(source2);
s2=abs(f2);
ph2=angle(f2)*180/pi;
output1 = f1./s1.*s2;
subplot(2,3,3); imshow(uint8(ifft2(output1))); title('图一用图二的幅度');
output2 = s2.*exp(1i.*ph1);
subplot(2,3,4); imshow(uint8(ifft2(output2))); title('图二用图一的频率');
output3 = exp(1i.*ph1);
subplot(2,3,5); imshow(uint8(ifft2(output3))); title('图一幅度置1');
output4 = s1;
subplot(2,3,6); imshow(uint8(ifft2(output4))); title('图一相位置0');
