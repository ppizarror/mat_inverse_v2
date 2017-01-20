function status = check_inv_parameters(handles, lang, edition)
% CHECK INVERSE PARAMETERS
% This function checks that all inverse parameters (mu, sigma, max_iter
% and tol_vs) are numbers, if not then a popup is displayed on screen.
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

% Get data
inv_sigma = get(handles.param_inv_sigma, 'string');
inv_mu = get(handles.param_inv_mu, 'string');
inv_maxiter = get(handles.param_maxiter, 'string');
inv_tol_vs = get(handles.param_tolvs, 'string');

% Get configuration
del_invalid = getappdata(handles.root, 'delete_entry_if_invalid');

% Check sigma
if isempty(inv_sigma) && ~ edition
    set_status(handles, sprintf(lang{46}, 'sigma'), 'r');
    errordlg(sprintf(lang{46}, 'sigma'), lang{23});
end
if ~ all(ismember(inv_sigma, '0123456789+-.eE'))
    set_status(handles, sprintf(lang{47}, 'sigma'), 'r');
    errordlg(sprintf(lang{47}, 'sigma'), lang{23});
    
    % Set sigma to empty
    if del_invalid
        set(handles.param_inv_sigma, 'string', '');
    end
    return
end

% Check mu
if isempty(inv_mu) && ~ edition
    set_status(handles, sprintf(lang{46}, 'mu'), 'r');
    errordlg(sprintf(lang{46}, 'mu'), lang{23});
end
if ~ all(ismember(inv_mu, '0123456789+-.eE'))
    set_status(handles, sprintf(lang{47}, 'mu'), 'r');
    errordlg(sprintf(lang{47}, 'mu'), lang{23});
    
    % Set mu to empty
    if del_invalid
        set(handles.param_inv_mu, 'string', '');
    end
    return
end

% Check max_iter
if isempty(inv_maxiter) && ~ edition
    set_status(handles, sprintf(lang{46}, 'max_iter'), 'r');
    errordlg(sprintf(lang{46}, 'max_iter'), lang{23});
end
if ~ all(ismember(inv_maxiter, '0123456789+-.eE'))
    set_status(handles, sprintf(lang{47}, 'max_iter'), 'r');
    errordlg(sprintf(lang{47}, 'max_iter'), lang{23});
    
    % Set max_iter to empty
    if del_invalid
        set(handles.param_maxiter, 'string', '');
    end
    return
end

% Check tol_vs
if isempty(inv_tol_vs) && ~ edition
    set_status(handles, sprintf(lang{46}, 'tol_vs'), 'r');
    errordlg(sprintf(lang{46}, 'tol_vs'), lang{23});
end
if ~ all(ismember(inv_tol_vs, '0123456789+-.eE'))
    set_status(handles, sprintf(lang{47}, 'tol_vs'), 'r');
    errordlg(sprintf(lang{47}, 'tol_vs'), lang{23});
    
    % Set tol_vs to empty
    if del_invalid
        set(handles.param_tolvs, 'string', '');
    end
    return
end

% All checks passed
status = true;

end