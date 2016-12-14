function [output_f, H] = addMotionBlur(input_f, T, a, b)

input_f = single(im2double(input_f));
[m, n] = size(input_f);
H = zeros(m, n, 'single');

shiftx = (m+1)/2;
shifty = (n+1)/2;

for i = 1:m
    for j = 1:n
        x = (i-shiftx)*a + (j-shifty)*b;
        if x == 0
            H(i, j) = 1;
        else
            H(i, j) = T/pi/x * sin(pi*x) * exp(-1i*pi*x);
        end
    end
end

output_f = input_f.*H;

end