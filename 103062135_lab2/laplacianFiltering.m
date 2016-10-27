function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)

tic

input = single(input);
[h, w] = size(input);
output = zeros(h, w, 'uint8');
% calculate the 2nd order derivative
scaledLaplacian = spatialFiltering(input, laplacianMask);

for i = 1 : h
    for j = 1 : w
        % the formula
        output(i, j) = uint8(input(i, j) + scale * scaledLaplacian(i, j));
    end
end

toc

end