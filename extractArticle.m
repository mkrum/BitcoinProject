function x=extractArticle(yo)

if length(yo) > 5
        y = webread(yo);
end


pattern='</?.*?>';
almost_article=regexprep(y,pattern,'');
next_pattern='(?window.*\+\+r';
x=regexprep(almost_article,next_pattern,'');
