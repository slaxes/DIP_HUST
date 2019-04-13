figure('name', '����', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
A=rgb2gray(imread('b_w.png')); 
[m,n]=size(A);
FA=fftshift(fft2(A)); %����Ҷ�任��ƽ�� 
PFA=abs(FA).^2; %Ƶ��������
D0 = 3; %��ֹƵ��
for i = 1:m
    for j = 1:n
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        if R < D0
            FA(i,j) = 0;
        end
    end
end
output1 = ifft2(fftshift(FA));
subplot(2,3,1);imshow(A);title('ԭͼ');
subplot(2,3,2);imshow(output1);title('��ͨ�˲�����ֹƵ��Ϊ4');

B=imread('pattern.tif');
[m,n]=size(B);
FB=fftshift(fft2(B)); %����Ҷ�任��ƽ�� 
B0=zeros(m,n); %�˲������� 
n0=2; %�˲����� 
D0=128;
for j=1:n
    for i=1:m 
        R=((i-m/2).^2+(j-n/2).^2).^(0.5);
        B0(i,j)=1-1/(1+(R/D0).^(2*n0)); 
    end
end
output2 = ifft2(fftshift(FB.*B0));
subplot(2,3,3);imshow(output2);title('������˹�˲���D0=128');

C=imread('body.tif');
[m,n]=size(C);
subplot(2,3,4);imshow(C);title('ԭͼ');
D=log(double(C)+1);    %ȡ����
FC=fft2(D);    %����Ҷ�任 
rL=0.5;    
rH=1;     % �ɸ�����ҪЧ���������� 
c=2.0;       %�񻯲���
D0=20;
for u=1:m
    for v=1:n
        R=sqrt(((u-m/2).^2+(v-n/2).^2));  %Ƶ�����е㣨u��v����Ƶ�ʾ������ĵľ���       
        H(u,v)=(rH-rL).*(1-exp(-c.*(R^2./D0^2)))+rL; %��˹̬ͬ�˲� 
    end
end
H=ifftshift(H);  %��H�������Ļ�
C_3=ifft2(H.*FC);  %����Ҷ��任
C_4=exp(C_3)-1;  %ȡָ��
figure(1),subplot(2,3,5),imshow(C_4,[]);title('̬ͬ�˲���ǿ��');