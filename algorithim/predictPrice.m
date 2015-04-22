function [prediction] = predictPrice(index, price)

t = 5;
c = -5;
h = 13;

indF = index * c;
brownPredict = @(x) x.*(exp(-(x).^2./2.*t)/(sqrt(2.*pi.*t)) + indF*exp(-(x + 1).^2./2.*t)/(sqrt(2.*pi.*t)));
change = integral(brownPredict,-50,50);
scaledChange = change * h;
prediction = price + scaledChange;



