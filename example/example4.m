function example4
% EXAMPLE 4
% Example file created to test data, set disperse and inverse examples on
% big data structure.
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
SHOW_PLOTS = false;

% Initialize path and variables
initialize_path();
status(VERBOSE, 0, ST.name);

% New theorical model created
thk = [3.0 5.0 10.0 15.0 15.0 10.0]';
dns = [1.7 1.8 1.8 1.8 1.8 1.8 1.8]';
vs = [250 300 400 450 500 500 500]';
vp = [400 600 650 700 800 900 1000]';

% Frecuency set
freq = linspace(5, 150, 20)';
nfreq = length(freq);

% New dispersion curve
status(VERBOSE, 1);
[vr, ~, ~, ~, ~, ~] = mat_disperse(thk, dns, vp, vs, freq);

% Store data on file
status(VERBOSE, 2);
save_data(ST.name, vr, freq, thk, vp, vs, dns, VERBOSE);

% Added some noise to data
sigma = 0.02 + zeros(nfreq, 1);
err = sigma .* randn(nfreq, 1);
vr_exp = vr + err;

% Invertion parameters
maxiter = 10;
mu = 10;
tol_vs = 0.01;

% New guess (initial solution) is defined to inverse
lng = length(dns);
thk1 = thk;
dns1 = ones(lng, 1).*mean(dns);
vs1 = ones(lng, 1).*mean(vs);
vp1 = ones(lng, 1).*mean(vp);

% Inversion
status(VERBOSE, 3);
[niter, vr_iter, vp_iter, vs_iter, dns_iter] = mat_inverse(freq, vr_exp, sigma, thk1, vp1, vs1, dns1, maxiter, mu, tol_vs); %#ok<*ASGLU>

% Show plots
if SHOW_PLOTS
    
    % Show status
    status(VERBOSE, 4);
    
    % Phase velocity plot
    h1 = figure('Name', 'Dispersion curve', 'NumberTitle', 'off');  %#ok<*UNRCH>
    plot(freq, vr, 'ro-');
    xlabel('Frequency $({s}^{-1})$', 'Interpreter', 'latex');
    ylabel('Phase velocity $(m/s)$', 'Interpreter', 'latex');
    title('Dispersion curve');

    % Theorical vs Experimental dispersion curve
    h2 = figure('Name', 'Theorical v/s Experimental Dispersion Curve', 'NumberTitle', 'off'); %#ok<*NASGU>
    hold on;
    errorbar(freq, vr_exp, sigma, 'ro--');
    final_iteration = niter;
    plot(freq, vr_iter(:, final_iteration));
    xlabel('Frequency $(Hz)$', 'Interpreter', 'latex');
    ylabel('Phase velocity $(m/s)$', 'Interpreter', 'latex');
    hold off;

    % Shear velocity on depth plot
    vsfinal = vs_iter(:, niter)';
    vsinitial = vs';
    thk = thk';
    if ~ isempty(vsfinal)
        cumthk = [0 cumsum(thk)]; depth = 0; velocity = vsfinal(1); mdl_vel = vsinitial(1);
        for j = 1:length(thk)
            depth = [depth cumthk(j + 1) cumthk(j + 1)]; %#ok<*AGROW>
            velocity = [velocity vsfinal(j) vsfinal(j + 1)];
            mdl_vel = [mdl_vel vsinitial(j) vsinitial(j + 1)];
        end
        depth = [depth sum(thk) + thk(length(thk))];
        velocity = [velocity vsfinal(length(vsfinal))];
        mdl_vel = [mdl_vel vsinitial(length(vsinitial))];

        h3 = figure('Name', 'Shear Velocity Profile', 'NumberTitle', 'off'); % #ok<*NASGU>
        plot(velocity, depth, 'b', mdl_vel, depth, 'k--');
        set(gca, 'YDir', 'reverse', 'XAxisLocation', 'top');
        set(gca, 'Position', [0.13 0.05 0.775 0.815], 'PlotBoxAspectRatio', [0.75 1 1]);
        xlabel('Shear wave velocity $V_s$ $(m/sec)$', 'Interpreter', 'latex');
        ylabel('Depth $(m)$', 'Interpreter', 'latex');
        legend('Inverse model', 'Real value');
    end
end

end