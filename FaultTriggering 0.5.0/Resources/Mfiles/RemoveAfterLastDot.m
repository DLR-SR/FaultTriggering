function [StringOut] = RemoveAfterLastDot(StringIn)
% REMOVEAFTERLASTDOT removes everythig after the last dot from StringIn and
% outputs to StringOut


% find all dots
index = strfind(StringIn,'.');
% find last dot
if isempty(index)
    StringOut = StringIn;
else
    index = index(end);
    StringOut = StringIn(1:index-1);
end


    
