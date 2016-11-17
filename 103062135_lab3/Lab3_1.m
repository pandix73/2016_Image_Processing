I=imread('Fig0431(d)(blown_ic_crop).tif');
IS=single(im2double(I));
[M, N] = size(I);

I2 = padarray(IS, [M N], 0, 'post');

[x, y] = meshgrid(1:N*2, 1:M*2);
center = (-1) .^ (x+y);
I3 = I2 .* center;

IDFT = myDFT2(I3);
IDFT2 = real(IDFT);
I4 = abs(IDFT);
I4 = 100*log(I4+1);
I4 = mat2gray(I4);

I5 = myGLPF(20, M*2, N*2);

I6 = I5 .* IDFT;

IIDFT = myIDFT2(I6);
RII = real(IIDFT);
I7 = RII .* center;

I8 = I7(1:M, 1:N);

imwrite(I, 'a.tif');
imwrite(double(I2), 'b.tif');
imwrite(double(I3), 'c.tif');
imwrite(I4, 'd.tif');
imwrite(double(I5), 'e.tif');
imwrite(double(I6), 'f.tif');
imwrite(double(I7), 'g.tif');
imwrite(double(I8), 'h.tif');

imwrite(double(IDFT2), 'DFT.tif');
