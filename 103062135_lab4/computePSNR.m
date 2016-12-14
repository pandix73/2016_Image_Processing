function psnr = computePSNR(input1_s, input2_s)

[m, n] = size(input1_s);
MSE = sum(sum((input1_s - input2_s)^2)) / m / n;
psnr = 10 * log10(1 / MSE);

end