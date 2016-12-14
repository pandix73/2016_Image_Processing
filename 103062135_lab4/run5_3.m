src = imread('526a.tif');

out1 = single(im2double(src));
out2 = addSinNoise(out1, 0.5, 80, 80);
out3 = fft2(out2);
[out5, out4] = notchFiltering(out3, 180, 140, 140);
out6 = ifft2(out5);
PSNR = computePSNR(single(im2double(out1)), single(im2double(out6)));
imwrite(double(out1), 'out1.tif');
imwrite(double(out2), 'out2.tif');
imwrite(double(real(out3)), 'out3.tif');
imwrite(double(out4), 'out4.tif');
imwrite(double(real(out5)), 'out5.tif');
imwrite(double(out6), 'out6.tif');