function link = generateLink(keyword, month, day, year)
splitup = strsplit(keyword);
usableKeyword = splitup(1);
for i = 2:length(splitup)
    usableKeyword = strcat('%20',splitup(i));
end
linkcell = strcat('https://www.google.com/search?pz=1&cf=all&ned=us&hl=en&tbm=nws&gl=us&as_q=',usableKeyword,'&as_occt=any&as_drrb=b&as_mindate=',month,'%2F',day,'%2F',year,'&as_maxdate=',month,'%2F',day,'%2F',year,'&tbs=cdr%3A1%2Ccd_min%3A',month,'%2F',day,'%2F',year,'%2Ccd_max%3A',month,'%2F',day,'%2F',year,'&authuser=0');
link = linkcell{1};
