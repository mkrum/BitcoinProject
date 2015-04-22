function [prediction] =  predictPriceHone(index, price, t, c, h)


indF = index * c;
brownPredict = @(x) x.*(exp(-(x).^2./2.*t)/(sqrt(2.*pi.*t)) + indF*exp(-(x + 1).^2./2.*t)/(sqrt(2.*pi.*t)));
change = integral(brownPredict,-50,50);
scaledChange = change * h;
prediction = price + scaledChange;
