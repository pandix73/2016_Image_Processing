function [resultedImage] = resizedImage_replication(originalImage, scalingFactor)

new_h = floor(size(originalImage, 1) * scalingFactor);
new_w = floor(size(originalImage, 2) * scalingFactor);
new_c = size(originalImage, 3);
%resultedImage = cell(new_h, new_w, new_c);

for i = 1:new_h
    for j = 1:new_w
        ori_i = ceil(i / scalingFactor);
        ori_j = ceil(j / scalingFactor);
        resultedImage(i, j) = originalImage(ori_i, ori_j);
    end
end

end

