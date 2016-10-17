function [output] = powerlawTransform(input, r)

tic

h = size(input, 1);
w = size(input, 2);
output = zeros(h, w, 'uint8');

c = 255 / 255.^r; % 255 / 255^r

for i = 1 : h
    for j = 1 : w
        output(i, j) = uint8(c * double(input(i, j)).^r);
    end
end

toc

end

