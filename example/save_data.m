function save_data(filename, vr, freq, thk, vp, vs, dns, verbose)
% SAVE DATA
% This function creates dispertion and initial solution
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
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA

% Check verbose
if ~ exist('verbose', 'var')
    verbose = false;
end

% Create filenames
initial_filename = strcat(filename, '_initial');
disperse_filename = strcat(filename, '_disperse');

% Set new cell data structure
lns = length(dns)+1;  % Length of initial solution
fns = length(freq)+1; % Length of dispertion solution

thk2 = cell(lns-1, 1);
vs2 = cell(lns, 1);
vp2 = cell(lns, 1);
dns2 = cell(lns, 1);

freq2 = cell(fns, 1);
vr2 = cell(fns, 1);

% Set head of all vectors
thk2{1} = 'H';
vs2{1} = 'VS';
vp2{1} = 'VP';
dns2{1} = 'RHO';

freq2{1}= 'FREQ';
vr2{1}='VR';

% Transform vector to cell
for i=2:lns
    dns2{i}=dns(i-1);
    vs2{i}=vs(i-1);
    vp2{i}=vp(i-1); 
end

for i=2:lns-1
    thk2{i}=thk(i-1);
end

for i=2:fns
    freq2{i}=freq(i-1);
    vr2{i}=vr(i-1);
end

% Save initial guess file
if verbose
    fprintf('Creating initial guess file ''%s''\n', initial_filename);
end
xlswrite(initial_filename, thk2, 1, 'A');
xlswrite(initial_filename, vs2, 1, 'B');
xlswrite(initial_filename, vp2, 1, 'C');
xlswrite(initial_filename, dns2, 1, 'D');

% Save dispertion file
if verbose
    fprintf('Creating dispertion file ''%s''\n', disperse_filename);
end
xlswrite(disperse_filename, freq2, 1, 'A');
xlswrite(disperse_filename, vr2, 1, 'B');
end