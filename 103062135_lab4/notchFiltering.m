function [output_f, Notch] = notchFiltering(input_f, D0, u0, v0); 

input_f = single(im2double(input_f));
[m, n] = size(input_f);
Notch = zeros(m, n, 'single');

for i = 1:m
    for j = 1:n
        D1 = ((i-m/2-u0)^2+(j-n/2-v0)^2)^0.5;
        D2 = ((i-m/2+u0)^2+(j-n/2+v0)^2)^0.5;
        Notch(i, j) = 1 - ((D1<=D0) || (D2<=D0));
    end
end

output_f = input_f.*Notch;

end