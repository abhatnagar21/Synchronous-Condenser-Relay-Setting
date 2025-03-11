clc; clear; close all;

%% Synchronous Condenser Relay Setting Simulation
% This script simulates the relay protection settings for a synchronous condenser to regulate voltage and reactive power in a power system.

%% System Parameters
V_nominal = 11e3; % Nominal voltage (V)
S_rating = 50e6;  % Synchronous condenser rating (VA)
X_syn = 0.1;      % Synchronous reactance (pu)
I_nominal = S_rating / (sqrt(3) * V_nominal); % Nominal current (A)

%% Relay Protection Settings
overvoltage_limit = 1.1 * V_nominal; % Overvoltage trip setting
undervoltage_limit = 0.9 * V_nominal; % Undervoltage trip setting
overcurrent_limit = 1.2 * I_nominal; % Overcurrent trip setting
underexcitation_limit = 0.8 * X_syn; % Underexcitation trip setting

time_delay_overvoltage = 0.2; % Time delay for overvoltage relay (sec)
time_delay_undervoltage = 0.2; % Time delay for undervoltage relay (sec)
time_delay_overcurrent = 0.1; % Time delay for overcurrent relay (sec)
time_delay_underexcitation = 0.3; % Time delay for underexcitation relay (sec)

%% Fault Scenarios and Relay Response
V_system = linspace(0.8*V_nominal, 1.2*V_nominal, 100); % Simulated voltage variations
I_system = linspace(0.8*I_nominal, 1.5*I_nominal, 100); % Simulated current variations
relay_trip_overvoltage = V_system > overvoltage_limit;
relay_trip_undervoltage = V_system < undervoltage_limit;
relay_trip_overcurrent = I_system > overcurrent_limit;
relay_trip_underexcitation = X_syn < underexcitation_limit;

%% Visualization
figure;
subplot(2,2,1);
plot(V_system, relay_trip_overvoltage, 'r');
title('Overvoltage Relay Response'); xlabel('Voltage (V)'); ylabel('Trip Status'); grid on;

subplot(2,2,2);
plot(V_system, relay_trip_undervoltage, 'b');
title('Undervoltage Relay Response'); xlabel('Voltage (V)'); ylabel('Trip Status'); grid on;

subplot(2,2,3);
plot(I_system, relay_trip_overcurrent, 'g');
title('Overcurrent Relay Response'); xlabel('Current (A)'); ylabel('Trip Status'); grid on;

subplot(2,2,4);
plot(ones(1,100) * X_syn, relay_trip_underexcitation, 'm');
title('Underexcitation Relay Response'); xlabel('Reactance (pu)'); ylabel('Trip Status'); grid on;

%% Display Results
disp(['Overvoltage Trip Setting: ', num2str(overvoltage_limit), ' V']);
disp(['Undervoltage Trip Setting: ', num2str(undervoltage_limit), ' V']);
disp(['Overcurrent Trip Setting: ', num2str(overcurrent_limit), ' A']);
disp(['Underexcitation Trip Setting: ', num2str(underexcitation_limit), ' pu']);
