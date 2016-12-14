function output_s = addSinNoise(input_s, A, u0, v0)

%input = single(im2double(input_s));
[m, n] = size(input_s);
output_s = zeros(m, n, 'single');

for i = 1:m
    for j = 1:n
        output_s(i, j) = input_s(i, j) + A*sin(2*pi*((i-m/2)*u0/m+(j-n/2)*v0/n));
    end
end

end