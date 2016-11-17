function [output] = myGLPF(D0, M, N)

output = zeros(M, N, 'single');

cm = M/2;
cn = N/2;

for u = 1 : M
    for v = 1 : N
        output(u, v) = exp(-1 * ((u-cm).^2 + (v-cn).^2) / (2 * D0.^2));
    end
end

end