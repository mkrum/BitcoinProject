function rating = keyCompare(PositiveKey, NegativeKey, Link)

% function rating = keyCompare(PositiveKey, NegativeKey, Link)
% Takes the body of the article and returns whether the article is positive
% or negative.

%% Set Parameters

ArticleBody = strsplit(extractArticle(Link));

lengthPositiveKey = length(PositiveKey);
lengthNegativeKey = length(NegativeKey);  % Length of keys for use in for loop.

lengthBody = length(ArticleBody);  % Length of the article for use in for loop.

% Initialize counts

positiveCount = 0;  
negativeCount = 0;  

%% Compare Arrays
% Compares the words in the bodies of the articles.  If a word matches a
% word in a key, one of the for loops will add 1 to the count.

for i = 1:lengthBody
    for k = 1:lengthPositiveKey
        if strcmpi(ArticleBody(i),PositiveKey{k}) == 1
            positiveCount = positiveCount + 1;  % Positive Articles
        end
    end
end

for j = 1:lengthBody
    for l = 1:lengthNegativeKey
        if strcmpi(ArticleBody{j},NegativeKey{l}) == 1
            negativeCount = negativeCount + 1;  % Negative Articles
        end
    end
end

%% Determine if the article is positive or negative
% Compare positiveCount and negativeCount, the number of positive or
% negative words in the article.  This will return a number, with 1 being
% positive, 0 being neutral, and -1 being negative.

if positiveCount > negativeCount
    rating = 1;
elseif positiveCount < negativeCount
    rating = -1;
elseif positiveCount == negativeCount
    rating = 0;
end
    
