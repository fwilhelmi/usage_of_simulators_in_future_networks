clear all
close all
clc

%% 7 dBm

T = readtable('spectrum_AP2_5G_7dBm_processed.csv');
T_array = table2array(T);
frequency_values = T_array(1,:);
measurements = T_array(2:size(T_array,1),:);

% % 3D plot
% figure
% surf(measurements)
% xlabel('Frequency (GHz)')
% ylabel('Timestamp')
% zlabel('Measurement (dBm)')
% xticks(1:6:size(T_array,1))
% xticklabels(frequency_values./1e9)
% set(gca,'FontSize',14,'FontName','Times')
% title('AP_2 (7 dBm)')

% 2D plot
figure 
imagesc(measurements)
xlabel('Frequency (GHz)')
ylabel('Time (s)')
xticks(size(T_array,2)/10:size(T_array,2)/5:size(T_array,2))
xticklabels([3.1 3.15 3.2 3.25 3.3])
yticks(size(T_array,1)/12:size(T_array,1)/6:size(T_array,1))
yticklabels([300 250 200 150 100 50])
c = colorbar;
c.Label.String = 'Power (dBm)';
set(gca,'FontSize',14,'FontName','Times')

%% 23 dBm

T = readtable('spectrum_AP2_5G_23dBm_processed.csv');
T_array = table2array(T);
frequency_values = T_array(1,:);
measurements = T_array(2:size(T_array,1),:);

% % 3D plot
% figure
% surf(measurements)
% xlabel('Frequency (GHz)')
% ylabel('Timestamp')
% zlabel('Measurement (dBm)')
% xticks(1:6:size(T_array,1))
% xticklabels(frequency_values./1e9)
% set(gca,'FontSize',14,'FontName','Times')
% title('AP_2 (23 dBm)')

% 2D plot
figure 
imagesc(measurements)
xlabel('Frequency (GHz)')
ylabel('Time (s)')
xticks(size(T_array,2)/10:size(T_array,2)/5:size(T_array,2))
xticklabels([3.1 3.15 3.2 3.25 3.3])
yticks(size(T_array,1)/12:size(T_array,1)/6:size(T_array,1))
yticklabels([300 250 200 150 100 50])
c = colorbar;
c.Label.String = 'Power (dBm)';
set(gca,'FontSize',14,'FontName','Times')