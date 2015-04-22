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
lastA = price(1832);
maxSuccess = 0;
%% test
for t = 1:10
    for c = -10:10
        for h = 1:10
            lastP = predictPriceHone(1, price(1832), t, c, h);
            sameSign = 0;
            if t ~= 0
                for i = 1:356
                     changeA = price(1832 + i) - lastA;
                     changeP = predictPriceHone(1, price(1832 + i - 1), t, c, h) - lastP;
                     if (changeA * changeP) > 0
                         sameSign = sameSign + 1;
                     end
                     lastA = price(1832 + i);
                     lastP = predictPriceHone(1, price(1832 + i - 1), t, c, h);
                end
                successRate = sameSign/365.0;
                if successRate > maxSuccess
                    maxSuccess = successRate
                    maxT = t
                    maxC = c
                    maxH = h
                end
            end
            j = j + 1;
            waitbar(j/2000);
        end
    end
end
