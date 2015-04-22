function [dayRating] = daySum(day, links, PositiveKey, NegativeKey)

% function [dayRating] = daySum(urls, ArticleBody)
% Creates the rating for the day for use in createField.
% Uses inputs for keyCompare, in addition to urls to determine number of
% times to run.

%% Set Parameters

numRun = length(links{day});
score = 0;

%% Run for all urls

for i = 1:numRun
    ArticleBody = extractArticle(links{day}{i});
    a = keyCompare(PositiveKey, NegativeKey, ArticleBody);
    score = score + a;
end

dayRating = score/numRun;
