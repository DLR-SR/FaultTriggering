function [y] = CheckIfInteger(x)
% CHECKIFINTEGER checks if the element is an integer.
% (not only type, but also "reals")
% works only for vectors!
%
% SEE ALSO CheckIfBoolean

if isvector(x)
    y=zeros(size(x));
    for i = 1 : length(x)
        if round(x(i))==x(i)
            y(i) = true;
        else
            y(i) = false;
        end
    end
else
    error('DLR:CheckIfInteger:NoVector', 'Not a Vector --> Aborting')
end
