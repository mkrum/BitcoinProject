
function [urls] = getUrlsSource(data)
bigBlock = strsplit(data, '</style>');
block = bigBlock(14);
block = strsplit(block{1}, 'href');
cleanCount = 0;
cleanerBlock = {};
for i = 1:length(block)
    clean = block{i};
    tag = clean(1:32);
    if (strcmp(tag, '="{\field{\*\fldinst{HYPERLINK "'))
        cleanCount = cleanCount + 1;
        stop = strfind(clean, '"}}');
        url = clean(33:stop(1)-1);
        cleanerBlock{cleanCount} = url;
    end
end        
urls = cleanerBlock;
