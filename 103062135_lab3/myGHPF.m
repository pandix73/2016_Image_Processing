function [output] = myGHPF(D0, M, N)

output = zeros(M, N, 'single');

for u = 1 : M
    for v = 1 : N
        output(u, v) = 1 - exp(-((u-M/2).^2 + (v-N/2).^2) / (2 * D0.^2));
    end
end

end