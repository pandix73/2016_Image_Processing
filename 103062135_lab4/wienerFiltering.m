function output_f = wienerFiltering(input_f, H, K)

output_f = (abs(H).^2 ./ (abs(H).^2 + K) ./ H).*input_f; 

end