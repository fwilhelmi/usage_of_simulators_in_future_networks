clear all
close all
clc

disp('***********************************************************************')
disp('*                         [ARTICLE TITLE]                             *')
disp('*                                                                     *')
disp('* Submission to ISWCS                                                 *')
disp('* Authors:                                                            *')
disp('*   - Francesc Wilhelmi (francisco.wilhelmi@upf.edu)                  *')
disp('* Copyright (C) 2019-2024, and GNU GPLd, by Francesc Wilhelmi         *')
disp('* Repository:                                                         *')
disp('*  ...                                                                *')
disp('***********************************************************************')

disp('----------------------------------------------')
disp('- Performance achieved by each configuration -')
disp('----------------------------------------------')

%% TOY SCENARIO 1
default_tpt = [58.93 58.93];
% 1 - Load and adapt results from Komondor
%   + All combinations
% file_name_a0 = "output/script_output.txt";  % File containing the data to be plotted
% T0 = readtable(file_name_a0);
% throughput_A = T0{:,2};
% throughput_B = T0{:,3};
% bar([throughput_A throughput_B])
%   + Learning Part
%       - Agent 0
file_name_a1 = "output/1000it_2/logs_output_SIM_TEST_A0_A.txt";  % File containing the data to be plotted
T1 = readtable(file_name_a1);
%       - Agent 1
file_name_a2 = "output/1000it_2/logs_output_SIM_TEST_A1_B.txt";
T2 = readtable(file_name_a2);

%% PLOT THE RESULTS (throughput)
fig = figure('pos',[450 400 400 350]);
axes;
axis([1 20 30 70]);
plot(1:size(T1),T1{:,1}', '-o', 'linewidth', 1.5, 'markersize', 5);
hold on 
plot(1:size(T2),T2{:,1}','-x', 'linewidth', 1);
plot(1:size(T1), default_tpt(1)*ones(1, size(T1,1)), '--')
%axis([1 9 0 120])
xlabel('Iteration, t','Interpreter','latex')
ylabel({'$\overline{\Gamma}$ (Mbps)'},'Interpreter','latex')
axis([0 200 0 120])
%title(sprintf('A%d of BSS_B', i))
%title(actions_strings{i})
set(gca, 'FontSize', 14)
legend({'BSS_A', 'BSS_B', 'Default'}, 'FontSize', 14, 'Location', 'south','NumColumns',1)
grid on 
grid minor

% fig = figure('pos',[450 400 400 350]);
% axes;
% axis([1 20 30 70]);
% times_action_played_A = [16  155  9  9  10];
% times_action_played_B = [16  155  9  9  10];
% bar([times_action_played_A'./sum(times_action_played_A)...
%     times_action_played_B'./sum(times_action_played_A)]);
% legend({'BSS_A', 'BSS_B'}, 'FontSize', 14, 'Location', 'south','NumColumns',2)
% xlabel('Tx power (dBm)','Interpreter','latex')
% xticks(1:5)
% xticklabels([4, 7, 12, 17, 23])
% ylabel({'\%'},'Interpreter','latex')
% set(gca, 'FontSize', 14)
