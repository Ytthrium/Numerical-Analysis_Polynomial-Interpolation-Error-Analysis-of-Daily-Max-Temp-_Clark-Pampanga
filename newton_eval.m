function yp = newton_eval(coef, x, xp)
%   Input:
%       coef - vector of divided difference coefficients [f[x0], f[x0,x1], ...]
%       x    - vector of interpolation nodes [x0, x1, ..., xn]
%       xp   - point(s) at which to evaluate the polynomial
%   Output:
%       yp   - interpolated value(s) at xp

    n = length(coef);
    yp = coef(n);  % Initialize with highest-order coefficient
    
    % Evaluate using Horner's method (nested multiplication)
    % This processes from highest degree to lowest for numerical stability
    for i = n-1:-1:1
        yp = yp .* (xp - x(i)) + coef(i);
    end
end