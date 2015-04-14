function [dayRating] = daySum(urls, PositiveKey, NegativeKey)

% function [dayRating] = daySum(urls, ArticleBody)
% Creates the rating for the day for use in createField.
% Uses inputs for keyCompare, in addition to urls to determine number of
% times to run.

%% Set Parameters

numRun = length(urls);
score = 0;

%% Run for all urls

for i = 1:numRun
    % Insert function to return ArticleBody
    a = keyCompare(PositiveKey, NegativeKey, ArticleBody);
    score = score + a;
end

dayRating = score/numRun;
