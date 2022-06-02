%%
clear all; close all;
clc;

%%

content = dir('data');

files = content(3:end);
fIdx = cellfun(@(x) contains(x, '.asc'), {files(:).name});

files = files(fIdx);

convertor = Convertor;

for f = 1:length(files)
    filename = fullfile(files(f).folder, files(f).name);
    
    convertor.convert(filename, files(f).folder);
end