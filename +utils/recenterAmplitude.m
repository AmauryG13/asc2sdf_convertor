function [data, scale] = recenterAmplitude(raw)
%RECENTERAMPLITUDE Summary of this function goes here
%   Detailed explanation goes here

z = reshape(raw, 1, []);
zmean = mean(z);

[zmin, zmax] = bounds(z);

amplitude = [zmean - zmin, zmean - zmax]; 

data = rescale(raw, min(amplitude), max(amplitude));

zs = sort(reshape(data, 1, []));
scale = abs(zs(1) - zs(2));

end

