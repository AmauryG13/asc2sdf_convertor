function clean = cleanMeasure(data)
%CLEANMEASURE Summary of this function goes here
%   Detailed explanation goes here

clean = filloutliers(data, 'linear');
end

