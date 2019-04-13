figure('name', '振铃', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
A=rgb2gray(imread('b_w.png')); 
[m,n]=size(A);
FA=fftshift(fft2(A)); %傅里叶变换并平移 
PFA=abs(FA).^2; %频域功率数组
D0 = 3; %截止频率
for i = 1:m
    for j = 1:n
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        if R < D0
            FA(i,j) = 0;
        end
    end
end
output1 = ifft2(fftshift(FA));
subplot(2,3,1);imshow(A);title('原图');
subplot(2,3,2);imshow(output1);title('高通滤波器截止频率为4');

B=imread('pattern.tif');
[m,n]=size(B);
FB=fftshift(fft2(B)); %傅里叶变换并平移 
B0=zeros(m,n); %滤波器数组 
n0=2; %滤波阶数 
D0=128;
for j=1:n
    for i=1:m 
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        B0(i,j)=1-1/(1+(R/D0).^(2*n0)); 
    end
end
output2 = ifft2(fftshift(FB.*B0));
subplot(2,3,3);imshow(output2);title('巴特沃斯滤波器D0=128');

C=imread('body.tif');
[m,n]=size(C);
subplot(2,3,4);imshow(C);title('原图');
D=log(double(C)+1);    %取对数
FC=fft2(D);    %傅里叶变换 
rL=0.5;    
rH=1;     % 可根据需要效果调整参数 
c=2.0;       %锐化参数
D0=20;
for u=1:m
    for v=1:n
        R=sqrt(((u-m/2).^2+(v-n/2).^2));  %频率域中点（u，v）与频率矩形中心的距离       
        H(u,v)=(rH-rL).*(1-exp(-c.*(R^2./D0^2)))+rL; %高斯同态滤波 
    end
end
H=ifftshift(H);  %对H做反中心化
C_3=ifft2(H.*FC);  %傅里叶逆变换
C_4=exp(C_3)-1;  %取指数
figure(1),subplot(2,3,5),imshow(C_4,[]);title('同态滤波增强后');