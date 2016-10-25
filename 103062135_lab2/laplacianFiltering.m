function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)

tic

input = single(input);
[h, w] = size(input);
output = zeros(h, w, 'single');
scaledLaplacian = spatialFiltering(input, laplacianMask);

for i = 1 : h
    for j = 1 : w
        output(i, j) = input(i, j) + scale * scaledLaplacian(i, j);
    end
end

toc

end