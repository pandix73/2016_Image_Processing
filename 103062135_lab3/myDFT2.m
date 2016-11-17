function [output] = myDFT2(input)

input = single(im2double(input));
[m, n] = size(input);
x_part = zeros(m, m, 'single');
y_part = zeros(n, n, 'single');

for u = 0 : m-1
    for x = 0 : m-1
        x_part(u+1, x+1) = exp((-1i)*2*pi*(u*x/m));
    end
end

for v = 0 : n-1
    for y = 0 : n-1
        y_part(v+1, y+1) = exp((-1i)*2*pi*(v*y/n));
    end
end

output = x_part * input * y_part;

% for u = 0 : m-1
%     for v = 0 : n-1
%         for x = 0 : m-1
%             for y = 0 : n-1
%                 disp([u, v, x, y]);
%                 output(u+1, v+1) = output(u+1, v+1) + input(x+1, y+1) * exp((-1i)*2*pi*(u*x/m + v*y/n));
%             end
%         end
%     end
% end

end