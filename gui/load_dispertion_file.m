function load_dispertion_file(handles, lang)
% LOAD DISPERTION FILE
% Load dispertion file from Excel, then plot it on GUI.
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

set_status(handles, lang{5});
[baseName, folder] = uigetfile({' *.xlsx'; '*.xls'});

% If filename is valid
if baseName ~= 0

    % Open file
    set_status(handles, lang{8}, 'k');
    try
        excel_data = xlsread(strcat(folder, baseName));
    catch
        set_status(handles, lang{25}, 'r');
        errordlg(lang{24},lang{23})
    end
        
    [nRow, nColumn] = size(excel_data);
    
    % Constant import
    constants;
    
% If filename is invalid
else
    set_status(handles, lang{33}, 'r');
end
end