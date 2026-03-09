% Dataset: PAGASA Daily Maximum Temperature
% Location: Clark, Pampanga Synoptic Station
% Period: Jan 1, 2025 – Dec 31, 2025

clc
clear
close all

filename = 'Clark Daily Data.xlsx';

opts = detectImportOptions(filename);
opts.DataRange = 'A3'; 

data = readtable(filename, opts);

dates = datetime(data{:,1});
temperature = data{:,2};

mean_temp = mean(temperature);
max_temp = max(temperature);
min_temp = min(temperature);
std_temp = std(temperature);

fprintf('Average Temperature: %.2f °C\n', mean_temp)
fprintf('Maximum Temperature: %.2f °C\n', max_temp)
fprintf('Minimum Temperature: %.2f °C\n', min_temp)
fprintf('Standard Deviation: %.2f °C\n', std_temp)

months = month(dates);
monthly_avg = zeros(12,1);

for i = 1:12
    monthly_avg(i) = mean(temperature(months == i));
end

x = 1:length(temperature);
p = polyfit(x,temperature,1);
trend = polyval(p,x);

figure
plot(dates, temperature,'b')
hold on
plot(dates, trend,'r','LineWidth',2)

title('Daily Maximum Temperature Trend (Clark Airport, 2025)')
xlabel('Date')
ylabel('Temperature (°C)')
legend('Daily Temperature','Trend Line')
grid on


figure
bar(monthly_avg)

title('Monthly Average Maximum Temperature (2025)')
xlabel('Month')
ylabel('Temperature (°C)')

xticks(1:12)
xticklabels({'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})

grid on


window = 7;
smooth_temp = movmean(temperature,window);

figure
plot(dates, temperature)
hold on
plot(dates, smooth_temp,'LineWidth',2)

title('7-Day Moving Average Temperature')
xlabel('Date')
ylabel('Temperature (°C)')
legend('Daily','7-Day Moving Average')
grid on