function start_inversion(handles, hObject, lang)
% START INVERSION
% Starts the inversion calculus.
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

% Set status
set_status(handles, lang{48}, 'k');
disable_sol(handles, lang);

% --- Input validation
set_status(handles, lang{49}, 'k');
valid = check_input(handles, lang);

% Return if not valid input
if ~valid
    return
end

% --- STARTS INVERSION------------------------------------------------

% Get data from GUI
freq = getappdata(handles.root, 'disp_freq');
vr_exp = getappdata(handles.root, 'disp_vrexp');
sigma = get(handles.param_inv_sigma, 'string');
mu = get(handles.param_inv_mu, 'string');
maxiter = get(handles.param_maxiter, 'string');
tol_vs = get(handles.param_tolvs, 'string');
table_data = get(handles.initial_solution, 'Data');

% Convert data to source
sigma = str2double(sigma) + zeros(length(freq), 1);
mu = str2double(mu);
maxiter = str2double(maxiter);
tol_vs = str2double(tol_vs);

% Create thk, vp, vs and dns vectors
nrow = getappdata(handles.root, 'initial_table_validsize');
thk = [table_data{1:nrow-1, 1}]';
vs = [table_data{1:nrow, 2}]';
vp = [table_data{1:nrow, 3}]';
dns = [table_data{1:nrow, 4}]';

% Set statuses
set_status(handles, lang{57}, 'k');
set(handles.root, 'pointer', 'watch');
set_lang_string(handles.start_button, lang{62}, 'string');
set(handles.start_button, 'Enable', 'off');
guidata(hObject, handles);
pause(0.01);

% Starts mat_inverse
try
    
    tic;
    [niter, vr_iter, vp_iter, vs_iter, dns_iter] = mat_inverse(freq, vr_exp, sigma, thk, ...
        vp, vs, dns, maxiter, mu, tol_vs, true, handles.status_iteration, lang{58}); %#ok<*ASGLU>
    exec_time = toc;
    
% Some error has occurred
catch Exception
    
    % Get Exception message
    msg_error = getReport(Exception, 'basic', 'hyperlinks', 'off');
    beep();
    
    % Display errors / set statuses
    set_status(handles, lang{60}, 'r');
    errordlg(msg_error, lang{61});
    set_lang_string(handles.start_button, lang{42}, 'string');
    disp(msg_error);
    
    % Disable/Enable buttons
    set(handles.start_button, 'Enable', 'on');
    set(handles.view_sol_plot, 'Enable', 'off');
    set(handles.export_results, 'Enable', 'off');
    
    % Change app cursor
    set(handles.root, 'pointer', 'arrow');
    
    % Set solution status to ERROR
    setappdata(handles.root, 'solution_ok', false);
    return
    
end 
% --------------------------------------------------------------------

% Set completed status
set_status(handles, sprintf(lang{59}, exec_time), 'k');
set(handles.root, 'pointer', 'arrow');
set_lang_string(handles.start_button, lang{42}, 'string');
disp_info(handles, lang, lang{63}, {lang{64}; sprintf(lang{92}, exec_time)});

% Enable buttons
set(handles.view_sol_plot, 'Enable', 'on');
set(handles.export_results, 'Enable', 'on');
set(handles.start_button, 'Enable', 'on');

% Store data
setappdata(handles.root, 'n_iter', niter);
setappdata(handles.root, 'max_iter_sol', maxiter);
setappdata(handles.root, 'vr_iter', vr_iter);
setappdata(handles.root, 'vp_iter', vp_iter);
setappdata(handles.root, 'vs_iter', vs_iter);
setappdata(handles.root, 'dns_iter', dns_iter);
setappdata(handles.root, 'thk_sol', thk);
setappdata(handles.root, 'vs_sol', vs);
setappdata(handles.root, 'vp_sol', vp);
setappdata(handles.root, 'dns_sol', dns);

% Set solution status to OK
setappdata(handles.root, 'solution_ok', true);

end

