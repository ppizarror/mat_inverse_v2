function clear_initialtable(handles, lang)
% CLEAR INITIAL TABLE
% Clear initial table
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

% Constant importation
constants;

% New table is created
new_table = cell(min_rowsize_initialtable, 4);

% Create new table row names
table_row_name = cell(min_rowsize_initialtable, 1);
for i = 1:min_rowsize_initialtable
    table_row_name{i} = num2str(i);
end

% Store table
set(handles.initial_solution, 'Data', new_table);
set(handles.initial_solution, 'RowName', table_row_name);

% Successful importation
set_status(handles, lang{26});
end