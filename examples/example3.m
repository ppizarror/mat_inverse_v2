function example3
% EXAMPLE 3
% Example file created to test big data structures.
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
thk = [2 3 5 5 5 5 5]';
dns = [1.8 1.8 1.8 1.8 1.8 1.8 1.8 1.8]';
vs = [150 150 150 150 150 150 150 150]';
poisson = [0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2]';
vp = vs.*sqrt((2-2*poisson)./(1-2*poisson));

% Frecuency set
freq = [5.0000    5.5937    6.1875    6.7812    7.3750    7.9687    8.5625    9.1562...
    9.7500   10.3437   10.9375   11.5312   12.1250   12.7187   13.3125   14.5000   16.2812...
   18.0625   19.8438   21.6250   23.4063   25.1875   26.9688   28.7500   30.5313   32.3125...
   34.0938   34.6875   38.8438   43.0000   47.1563   51.3125   55.4688   59.6250   63.7813]';

vr = [301.1762  238.6665  287.9998  315.6362  228.8484  220.5404  213.8536  208.3555...
      203.7550  199.8490  199.9999  200.1355  203.5409  200.3692  200.4706  200.6486  200.8674...
  198.8817  197.2816  199.4955  198.0826  198.4000  195.8582  192.4183  191.8037  188.0000...
  183.7474  184.0415  186.7418  186.5763  160.9600  164.7148  150.6632  157.3609  160.0785]';

% Store data on file
status(VERBOSE, 2);
save_data(ST.name, vr, freq, thk, vp, vs, dns, VERBOSE);

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