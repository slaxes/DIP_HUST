m=500; %ͼ���С 
n=500;
figure('name', '����Ҷ�任', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
A=zeros(m,n);
xn=100; %������ 
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
subplot(2,3,1); imshow(A); title('ԭͼ');
FA=fft2(A);%��ͼ����и���Ҷ�任
fA=fftshift(FA); %��ͼ��Ƶ�׽����ƶ�����0Ƶ�ʵ�������
sA=log(abs(fA));%��ø���Ҷ�任�ķ�����
phA=log(angle(fA)*180/pi);%��ø���Ҷ�任����λ��
subplot(2,3,2); imshow(sA,[]); title('������'); %��ʾͼ��ķ����ף�������[]��Ϊ�˽�sA��ֵ��������
subplot(2,3,3); imshow(phA,[]); title('��λ��'); %��ʾͼ����Ҷ�任����λ��
subplot(2,3,4); imshow(log(abs(FA)),[]); title('ƽ��֮ǰ�ķ�����');
subplot(2,3,5); imshow(B,[]); title('�߶ȱ仯');
subplot(2,3,6); imshow(log(abs(fftshift(fft2(B)))),[]); title('�߶ȱ仯�ķ�����');

figure('name', '��Ƶ��Ƶ�任', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
source1 = imread('washington_infrared.tif');
source2 = imread('rose1024.tif');
subplot(2,3,1); imshow(source1); title('ͼһ');
subplot(2,3,2); imshow(source2); title('ͼ��');
f1=fft2(source1);
s1=abs(f1);
ph1=angle(f1)*180/pi;
f2=fft2(source2);
s2=abs(f2);
ph2=angle(f2)*180/pi;
output1 = f1./s1.*s2;
subplot(2,3,3); imshow(uint8(ifft2(output1))); title('ͼһ��ͼ���ķ���');
output2 = s2.*exp(1i.*ph1);
subplot(2,3,4); imshow(uint8(ifft2(output2))); title('ͼ����ͼһ��Ƶ��');
output3 = exp(1i.*ph1);
subplot(2,3,5); imshow(uint8(ifft2(output3))); title('ͼһ������1');
output4 = s1;
subplot(2,3,6); imshow(uint8(ifft2(output4))); title('ͼһ��λ��0');
