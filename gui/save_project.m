function save_project(handles, lang, saveas)
% SAVE ACTUAL PROJECT
% Save status of the actual project.
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

% Constant import
constants;
savefile_extension = strcat('*', savefile_extension); %#ok<NODEF>

% If saveas then select file to save (or savefile is empty)
if saveas || strcmp(getappdata(handles.root, 'project_savefile'), '')
    
    set_status(handles, lang{80}, 'k');
    if strcmp(getappdata(handles.root, 'project_savefile'), '')
        [file,path] = uiputfile({savefile_extension, lang{78}}, lang{77}, ...
            lang{91}, getappdata(handles.root));
    else
        [file,path] = uiputfile({savefile_extension, lang{78}}, lang{77}, ...
            getappdata(handles.root, 'project_savefile'));
    end
    
    % Check if filename is valid
    if length(file)==1 && length(path)==1
        disp_error(handles, lang, 79);
        return
    end
    
    savefile = strcat(path, file);
    
    % Filename is stored
    setappdata(handles.root, 'project_savefile', savefile);
    setappdata(handles.root, 'project_savefile_short', file);
    setappdata(handles.root, 'last_opened_folder', path);
    
% If not then load savefile from GUI
else
    savefile = getappdata(handles.root, 'project_savefile');
end

try

    % Set waiting pointer
    set(handles.root, 'pointer', 'watch');
    
    % --------------------------------------------------------------------
    % Save table
    state.initial_table = get(handles.initial_solution, 'Data');
    state.initial_table_rowname = get(handles.initial_solution, 'RowName');

    % Save main variables - same order as new_file.m
    state.disp_freq = getappdata(handles.root, 'disp_freq');
    state.disp_vrexp = getappdata(handles.root, 'disp_vrexp');
    state.dispersion_ok = getappdata(handles.root, 'dispersion_ok');
    state.dispersion_file = getappdata(handles.root, 'dispersion_file');
    state.initial_table_validsize = getappdata(handles.root, 'initial_table_validsize');
    state.n_iter = getappdata(handles.root, 'n_iter');
    state.max_iter_sol = getappdata(handles.root, 'max_iter_sol');
    state.vr_iter = getappdata(handles.root, 'vr_iter');
    state.vp_iter = getappdata(handles.root, 'vp_iter');
    state.vs_iter = getappdata(handles.root, 'vs_iter');
    state.dns_iter = getappdata(handles.root, 'dns_iter');
    state.solution_ok = getappdata(handles.root, 'solution_ok');
    state.thk_sol = getappdata(handles.root, 'thk_sol');
    state.vs_sol = getappdata(handles.root, 'vs_sol');
    state.vp_sol = getappdata(handles.root, 'vp_sol');
    state.dns_sol = getappdata(handles.root, 'dns_sol');
    state.project_loaded = getappdata(handles.root, 'project_loaded');
    state.project_savefile = getappdata(handles.root, 'project_savefile');
    state.dispersion_file_short = getappdata(handles.root, 'dispersion_file_short');
    state.project_savefile_short = getappdata(handles.root, 'project_savefile_short');
    
    % Save inv entry
    state.inv_entry_sigma = get(handles.param_inv_sigma, 'string');
    state.inv_entry_mu = get(handles.param_inv_mu, 'string');
    state.inv_entry_maxiter = get(handles.param_maxiter, 'string');
    state.inv_entry_tolvs = get(handles.param_tolvs, 'string');
    
    % Save units
    state.vr_units = get(handles.unit_vr, 'String');
    state.unit_vr = get(handles.unit_vr, 'Value'); 
    state.vsvp_units = get(handles.unit_vsvp, 'String');
    state.unit_vsvp = get(handles.unit_vsvp, 'Value');
    state.h_units = get(handles.unit_h, 'String');
    state.unit_h = get(handles.unit_h, 'Value');
    state.rho_units = get(handles.unit_rho, 'String');
    state.unit_rho = get(handles.unit_rho, 'Value');
    
catch Exception
    
    % Get Exception report
    msg_error = getReport(Exception, 'basic', 'hyperlinks', 'off');
    if getappdata(handles.root, 'gui_sound')
        beep();
    end

    % Display errors / set statuses
    set_status(handles, lang{88}, 'r');
    errordlg(msg_error, lang{61});
    set(handles.root, 'pointer', 'arrow');
    return
    
end
% --------------------------------------------------------------------

% Saves file
save(savefile, 'state');

% Unlock entry on menu
set(handles.menu_file_save, 'Enable', 'on');

% Set status
set_status(handles, lang{89});
set(handles.root, 'pointer', 'arrow');

% Set title of the app
set_app_title(handles, lang);

end

