%% algoryhtim honing grounds, genetic methods

clear
%% Getting Data
priceText = fileread('bitcoinPriceData.txt');
priceText = strsplit(priceText, '\n');
for d = 1: 365
    price(d) = str2num(char(priceText(d)));
end

totalDifference = 0;
minDif = -1;
j = 0;

sentimentText = fileread('2014Sentiment.txt');
sentimentText = strsplit(sentimentText, '\n');

for y = 1:365
    split = strsplit(char(sentimentText(y)), 'e');
    if (length(split) > 1)
        firstPart = str2num(char(split(1)));
        secondPart = str2num(char(split(2)));  
        sentiment(y) = firstPart * 10.^(secondPart);
    end
        sentiment(y) = str2num(char(sentimentText(y)));
end

%% test
for t = 1:10
    for c = 1:10
        for h = -5:-1
            if t ~= 0
            totalDifference = 0;
                for i = 1:364
                    totalDifference = totalDifference + abs(price(i+1) - predictPriceHone(sentiment(i), price(i), t, c, h));
                end
                averageDif = totalDifference/365.0;
                if minDif == -1
                    minDif = averageDif
                end
                if averageDif < minDif
                    minDif = averageDif
                    minT = t
                    minC = c
                    minH = h
                end
            end
            j = j + 1;
            waitbar(j/2000);
        end
    end
end




