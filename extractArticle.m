function x=extractArticle(yo)

y=webread(yo);
pattern='<?/?.*?>';
almost_article=regexprep(y,pattern,'');
next_pattern='(?window.*\+\+r';
x=regexprep(almost_article,next_pattern,'');