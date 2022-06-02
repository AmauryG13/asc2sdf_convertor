function clean = cleanMeasure(data)
%CLEANMEASURE Summary of this function goes here
%   Detailed explanation goes here

[clean, mod] = filloutliers(data, 'spline', 'grubbs');
end

