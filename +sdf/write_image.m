function write_image(filename, data, options)

image = data.image;
headers = data.headers;

fid = fopen(filename, 'w+');
fprintf(fid, 'aBCR-1.0\n');
fclose(fid);

headers.NumPoints = int2str(size(image, 1));
headers.NumProfiles = int2str(size(image, 2));

append_headers(filename, headers);
append_data(filename, image, headers, options);
append_footer(filename, headers);
end

%%
function append_headers(filename, headers)
    fid = fopen(filename, 'a');

    hFormat = '%s\t= %s\n';
    fields = fieldnames(headers);
    
    for h = 1:length(fields)
        if ~isempty(headers.(fields{h}))
            fprintf(fid, hFormat, fields{h}, headers.(fields{h}));
        end
    end
    
    fprintf(fid, '*\n\n');
    fclose(fid);
end

function append_data(filename, image, headers, options)
    switch options.bits
        case 32
            format = '4';
        case 16
            format = '2';
        otherwise
            format = '4';
    end    
    floatFormat = strcat({'%.'}, {format}, {' '});
    lineFormat = strjoin(repmat(floatFormat, 1, 7));
    lineFormat = lineFormat(1:(end - 1));
    
    fid = fopen(filename, 'a');
    
    nbPoints = str2double(headers.NumProfiles);
    
    for point = 1:nbPoints
        line = image(:,point);
        fprintf(fid, strcat(lineFormat, '\n'), line);
    end
       
    fprintf(fid, '\n');
    fclose(fid); 
end

function append_footer(filename, data)
    fid = fopen(filename, 'a');
    fprintf(fid, '*\n%s\n*\n', data);
    fclose(fid);
end
