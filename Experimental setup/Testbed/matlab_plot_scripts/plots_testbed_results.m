clear all
clc

AP1 = [67.4 119];
AP2 = [56.1 72.4];

% 3D plot
figure
bar([AP1; AP2])
xlabel('AP id')
ylabel('Throughput (Mbps)')
legend({'Default (23 dBm)', 'Proposed (7 dBm)'})
set(gca,'FontSize',14,'FontName','Times')
grid on
grid minor