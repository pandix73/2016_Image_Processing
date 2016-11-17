d = abs(d);
d = 100*(log(d+1)) - 400;
d = 
imwrite(double(d), '4.36(d).tif');
