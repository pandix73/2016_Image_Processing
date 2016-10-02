function [resultedImage] = resizedImage_bilinear(originalImage, scalingFactor)

tic
ori_h= size(originalImage, 1);
ori_w = size(originalImage, 2);
new_h = floor(ori_h * scalingFactor);
new_w = floor(ori_w * scalingFactor);
new_c = size(originalImage, 3);
resultedImage = zeros(new_h, new_w, new_c, 'uint8');

h_factor = (ori_h-1) / (new_h-1);
w_factor = (ori_w-1) / (new_w-1);

for i = 1:new_h
    x = h_factor * (i-1) + 1;
    x1 = floor(x);
    x2 = ceil(x);
    
    for j = 1:new_w
        y = w_factor * (j-1) + 1;
        y1 = floor(y);
        y2 = ceil(y);
        
        a = x - x1;
        b = y - y1;
        x1y1 = originalImage(x1, y1);
        x1y2 = originalImage(x1, y2);
        x2y1 = originalImage(x2, y1);
        x2y2 = originalImage(x2, y2);
        resultedImage(i, j) = (1-a) * ((1-b)*x1y1 + b*x1y2) + a * ((1-b)*x2y1 + b*x2y2);
    end
end
toc
end
