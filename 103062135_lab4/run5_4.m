src = imread('526a.tif');
src = single(im2double(src));
out1 = src;

% shift center
[h, w] = size(src);
sfc = zeros(h, w, 'single');
for i=1:h
    for j=1:w
        sfc(i, j) = src(i, j)*((-1)^(i+j));
    end
end

T = 1;
a = 0.1;
b = 0.1;
sfc = fft2(sfc);
[out2, H] = addMotionBlur(sfc, T, a, b);
out2 = ifft2(out2);
out3 = addSinNoise(out2, 0.5, 100, 100);
out4 = wienerFiltering(fft2(out3), H, 0.5);
out5 = wienerFiltering(fft2(out3), H, 0.005);
out6 = wienerFiltering(fft2(out3), H, 0.001);

imwrite(double(out1), 'outt1.tif');
imwrite(double(real(out2)), 'outt2.tif');
imwrite(double(real(out3)), 'outt3.tif');
imwrite(double(real(ifft2(out4))), 'outt4.tif');
imwrite(double(real(ifft2(out5))), 'outt5.tif');
imwrite(double(real(ifft2(out6))), 'outt6.tif');
disp(real(computePSNR(out3, real(ifft2(out4)))));
disp(real(computePSNR(out3, real(ifft2(out5)))));
disp(real(computePSNR(out3, real(ifft2(out6)))));
