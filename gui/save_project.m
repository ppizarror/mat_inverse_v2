function save_project(handles, lang, saveas)
% SAVE ACTUAL PROJECT
% Save status of project
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

% If saveas then select file to save (or savefile is empty)
if saveas || strcmp(getappdata(handles.root, 'project_savefile'), '')
    
    
    [file,path] = uiputfile({'*.invprjt', lang{78}}, lang{77});
    
    % Check if filename is valid
    if length(file)==1 && length(path)==1
        disp_error(handles, lang, 79);
        return
    end
    
    savefile = strcat(path, file);
    
    % Filename is stored
    setappdata(handles.root, 'project_savefile', savefile);
    
% If not then load savefile from GUI
else
    savefile = getappdata(handles.root, 'project_savefile');
end

%  --- Saves state
state.initial_table = get(handles.initial_solution, 'Data');
state.initial_table_rowname = get(handles.initial_solution, 'RowName');

% Saves file
save(savefile, 'state');

% Unlock entry on menu
set(handles.menu_file_save, 'Enable', 'on');