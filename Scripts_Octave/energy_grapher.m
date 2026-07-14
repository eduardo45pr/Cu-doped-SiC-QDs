% Octave script to plot energy levels as an "Eigenvalues Display"

clear; clc; clf;

%% 1. SIMULATION OR LOADING SIESTA DATA
% Replace these vectors with your real data extracted from the .EIG or .out file
% Each vector represents the energies (in eV) already aligned with the Fermi level (E - Ef)

% Test data (simulating the distribution in the image)
energy_1 = [-3.0:0.1:-2.3, -2.1, -2.0, -1.8, -1.7, -1.5, -0.85, 1.0, 1.8, 3.5, 3.6, 3.9, 4.2:0.1:5.0];
energy_2 = [-2.7, -2.6, -2.5, -2.4, -2.05, -0.35, 0.9, 2.35, 2.7:0.1:3.0, 3.2:0.05:4.0, 4.1:0.1:5.0];
energy_3 = [-3.0:0.08:-2.2, -2.0, -1.9, -1.7, -1.5, -1.45, -0.32, 2.35, 3.4, 3.5, 3.8, 3.9, 4.1:0.1:5.0];

% Group into a cell array for easy iteration
energy_data = {energy_1, energy_2, energy_3};

%% 2. PLOT CONFIGURATION
figure(1);
hold on;
box on; % Displays the full boundary box (publication style)

% Width of the horizontal line for each energy level
line_width_half = 0.15; 

% Plot the energy levels
for i = 1:length(energy_data)
    current_energies = energy_data{i};
    x_center = i; % Positions 1, 2, 3 on the X axis
    
    for j = 1:length(current_energies)
        E = current_energies(j);
        % Plot a horizontal segment from (x_center - line_width_half) to (x_center + line_width_half)
        plot([x_center - line_width_half, x_center + line_width_half], [E, E], 'r-', 'LineWidth', 1.2);
    end
end

%% 3. FERMI REFERENCE LINE (E = 0)
% Dashed gray line at Y = 0
plot([0.5, 3.5], [0, 0], '--', 'Color', [0.5 0.5 0.5], 'LineWidth', 1.0);

%% 4. AXIS LABELS AND STYLING (IDENTICAL style to image_b67d3e.png)
title('(a)', 'FontSize', 16, 'FontWeight', 'normal');

% --- AXIS LABELS ---
ylabel('Energy (eV)', 'FontSize', 14);            % Y-axis label (Eje Y)
xlabel('Configuration / System', 'FontSize', 14); % X-axis label (Eje X)

% Adjust axis limits
xlim([0.5, 3.5]);
ylim([-3, 5]);

% Ticks configuration
set(gca, 'XTick', [1, 2, 3]);
set(gca, 'XTickLabel', {'1', '2', '3'}, 'FontSize', 12);
set(gca, 'YTick', -3:1:5);
set(gca, 'FontSize', 12);

% Set axis ticks to face inwards (TickDir -> in)
set(gca, 'TickDir', 'in');
set(gca, 'LineWidth', 1.5); % Plot border thickness

hold off;