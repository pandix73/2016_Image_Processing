function [output, T] = histEqualization(input)

h = size(input, 1);
w = size(input, 2);
T = zeros(1, 256, 'uint8');
output = zeros(h, w, 'uint8');

% individual num in matrix
histVector = imageHist(input);
% total num in matrix
pixelsum = sum(histVector);
sigma = single(0);

for i = 1 : 256
    % calculate the sigma
    sigma = sigma + 255 * histVector(1, i) / pixelsum;
    T(1, i) = uint8(sigma);  
end

for i = 1 : h
    for j = 1 : w
        % transform (0~255) -> (1~256) -> (0~255) 
        output(i, j) = T(1, uint8(input(i, j)+1))-1;
    end
end

end