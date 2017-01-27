function status = check_initial_table(handles, lang)
% CHECK INITIAL TABLE
% This function checks that initial solution for solving inverse problem
% is valid.
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

% Initialize status
status = false;

% Get data table
table_data = get(handles.initial_solution, 'Data');

% Get number of rows
[nRows, ~] = size(table_data);

% Check number of rows of all columns that contain data
valid_nrows = cell(1, 4);
for j = 1:4
    for i = 1:nRows
        if isempty(table_data{i, j})
            valid_nrows{j} = i - 1;
            break
        end
    end
end

% Check if table is not empty
if sum([valid_nrows{:}]) == 0
    disp_error(handles, lang, 55);
    return
end

% Get min number of valid rows from columns 2 to 4
min_nrows = min([valid_nrows{2}, valid_nrows{3}, valid_nrows{4}]);

% Check columns 2 to 4 are equal to min_rows
if ~ (valid_nrows{2} == min_nrows && valid_nrows{3} == min_nrows && valid_nrows{4} == min_nrows)
    disp_error(handles, lang, 52, 'sigma');
    return
end

% Check min_nrows is greather than 1
if min_nrows <= 1
    disp_error(handles, lang, 56);
    return
end

% Check number of rows of fist column
if min_nrows - valid_nrows{1} ~= 1
    disp_error(handles, lang, 9, num2str(table_data{valid_nrows{1}, 1}));
    return
end

% Stores real initialtable size
setappdata(handles.root, 'initial_table_validsize', min_nrows);

% Set status to correct
status = true;

end

