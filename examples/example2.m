function example2
% EXAMPLE 2
% Example file created to test data, from Sebastiano Foti's B-example on
% Chapter 5. Only dispersion is tested.
%
% Author: Pablo Pizarro @ppizarror.com, 2017.
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

% Set cosntants
[ST, ~] = dbstack;
VERBOSE = true;
SAVE_DATA = true;
SHOW_PLOTS = false;

% Initialize path and variables
initialize_path();
status(VERBOSE, 0, ST.name);

% New theorical model created
thk = [5.0 3.0]';
dns = [1.8 1.8 1.8]';
vs = [400 300 450]';
vp = [700 500 800]';

% Frecuency set
freq = linspace(5, 100, 40)';

% New dispersion curve
status(VERBOSE, 1);
[vr, ~, ~, ~, ~, ~] = mat_disperse(thk, dns, vp, vs, freq);

% Store data to file
if SAVE_DATA
    status(VERBOSE, 2);
    save_data(ST.name, vr, freq, thk, vp, vs, dns, VERBOSE);
end

% Show plots
if SHOW_PLOTS
    
    % Show status
    status(VERBOSE, 4); %#ok<*UNRCH>

    % Phase velocity plot
    status(VERBOSE, 4);
    h1 = figure('Name', 'Dispersion curve', 'NumberTitle', 'off'); 
    plot(freq, vr, 'ro-');
    xlabel('Frequency $({s}^{-1})$', 'Interpreter', 'latex');
    ylabel('Phase velocity $(m/s)$', 'Interpreter', 'latex');
    title('Dispersion curve');

    % Shear velocity on depth plot
    vsinitial = vs';
    thk = thk';
    cumthk = [0 cumsum(thk)]; depth = 0; mdl_vel = vsinitial(1);
    for j = 1:length(thk)
        depth = [depth cumthk(j + 1) cumthk(j + 1)]; %#ok<*AGROW>
        mdl_vel = [mdl_vel vsinitial(j) vsinitial(j + 1)];
    end
    depth = [depth sum(thk) + thk(length(thk))];
    mdl_vel = [mdl_vel vsinitial(length(vsinitial))];

    h1 = figure('Name', 'Shear Velocity Profile', 'NumberTitle', 'off'); %#ok<*NASGU>
    plot(mdl_vel, depth, 'b');
    set(gca, 'YDir', 'reverse', 'XAxisLocation', 'top');
    set(gca, 'Position', [0.13 0.05 0.775 0.815], 'PlotBoxAspectRatio', [0.75 1 1]);
    xlabel('Shear wave velocity $V_s$ $(m/sec)$', 'Interpreter', 'latex');
    ylabel('Depth $(m)$', 'Interpreter', 'latex');
end

end

