function [links] = linkArrary()

fileID = fopen('2014.txt','a');


text = fileread('2014.txt');
text = strsplit(text, '*');

for i = 1:length(text)
        text{i} = strsplit(text{i}, '\n');
end

for j = 2:(length(text)-1)
    for k = 1:(length(text{j}) - 1)
        final{j}{k} = text{j}{k + 1};
    end
end

links = text
