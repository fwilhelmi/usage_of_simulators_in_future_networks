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

% 1 - Load and adapt results from Komondor
%   + All combinations
file_name_a0 = "output_execution_time_tests/raw_logs_console.txt";  % File containing the data to be plotted
T0 = readtable(file_name_a0);
events = T0{:,1};
time = T0{:,2};

file_name_a1 = "output_execution_time_tests/script_output.txt";
T1 = readtable(file_name_a1,'Delimiter',';');
throughput_A = T1{:,2};
throughput_B = T1{:,3};

num_txp_values = 5;
num_exec_times = 5;
num_repetitions = 50;

for i = 1:num_txp_values
    first_ix = (i*num_exec_times*num_repetitions) - (num_exec_times*num_repetitions) + 1;
    last_ix = i*num_exec_times*num_repetitions;
    events_reshaped{i} = events(first_ix:last_ix);
    time_reshaped{i} = time(first_ix:last_ix);
    throughput_A_reshaped{i} = throughput_A(first_ix:last_ix);
    throughput_B_reshaped{i} = throughput_B(first_ix:last_ix);
    for j = 1 : num_exec_times
        first_ix = (j*num_repetitions) - num_repetitions + 1;
        last_ix = j*num_repetitions;
        events_reshaped_2{i}(:,j) = events_reshaped{i}(first_ix:last_ix);
        time_reshaped_2{i}(:,j) = time_reshaped{i}(first_ix:last_ix);
        throughput_A_reshaped_2{i}(:,j) = throughput_A_reshaped{i}(first_ix:last_ix);
        throughput_B_reshaped_2{i}(:,j) = throughput_B_reshaped{i}(first_ix:last_ix);
    end    
end

%%
figure
mean1 = mean(throughput_A_reshaped_2{5}(:,1));
mean2 = mean(throughput_A_reshaped_2{5}(:,2));
mean3 = mean(throughput_A_reshaped_2{5}(:,3));
mean4 = mean(throughput_A_reshaped_2{5}(:,4));
mean5 = mean(throughput_A_reshaped_2{5}(:,5));
std1 = std(throughput_A_reshaped_2{5}(:,1));
std2 = std(throughput_A_reshaped_2{5}(:,2));
std3 = std(throughput_A_reshaped_2{5}(:,3));
std4 = std(throughput_A_reshaped_2{5}(:,4));
std5 = std(throughput_A_reshaped_2{5}(:,5));
plot(1:5,[mean1 mean2 mean3 mean4 mean5],'linewidth',1.5)
hold on
errorbar(1:5,[mean1 mean2 mean3 mean4 mean5], [std1 std2 std3 std4 std5],'ro','linewidth',1)
xlabel('Sim. time (s)')
ylabel('Throughput (Mbps)')
axis([0.9 5.1 50 70])
grid on
grid minor

yyaxis right
mean1 = mean(time_reshaped_2{5}(:,1));
mean2 = mean(time_reshaped_2{5}(:,2));
mean3 = mean(time_reshaped_2{5}(:,3));
mean4 = mean(time_reshaped_2{5}(:,4));
mean5 = mean(time_reshaped_2{5}(:,5));
plot(1:5,[mean(mean1) mean(mean2) mean(mean3) mean(mean4) mean(mean5)],'mx--', 'markersize',10)
xticks(1:5)
xticklabels([0.1, 1, 10, 100, 1000])
ylabel('Exec. time (s)')
legend({'Avg. throughput', 'Standard deviation', 'Exec. time'})
set(gca, 'FontSize', 16)
set(gca,'ycolor','m') 
%%


%hold on
%errorbar(1:5,[mean1 mean2 mean3 mean4 mean5], [std1 std2 std3 std4 std5],'r.')


% %   + Learning Part
% %       - Agent 0
% file_name_a1 = "output/1000it_2/logs_output_SIM_TEST_A0_A.txt";  % File containing the data to be plotted
% T1 = readtable(file_name_a1);
% %       - Agent 1
% file_name_a2 = "output/1000it_2/logs_output_SIM_TEST_A1_B.txt";
% T2 = readtable(file_name_a2);
% 
% %% PLOT THE RESULTS (throughput)
% fig = figure('pos',[450 400 400 350]);
% axes;
% axis([1 20 30 70]);
% plot(1:size(T1),T1{:,1}', '-o', 'linewidth', 1.5, 'markersize', 5);
% hold on 
% plot(1:size(T2),T2{:,1}','-x', 'linewidth', 1);
% plot(1:size(T1), default_tpt(1)*ones(1, size(T1,1)), '--')
% %axis([1 9 0 120])
% xlabel('Iteration, t','Interpreter','latex')
% ylabel({'$\overline{\Gamma}$ (Mbps)'},'Interpreter','latex')
% axis([0 200 0 120])
% %title(sprintf('A%d of BSS_B', i))
% %title(actions_strings{i})
% set(gca, 'FontSize', 14)
% legend({'BSS_A', 'BSS_B', 'Default'}, 'FontSize', 14, 'Location', 'south','NumColumns',1)
% grid on 
% grid minor
% 
% % fig = figure('pos',[450 400 400 350]);
% % axes;
% % axis([1 20 30 70]);
% % times_action_played_A = [16  155  9  9  10];
% % times_action_played_B = [16  155  9  9  10];
% % bar([times_action_played_A'./sum(times_action_played_A)...
% %     times_action_played_B'./sum(times_action_played_A)]);
% % legend({'BSS_A', 'BSS_B'}, 'FontSize', 14, 'Location', 'south','NumColumns',2)
% % xlabel('Tx power (dBm)','Interpreter','latex')
% % xticks(1:5)
% % xticklabels([4, 7, 12, 17, 23])
% % ylabel({'\%'},'Interpreter','latex')
% % set(gca, 'FontSize', 14)
