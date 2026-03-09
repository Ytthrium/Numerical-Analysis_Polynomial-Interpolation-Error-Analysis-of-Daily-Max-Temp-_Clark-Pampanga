function yp = lagrange_interp(x, y, xp)
% Inputs:
%   x  - Vector of known data points (x-coordinates/days)
%   y  - Vector of known data values (y-coordinates/temperatures)
%   xp - The specific point where you want to estimate the temperature
% Output:
%   yp - The interpolated temperature value at xp

    if length(x) ~= length(y)
        error('Input vectors x and y must have the same length.');
    end

    n = length(x);
    yp = 0; 
    
    for i = 1:n
        L = 1; 
        
        for j = 1:n
            if i ~= j
                L = L * (xp - x(j)) / (x(i) - x(j));
            end
        end
        yp = yp + y(i) * L;
    end
end