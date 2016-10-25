function [resultedImage] = resizedImage_replication(originalImage, scalingFactor)

tic % count runtime
new_h = floor(size(originalImage, 1) * scalingFactor); % height of output
new_w = floor(size(originalImage, 2) * scalingFactor); % width of output
new_c = size(originalImage, 3); % color dimension of output, same as input
resultedImage = zeros(new_h, new_w, new_c, 'uint8'); % preallocate for speed

for i = 1:new_h
    % find the coordinate point in original image
    ori_i = ceil(i / scalingFactor);
    
    for j = 1:new_w
        % find the coordinate point in original image
        ori_j = ceil(j / scalingFactor);
        
        if(new_c == 1) % grayscale
            resultedImage(i, j) = originalImage(ori_i, ori_j); % faster than 3D matrix copy
        else % RGB, color dimension is 3
            resultedImage(i, j, :) = originalImage(ori_i, ori_j, :);
        end
    end
end
toc
end
