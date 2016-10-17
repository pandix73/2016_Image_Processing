function histVector = imageHist(input)

tic

h = size(input, 1);
w = size(input, 2);
histVector = zeros(1, 256, 'single');

for i = 1 : h
    for j = 1 : w
        histVector(1, input(i, j)+1) = histVector(1, input(i, j)+1) + 1;
    end
end

toc

end

