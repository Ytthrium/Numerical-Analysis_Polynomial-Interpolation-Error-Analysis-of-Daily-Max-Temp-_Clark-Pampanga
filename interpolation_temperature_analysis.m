clear
clc
close all

data = readtable('Clark Daily Data.xlsx');
temp_raw = data{:, 2};   

valid_idx = ~isnan(temp_raw) & temp_raw ~= -99.9;
temp = temp_raw(valid_idx);

day = find(valid_idx); 
n = length(temp);

nodes = 1:30:n;
x_nodes = day(nodes);
y_nodes = temp(nodes);

x_interp = day; 

% Lagrange interpolation
y_lagrange = zeros(length(x_interp), 1);
for k = 1:length(x_interp)
    y_lagrange(k) = lagrange_interp(x_nodes, y_nodes, x_interp(k));
end

% Newton interpolation
coef = divided_diff(x_nodes, y_nodes);
y_newton = zeros(length(x_interp), 1);
for k = 1:length(x_interp)
    y_newton(k) = newton_eval(coef, x_nodes, x_interp(k));
end

actual = temp; % Keep as column vector
abs_error_lagrange = abs(actual - y_lagrange);
abs_error_newton = abs(actual - y_newton);

rel_error_lagrange = abs_error_lagrange ./ abs(actual);
rel_error_newton = abs_error_newton ./ abs(actual);

figure
plot(day, temp, '.', 'Color', [0.7 0.7 0.7], 'MarkerSize', 8, 'DisplayName', 'Actual Data')
hold on
plot(x_interp, y_lagrange, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Lagrange')
plot(x_interp, y_newton, 'g-.', 'LineWidth', 1.5, 'DisplayName', 'Newton')
plot(x_nodes, y_nodes, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'Nodes') % Highlight the chosen points
legend('Location', 'best')
xlabel('Day of Year')
ylabel('Temperature (°C)')
title('Interpolation of Daily Maximum Temperature (Clark, Pampanga)')
grid on

% Absolute error
figure
plot(day, abs_error_lagrange, 'r', 'LineWidth', 1.2, 'DisplayName', 'Lagrange Error')
hold on
plot(day, abs_error_newton, 'g--', 'LineWidth', 1.2, 'DisplayName', 'Newton Error')
legend('Location', 'best')
xlabel('Day of Year')
ylabel('Absolute Error (°C)')
title('Absolute Error of Interpolation')
grid on

% Relative error
figure
plot(day, rel_error_lagrange, 'r', 'LineWidth', 1.2, 'DisplayName', 'Lagrange Relative Error')
hold on
plot(day, rel_error_newton, 'g--', 'LineWidth', 1.2, 'DisplayName', 'Newton Relative Error')
legend('Location', 'best')
xlabel('Day of Year')
ylabel('Relative Error')
title('Relative Error of Interpolation')
grid on

fprintf('\n--- Polynomial Degree: %d ---\n', length(x_nodes) - 1);
fprintf('Mean Absolute Error (Lagrange): %.4f °C\n', mean(abs_error_lagrange));
fprintf('Mean Absolute Error (Newton): %.4f °C\n', mean(abs_error_newton));
fprintf('\nMean Relative Error (Lagrange): %.4f\n', mean(rel_error_lagrange));
fprintf('Mean Relative Error (Newton): %.4f\n', mean(rel_error_newton));