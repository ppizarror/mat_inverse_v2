% Example file, author: Pablo Pizarro @ppizarror.com.
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

function example1

% Initialize path
initialize_path();

% New theorical model created
thk = [5.0 10.0 10.0]';
dns = [1.7 1.8 1.8 1.8]';
vs = [200 300 400 500]';
vp = [400 600 800 1000]';

% Frecuency set
freq = linspace(5, 100, 20)';
nfreq = length(freq);

% New dispertion curve created
[vr, ~, ~, ~, ~, ~] = mat_disperse(thk, dns, vp, vs, freq);

% Phase velocity plot
figure(1);
plot(freq, vr, 'ro-');
xlabel('Frecuencia [${s}^{-1}]$', 'Interpreter', 'latex');
ylabel('Velocidad de Fase $(m/s)$', 'Interpreter', 'latex');
title('Curva de dispersión');

% Added some noise to data
sigma = 0.02 + zeros(nfreq, 1);
err = sigma .* randn(nfreq, 1);
vr_exp = vr + err;

% Invertion parameters
maxiter = 10;
mu = 10;
tol_vs = 0.01;

% New guess (initial solution) is defined to inverse
thk1 = [5.0 10.0 10.0]';
dns1 = [1.8 1.8 1.8 1.8]';
vs1 = [350 350 350 350]';
vp1 = [700 700 700 700]';

% Invertion
[niter, vr_iter, vp_iter, vs_iter, dns_iter] = mat_inverse(freq, vr_exp, sigma, thk1, vp1, vs1, dns1, maxiter, mu, tol_vs); %#ok<*ASGLU>

% Theorical vs Experimental dispertion curve
h2 = figure('Name', 'Curva de Dispersión Teórica v/s Experimental', 'NumberTitle', 'off'); %#ok<*NASGU>
errorbar(freq, vr_exp, sigma, 'ro');
hold on;
final_iteration = niter;
plot(freq, vr_iter(:, final_iteration));
xlabel('Frequency $(Hz)$', 'Interpreter', 'latex');
ylabel('Velocidad de Fase $(m/s)$', 'Interpreter', 'latex');
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
 
    h3 = figure('Name', 'Perfil de Velocidad de Corte', 'NumberTitle', 'off'); % #ok<*NASGU>
    plot(velocity, depth, 'b', mdl_vel, depth, 'k--');
    set(gca, 'YDir', 'reverse', 'XAxisLocation', 'top');
    set(gca, 'Position', [0.13 0.05 0.775 0.815], 'PlotBoxAspectRatio', [0.75 1 1]);
    xlabel('Velocidad de onda de corte $V_s$ $(m/sec)$', 'Interpreter', 'latex');
    ylabel('Profundidad $(m)$', 'Interpreter', 'latex');
    legend('Modelo inverso', 'Valor real');
end
end