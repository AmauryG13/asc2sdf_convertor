function headers = read_headers(filename, options)
%READ_ASC_HEADERS Summary of this function goes here
%   Detailed explanation goes here

fid = fopen(filename, 'r');

for h = 1:options.Headers
    fline = fgetl(fid);
    
    line = fline(2:end);
    sepIdx = strfind(line, '=');
    
    if ~isempty(sepIdx)
        key = strip(line(1:(sepIdx-1)));
        value = strip(line((sepIdx+1):end));
        
        dValue = str2double(value);
        
        if isnan(dValue)
            headers.(matlab.lang.makeValidName(key)) = value;
        else
            headers.(matlab.lang.makeValidName(key)) = dValue;
        end
    end
end

end

