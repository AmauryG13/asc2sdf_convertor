function headers = populateHeadersScale(headers, scale)
%POPULATEHEADERSSCALE Summary of this function goes here
%   Detailed explanation goes here

headers.Xscale = sprintf('%d', scale(1));
headers.Yscale = sprintf('%d', scale(2));
headers.Zscale = sprintf('%d', scale(3));
headers.Zresolution = sprintf('%d', scale(4));
end

