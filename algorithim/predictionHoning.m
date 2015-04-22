%% algoryhtim honing grounds, genetic methods

clear
%% Authorize
Quandl.auth('a6WhbJvyBoVA_Czi9oFw');
%% Generate data
data = Quandl.get('BCHAIN/MKPRU','collapse','secondly');
ts = data;
price = data.Data;
totalDifference = 0;
minDif = -1;
j = 0;

sentimentText = fileread('FakeData.txt');
sentimentText = strsplit(sentimentText, '\n');

for y = 1:365
    split = strsplit(char(sentimentText(y)), 'e');
    firstPart = str2num(char(split(1)));
    secondPart = str2num(char(split(2)));  
    sentiment(y) = firstPart * 10.^(secondPart);
end

%% test
for t = 2.1
    for c = -.7
        for h = 0:.1:2
            if t ~= 0
            totalDifference = 0;
                for i = 1:356
                    totalDifference = totalDifference + abs(price(1833 + i) - predictPriceHone(sentiment(i), price(1832 + i), t, c, h));
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
