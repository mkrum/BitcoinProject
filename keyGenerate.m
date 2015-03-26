function [article_cellarray,numWords] = str2array(article_string)
%   creates a cell array with each cell containing a word in the article
%   and the number of words in the string

article_cellarray=strsplit(article_string,' ');
numWords=length(article_cellarray);

    
 