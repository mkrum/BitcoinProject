function x=extractArticle(yo)
parpool('open', 2);
options.Timeout = 60;
if length(yo) > 5
    y = webread(yo);
end


        


pattern='</?.*?>';
almost_article=regexprep(y,pattern,'');
next_pattern='(?window.*\+\+r';
x=regexprep(almost_article,next_pattern,'');
