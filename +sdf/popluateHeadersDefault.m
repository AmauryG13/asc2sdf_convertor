function headers = popluateHeadersDefault(headers)
%POPLUATEHEADERSDEFAULT Summary of this function goes here
%   Detailed explanation goes here

format longG
tn = datetime('now');
timestamps = posixtime(tn);

headers.ManufacID = 'Mountains';
headers.CreateDate = int2str(timestamps);
headers.ModDate = int2str(timestamps);
headers.Compression = 'NULL';
headers.DataType = '3'; 
end

