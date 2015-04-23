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
correct = 0;
MaxRate = 0;
%% test
for t = 1:5
    for c = 1:5
        for h = 1:5
            if t ~= 0
            for i = 2:364
                changeA = price(i) - price(i-1);
                changeP = price(i) - predictPriceHone(sentiment(i), price(i), t, c, h);
                if (changeA * changeP) > 0
                    correct = correct + 1;
                end
            end
            successRate = correct/364.0;
            correct = 0;
            if successRate > MaxRate
                MaxRate = successRate
                minT = t
                minC = c
                minH = h
            end
            end
        end
    end
end
