function [resultedImage] = resizedImage_bilinear(originalImage, scalingFactor)

tic % count runtime

% some variables we need
ori_h = size(originalImage, 1);
ori_w = size(originalImage, 2);
new_h = floor(ori_h * scalingFactor);
new_w = floor(ori_w * scalingFactor);
new_c = size(originalImage, 3);
resultedImage = zeros(new_h, new_w, new_c, 'uint8');

% find the real factor
h_factor = (ori_h-1) / (new_h-1);
w_factor = (ori_w-1) / (new_w-1);

for i = 1:new_h
    % find the coordinate point in original image
    x = h_factor * (i-1) + 1;
    x1 = floor(x);
    x2 = ceil(x);
    
    for j = 1:new_w
        % find the coordinate point in original image
        y = w_factor * (j-1) + 1;
        y1 = floor(y);
        y2 = ceil(y);
                
        % use the interpolation method
        a = x - x1;
        b = y - y1;
        if(new_c == 1) % grayscale
            x1y1 = originalImage(x1, y1);
            x1y2 = originalImage(x1, y2);
            x2y1 = originalImage(x2, y1);
            x2y2 = originalImage(x2, y2);
            resultedImage(i, j) = (1-a) * ((1-b)*x1y1 + b*x1y2) + a * ((1-b)*x2y1 + b*x2y2);
        else % RGB
            x1y1 = originalImage(x1, y1, :);
            x1y2 = originalImage(x1, y2, :);
            x2y1 = originalImage(x2, y1, :);
            x2y2 = originalImage(x2, y2, :);
            resultedImage(i, j, :) = (1-a) * ((1-b)*x1y1 + b*x1y2) + a * ((1-b)*x2y1 + b*x2y2);
        end
    end
end
toc
end
