figure('name', '��ͨ�˲���', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
A=rgb2gray(imread('b_w.png')); 
[m,n]=size(A);
B0 = zeros(m,n);
FA=fftshift(fft2(A)); %����Ҷ�任��ƽ�� 
PFA=abs(FA).^2; %Ƶ��������
D0 = 5; %��ֹƵ��
for i = 1:m
    for j = 1:n
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        if R < D0
            B0(i,j) = 1;
        end
    end
end
output1 = ifft2(fftshift(FA.*B0));
subplot(2,3,1);imshow(A);title('ԭͼ');
subplot(2,3,2);imshow(uint8(output1));title('��ͨ�˲�����ֹƵ��Ϊ5');
B0 = zeros(m,n);
n0=2; %�˲����� 
D0=64;
for j=1:n
    for i=1:m 
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        B0(i,j)=1/(1+(R/D0).^(2*n0)); 
    end
end
output2 = ifft2(fftshift(FA.*B0));
subplot(2,3,3);imshow(output2);title('������˹�˲���D0=64');

source = imread('pattern.tif');
subplot(2,3,4);imshow(source);title('ԭͼ');
source_fft = fftshift(fft2(source));
[m,n]=size(source);
D0=100;
H0=zeros(m,n);
for i = 1:m
    for j = 1:n
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        if R < D0
            H0(i,j) = 1;
        end
    end
end
output3 = ifft2(fftshift(source_fft.*H0));
subplot(2,3,5);imshow(uint8(output3));title('��ͨ�˲�����ֹƵ��Ϊ100');
H0 = zeros(m,n);
n0=2; %�˲����� 
D0=128;
for j=1:n
    for i=1:m 
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        H0(i,j)=1/(1+(R/D0).^(2*n0)); 
    end
end
output4 = ifft2(fftshift(source_fft.*H0));
subplot(2,3,6);imshow(output4);title('������˹�˲���D0=128');


