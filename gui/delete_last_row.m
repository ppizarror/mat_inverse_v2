function delete_last_row(handles, lang)
% DELETE LAST ROW
% Delete the last row from initial solution table
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
old_table_data = get(handles.initial_solution, 'Data');
old_table_row_names = get(handles.initial_solution, 'RowName');

% Get number of rows
[nRows, nColumns] = size(old_table_data);

% Check if nRows is greather than 1
if nRows == 1
    disp_error(handles, lang, 3);
    return
else
 
    % Create new data cell
    new_table_data = cell(nRows - 1, nColumns); %#ok<*PREALL>
    new_table_data = old_table_data(1:nRows - 1, :);
 
    % Set new row name
    new_table_row_name = cell(nRows - 1, 1);
    new_table_row_name = old_table_row_names(1:nRows - 1, :);
 
    % Set table
    set(handles.initial_solution, 'Data', new_table_data);
    set(handles.initial_solution, 'RowName', new_table_row_name);
 
end
end