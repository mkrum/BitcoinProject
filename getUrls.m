function [urls] = getUrls(pageURL)
block = webread(pageURL);
block = block(19099:length(block));
block = strsplit(block, 'href');
block = block(2:length(block));
cleanCount = 0;
cleanerBlock = {};
for i = 1:length(block)
    clean = block{i};
    tag = clean(1:16);
    if (strcmp(tag, '="/url?q=http://'))
        cleanCount = cleanCount + 1;
        stop = strfind(clean, '&');
        url = clean(10:stop(1)-1);
        cleanerBlock{cleanCount} = url;
    end
end        
urls = cleanerBlock;
