function [output] = logTransform(input)

tic

h = size(input, 1);
w = size(input, 2);
output = zeros(h, w, 'uint8');

c = 45.9859; % 255 / log(256)

for i = 1 : h
    for j = 1 : w
        % transform (0, 255) -> (1, 256) -> (log(1), log(256)) -> (0, 255) 
        output(i, j) = uint8(c * log(double(input(i, j)+1)));
    end
end

toc

end

