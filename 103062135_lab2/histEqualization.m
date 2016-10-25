function [output, T] = histEqualization(input)

h = size(input, 1);
w = size(input, 2);
T = zeros(1, 256, 'uint8');
output = zeros(h, w, 'uint8');

histVector = imageHist(input);
pixelsum = sum(histVector);
sigma = double(0);
disp(pixelsum);

for i = 1 : 256
    sigma = sigma + 255 * histVector(1, i) / pixelsum;
    T(1, i) = uint8(sigma);  
end

for i = 1 : h
    for j = 1 : w
        output(i, j) = T(1, uint8(input(i, j)+1))-1;
    end
end


end