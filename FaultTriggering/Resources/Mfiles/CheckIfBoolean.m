function [y] = CheckIfBoolean(x)
% CHECKIFBOOLEAN checks if the element is a boolean.
% (not only type, but also "reals")
% works only for vectors!
%
% SEE ALSO CheckIfInteger

if isvector(x)
    y=zeros(size(x));
    for i = 1 : length(x)
        if x(i) == 1 || x(i) == 0
            y(i) = true;
        else
            y(i) = false;
        end
    end
else
    error('DLR:CheckIfBoolean:NoVector', 'Not a Vector --> Aborting')
end
