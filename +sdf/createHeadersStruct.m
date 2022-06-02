function headers = createHeadersStruct

sdfHeadersStruct = sdf.getSDFheaders;
sdfHeaders = sdfHeadersStruct.name;

for h = 1:length(sdfHeaders)
    headers.(sdfHeaders{h}) = [];
end

end

