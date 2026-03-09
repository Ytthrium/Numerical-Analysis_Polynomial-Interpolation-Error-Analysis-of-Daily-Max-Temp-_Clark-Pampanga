function coef = divided_diff(x, y)
% It uses an in-place 1D array for optimal memory efficiency.
% Inputs:
%   x - Vector of data points (nodes/days)
%   y - Vector of data values (temperatures)
% Output:
%   coef - Vector of divided difference coefficients

    if length(x) ~= length(y)
        error('Input vectors x and y must have the same length.');
    end

    n = length(y);
    coef = y; 
    
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (x(i) - x(i-j+1));
        end
    end
end