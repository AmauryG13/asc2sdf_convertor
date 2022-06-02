function initial = mergeStruct(initial, inputs)
%MERGESTRUCT Summary of this function goes here
%   Detailed explanation goes here

if isstruct(inputs)
    fields = fieldnames(initial);
    for f = 1:length(fields)
        field = fields{f};
        if isfield(inputs, field)
            initial.(field) = inputs.(field);
        end
    end
end

end

