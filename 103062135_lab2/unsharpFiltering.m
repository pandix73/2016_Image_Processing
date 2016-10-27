function [output, scaledUnsharp, blurredInput] = unsharpFiltering(input, boxMask, scale); 

tic

input = single(input);
[h, w] = size(input);
output = zeros(h, w, 'uint8');
scaledUnsharp = zeros(h, w, 'single');
% blurred the image
blurredInput = spatialFiltering(input, boxMask);

for i = 1 : h
    for j = 1 : w
        % calculate the gmask
        scaledUnsharp(i, j) = scale * (input(i, j) - blurredInput(i, j));
        % add it to original image
        output(i, j) = uint8(input(i, j) + scaledUnsharp(i, j));        
    end
end

% don't know why, but it can show correctly by use imshow(uint8(scaledUnsharp))
% maybe it change int8 to uint8, idk
scaledUnsharp = scaledUnsharp + 128;

toc

end