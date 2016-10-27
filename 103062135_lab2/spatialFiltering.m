function [output] = spatialFiltering(input, mask)

input = single(input);
mask = single(mask);
[h, w] = size(input);
[mh, mw] = size(mask);
mh_trans = int16(mh/2);
mw_trans = int16(mw/2);
output = zeros(h, w, 'single');

for i = 1 : h
    for j = 1 : w
        % transform the index
        for k = 1-mh_trans : mh-mh_trans
            for l = 1-mw_trans : mw-mw_trans              
                % check overflow
                if(i+k > 0 && j+l > 0 && i+k <= h && j+l <= w)       
                    % do the sigma
                    output(i, j) = output(i, j) + input(i+k, j+l) * mask(k+mh_trans, l+mw_trans);
                end
            end
        end    
    end
end


end

