clc; clear; close all;

%% Synchronous Condenser Relay Setting Simulation
% This script simulates relay settings for a synchronous condenser used in power systems for voltage regulation and reactive power support.

%% System Parameters
V_nominal = 230; % Nominal voltage (V)
S_base = 100e6; % Base power (MVA)
X_syn = 0.1; % Synchronous reactance (pu)
relay_pickup_current = 1.2; % Relay pickup current in per unit (pu)
time_delay = 0.2; % Time delay for relay operation (seconds)

%% Relay Characteristic Curve
current_range = linspace(0.5, 2, 100); % Current in per unit (pu)
time_operation = time_delay ./ (current_range - relay_pickup_current + 1); % Inverse time characteristic

%% Visualization
figure;
plot(current_range, time_operation, 'b', 'LineWidth', 2);
hold on;
scatter(relay_pickup_current, time_delay, 'ro', 'filled');
hold off;
title('Relay Characteristic Curve for Synchronous Condenser');
xlabel('Current (pu)'); ylabel('Time Delay (s)');
grid on;
legend('Relay Characteristic Curve', 'Pickup Point');

%% Display Results
disp(['Relay Pickup Current: ', num2str(relay_pickup_current), ' pu']);
disp(['Relay Time Delay: ', num2str(time_delay), ' s']);
