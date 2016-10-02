function [resultedImage] = resizedImage_replication(originalImage, scalingFactor)

tic
new_h = floor(size(originalImage, 1) * scalingFactor);
new_w = floor(size(originalImage, 2) * scalingFactor);
new_c = size(originalImage, 3);
resultedImage = zeros(new_h, new_w, new_c, 'uint8');

for i = 1:new_h
    ori_i = ceil(i / scalingFactor);
    for j = 1:new_w
        ori_j = ceil(j / scalingFactor);
        resultedImage(i, j) = originalImage(ori_i, ori_j);
    end
end
toc
end
