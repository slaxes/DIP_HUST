% source1 = imread('clock.tif');
% [row, column] = size(source1);
% 
% source1_out1 = uint8(zeros(row/2, column/2));
% source1_out2 = uint8(zeros(row*2, column*2));
% 
% for i = 1:row/2
%     for j = 1:column/2
%         source1_out1(i, j) = source1(2*i, 2*j);
%     end
% end
% 
% for i = 1:2*row
%     for j = 1:2*column
%         if mod(i,2) == 0 && mod(j,2) == 0
%             source1_out2(i, j) = source(i/2, j/2);
%         else
%             left = floor(i/2);
%             right = left+1;
%             top = floor(j/2);
%             bottom = top+1;
%             e = (i - left)*(source1(top, right) - source1(top, left)) + source1(top, left);
%             f = (i - left)*(source1(bottom, right) - source1(bottom, left)) + source1(bottom, left);
%             source1_out2(i, j) = (j - bottom)*(e - f) + f;
%         end
%         source1_out2(i, j) = 1;
%     end
% end
% 
% figure('name', '放缩', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
% subplot(1,3,1);imshow(source1);title('原大小');
% subplot(1,3,2);imshow(source1_out1);title('0.5');
% subplot(1,3,3);imshow(source1_out2);title('2');

source1 = imread('clock.tif'); 
x = 0.5; %缩放倍数，直接给放大程序用 
y = 2; %缩放倍数倒数，供缩小程序用 
[m0, n0]=size(source1);
m = m0 * x;
n = n0 * x;
source1_out1 = uint8(zeros(m0 * y, n0 * y));
source1_out2 = uint8(zeros(m0 * x, n0 * x));

for j=1:m0 %放大程序 
    for k=1:n0
        for l=1:y 
            source1_out1(j*y+l,k*y+l)=source1(j,k);
        end
    end
end

for j=1:m %缩小程序
    for k=1:n
        source1_out2(j, k)=source1(j*y, k*y); 
    end
end

figure('name', '放缩', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(1,3,1);imshow(source1);title('原大小');
subplot(1,3,2);imshow(source1_out1);title('2');
subplot(1,3,3);imshow(source1_out2);title('0.5');
 
 