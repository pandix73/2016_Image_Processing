function [output, scaledUnsharp, blurredInput] = unsharpFiltering(input, boxMask, scale); 

tic

input = single(input);
[h, w] = size(input);
output = zeros(h, w, 'single');
scaledUnsharp = zeros(h, w, 'single');
blurredInput = spatialFiltering(input, boxMask);

for i = 1 : h
    for j = 1 : w
        scaledUnsharp(i, j) = single(scale) * (input(i, j) - blurredInput(i, j));
        output(i, j) = input(i, j) + scaledUnsharp(i, j);
    end
end

toc

end