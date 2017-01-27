function clear_initialtable(handles, lang, doask)
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

% Check if table has any content
data = get(handles.initial_solution, 'Data');
ndata = length(data);
data_empty = true;
for i=1:ndata
    for j=1:4
        if ~isempty(data{i,j})
            data_empty = false;
            break
        end
    end
end

% Ask user
if ~data_empty && doask
    if getappdata(handles.root, 'gui_sound')
        beep();
    end
    choice = questdlg(lang{100}, lang{101}, lang{74}, lang{75}, lang{74});
    switch choice
        case lang{74}
        case lang{75} 
            return
    end
end

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