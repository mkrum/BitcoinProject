text = fileread('BitcoinUrls.txt');
text = strsplit(text, '*');
for i = 1:length(text)
        text{i} = strsplit(text{i}, '\n')
end


for j = 1:(length(text)-1)
    final{j} = text{j};
end
