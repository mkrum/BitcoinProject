function x=extractArticle(yo)
    % intakes the url of a page that has a news article and returns the
    % article as a string along with some other superfluous javascript code
    % but no html tags
y=webread(yo);
pattern='</?.*?>';
almost_article=regexprep(y,pattern,'');
next_pattern='(?window.*\+\+r';
x=regexprep(almost_article,next_pattern,'');
