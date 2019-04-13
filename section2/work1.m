source1 = imread('watermark_g1.bmp');
source2 = imread('watermark_c1.bmp');
source1_out = uint8(zeros(512, 512));
source2_out1 = uint8(zeros(512, 512, 3));
source2_out2 = uint8(zeros(512, 512, 3));
for i = 1:512
    for j = 1:512
        source1_out(i, j) = 64 * bitand(source1(i, j), 3);
    end
end

for i = 0:2
    ibegin = 1+i*512;
    iend = ibegin + 511;
    for j = 0:3
        jbegin = 1+j*512;
        jend = jbegin+511;
        source2_out1(:,:,i+1) = source2_out1(:,:,i+1) + bitshift(bitand(source2(ibegin:iend,jbegin:jend), 1), j+4);
        source2_out2(:,:,i+1) = source2_out2(:,:,i+1) + bitshift(bitand(source2(ibegin:iend,jbegin:jend), 2), j+3);
    end
end

figure('name', '提取灰色水印', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(1,2,1);imshow(source1);
subplot(1,2,2);imshow(source1_out);
figure('name', '提取彩色水印', 'NumberTitle', 'off', 'toolbar', 'none', 'menubar', 'none');
subplot(1,3,1);imshow(source2);
subplot(1,3,2);imshow(source2_out1);
subplot(1,3,3);imshow(source2_out2);