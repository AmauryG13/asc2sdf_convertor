function data = recenterAmplitude(raw)
%RECENTERAMPLITUDE Summary of this function goes here
%   Detailed explanation goes here

z = reshape(raw, 1, []);
zmean = mean(z);

zmin = min(z);
zmax = max(z);

amplitude = [zmin - zmean, zmax - zmean]; 

data = rescale(raw, amplitude(1), amplitude(2));

end

