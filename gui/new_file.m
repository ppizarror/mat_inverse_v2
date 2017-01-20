function new_file(handles, lang, doask)
% NEW FILE
% Deletes all status variables.
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
setappdata(handles.root, 'dispertion_ok', false);
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

% Update inv entry (from config.m)
set(handles.param_inv_sigma, 'string', getappdata(handles.root, 'cgf_sigma'));
set(handles.param_inv_mu, 'string', getappdata(handles.root, 'cgf_mu'));
set(handles.param_maxiter, 'string', getappdata(handles.root, 'cgf_maxiter'));
set(handles.param_tolvs, 'string', getappdata(handles.root, 'cgf_tolvs'));

% Disable / Enable buttons
set(handles.start_button, 'Enable', 'on');

% Set button strings
set_lang_string(handles.start_button, lang{42}, 'string');

% Delete plot
axes(handles.plt_dispertion_file);
cla reset;
set(handles.status_direction_file, 'string', '');

% Clear initialtable
clear_initialtable(handles, lang);

% Clear status
set_status(handles, '');

end