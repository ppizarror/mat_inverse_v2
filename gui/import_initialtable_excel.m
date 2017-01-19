function import_initialtable_excel(handles, lang)
% IMPORT INITIAL TABLE FROM EXCEL
% Import initial table (used by mat_inverse) from Excel file.
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

% Request file
set_status(handles, lang{5});
filename = uigetfile({' *.xlsx'; '*.xls'});

% If filename is valid
if filename ~= 0

    % Open file
    set_status(handles, lang{8}, 'r');
    excel_data = xlsread(filename);
    [nRow, nColumn] = size(excel_data);
    
    % Check if nColumn is 4
    if nColumn == 4
        
        % Check if last H is not a number
        if ~all(ismember(num2str(excel_data(nRow, 1)), '0123456789+-.eE'))
            
            % New table row size
            n_row = max(20, nRow);
            
            % New table is created
            new_table = cell(n_row, 4);
            
            % Copy new table to cell
            for i=1:nRow
                for j=1:4
                    if ~(i==nRow && j==1)
                        new_table{i,j} = excel_data(i, j);
                    end
                end
            end
            
            % Create new table row names
            table_row_name = cell(n_row, 1);
            for i=1:n_row
                table_row_name{i}=num2str(i);
            end
            
            % Store table
            set(handles.initial_solution, 'Data', new_table);
            set(handles.initial_solution, 'RowName', table_row_name);
            
            % Successful importation
            set_status(handles, lang{10});
            
        else
            set_status(handles, sprintf(lang{9}, num2str(excel_data(nRow, 1))), 'r');
        end
        
    else
        set_status(handles, sprintf(lang{7}, nColumn), 'r');
    end
    
% If filename is invalid
else
    
    set_status(handles, lang{6}, 'r');
    
end