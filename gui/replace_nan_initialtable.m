function replace_nan_initialtable(handles, lang)
% REPLACE NAN INITIALTABLE
% This function replace al NaN's from initial solution table
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

% Get data table
table_data = get(handles.initial_solution, 'Data');

% Get number of rows
[nRows, ~] = size(table_data);

% Replace all NaN's
replzd = false;
for i = 1:nRows
    for j = 1:4
        if isnan(table_data{i, j})
            table_data{i, j} = [];
            replzd = true;
        end
    end
end

% Store table if a change has ocurred
if replzd
    set(handles.initial_solution, 'Data', table_data);
end

end