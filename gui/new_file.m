function new_file(handles, lang, doask)
% NEW FILE
% Deletes all status variables and clear application.
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

% If doask is 'false' then creates a new file without asking to user
if doask
    if getappdata(handles.root, 'gui_sound')
        beep();
    end
    choice = questdlg(lang{73}, lang{76}, lang{74}, lang{75}, lang{74});
    switch choice
        case lang{74}   
        case lang{75} 
            return
    end
end

% Set main variables
setappdata(handles.root, 'disp_freq', []);
setappdata(handles.root, 'disp_vrexp', []);
setappdata(handles.root, 'dispersion_ok', false);
setappdata(handles.root, 'dispersion_file', '');
setappdata(handles.root, 'initial_table_validsize', 0);
setappdata(handles.root, 'n_iter', []);
setappdata(handles.root, 'vr_iter', []);
setappdata(handles.root, 'vp_iter', []);
setappdata(handles.root, 'vs_iter', []);
setappdata(handles.root, 'dns_iter', []);
setappdata(handles.root, 'solution_ok', false);
setappdata(handles.root, 'thk_sol', []);
setappdata(handles.root, 'vs_sol', []);
setappdata(handles.root, 'vp_sol', []);
setappdata(handles.root, 'dns_sol', []);
setappdata(handles.root, 'project_loaded', false);
setappdata(handles.root, 'project_savefile', '');
setappdata(handles.root, 'dispersion_file_short', '');
setappdata(handles.root, 'project_savefile_short', '');

% Update inv entry (from config.m)
set(handles.param_inv_sigma, 'string', getappdata(handles.root, 'cgf_sigma'));
set(handles.param_inv_mu, 'string', getappdata(handles.root, 'cgf_mu'));
set(handles.param_maxiter, 'string', getappdata(handles.root, 'cgf_maxiter'));
set(handles.param_tolvs, 'string', getappdata(handles.root, 'cgf_tolvs'));

% Set first units
set(handles.unit_vr, 'Value', 1);  
set(handles.unit_vsvp, 'Value', 1);
set(handles.unit_h, 'Value', 1);
set(handles.unit_rho, 'Value', 1);

% Disable / Enable buttons
set(handles.menu_file_save, 'Enable', 'off');
disable_sol(handles, lang);

% Delete plot
axes(handles.plt_dispersion_file);
cla reset;
set(handles.status_direction_file, 'string', '');

% Clear initialtable
clear_initialtable(handles, lang, false);

% Clear status
set_status(handles, '');

% Set cursor
set(handles.root, 'pointer', 'arrow');

% Set title of the app
set_app_title(handles, lang);

% Clear iteration status
set(handles.status_iteration, 'string', '');

end

