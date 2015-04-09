i = 1;
for month = 1:12
    if sum(ismember(month,[1,3,5,7,8,10,12]))
        i = i + 1;
        for day = 1:31
            year{i} = [num2str(month),'/',num2str(day)];
            i = i + 1;
            year{i} = getUrls(generateLink('bitcoin',num2str(month), num2str(day),'2014'));
            i = i + 1;
            pause(1);
        end     
    end
    if sum(ismember(month,[4,6,9,10]))
        i = i + 1;
        for day = 1:31
            year{i} = [num2str(month),'/',num2str(day)];
            i = i + 1;
            year{i} = getUrls(generateLink('bitcoin',num2str(month), num2str(day),'2014'));
            i = i + 1;
            pause(1);
        end     
    end
    if month == 2
        i = i + 1;
        for day = 1:31
            year{i} = [num2str(month),'/',num2str(day)];
            i = i + 1;
            year{i} = getUrls(generateLink('bitcoin',num2str(month), num2str(day),'2014'));
            i = i + 1;
            pause(1);
        end     
    end
end
year
