function x=reallyExtractArticle(yo)
    % intakes the url of a page that has a news article and returns the
    % article as a string along with some other superfluous javascript code
    % but no html tags
y=webread(yo);
pStartPattern='<p>';
changeP1=regexprep(y,pStartPattern,'|pStart|');
pEndPattern='</p>';
changeP2=regexprep(changeP1,pEndPattern,'|pEnd|');
tag_pattern='</?.*?>';
tags_gone=regexprep(changeP2,tag_pattern,'');
cut_top_fat=tags_gone(strfind(tags_gone,'|pStart|'):length(tags_gone));
take_out_script=regexprep(cut_top_fat,'{.*?}','');
%end_marked=strcat(cut_top_fat,'YOLOFINISHED');
x=take_out_script;