function export_results(handles, hObject, lang)
% EXPORT RESULTS
% This function export all results into an Excel file.
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
export_extension = strcat('*', export_extension); %#ok<*NODEF>

% Get solution status
solution_status = getappdata(handles.root, 'solution_ok');
set_status(handles, lang{105});

% Check if solution is ok
if ~ solution_status
    disp_error(handles, lang, 65);
    return
end

% Request name of new export file
[file, path] = uiputfile({export_extension, lang{106}}, lang{107});

% Check if filename is valid
if length(file) == 1 && length(path) == 1
    disp_error(handles, lang, 108);
    return
end

% Export data
try
 
    % Set status
    pause(0.1);
    set(handles.root, 'pointer', 'watch');
    guidata(hObject, handles);
 
    % Create export filename
    filename = strcat(path, file);
 
    % Get solution from app
    niter = getappdata(handles.root, 'n_iter');
    vr_iter = getappdata(handles.root, 'vr_iter');
    vp_iter = getappdata(handles.root, 'vp_iter');
    vs_iter = getappdata(handles.root, 'vs_iter');
    dns_iter = getappdata(handles.root, 'dns_iter');
    freq_iter = getappdata(handles.root, 'disp_freq');
    thk_sol = getappdata(handles.root, 'thk_sol');
 
    % Get data length
    n = size(vs_iter, 1);
    m = size(vs_iter, 2);
    nfreq = length(freq_iter);
    nthk = length(thk_sol);
 
    % Create cell structure
    thk = cell(nthk + 1, 1);
    vs = cell(n + 1, 1);
    vp = cell(n + 1, 1);
    rho = cell(n + 1, 1);
    freq = cell(nfreq + 1, 1);
    vr = cell(nfreq + 1, 1);
    vs_i = cell(n + 1, m + 1);
    itert = cell(1, 1);
 
    % Set head of cells
    thk{1} = lang{110};
    vr{1} = lang{111};
    vs{1} = lang{112};
    vp{1} = lang{113};
    freq{1} = lang{114};
    rho{1} = lang{115};
    itert{1} = lang{116};
 
    % Store data on cell structure
    for i = 1:nthk
        thk{i + 1} = thk_sol(i);
    end
    for i = 1:n
        vs{i + 1} = vs_iter(i, niter);
        vp{i + 1} = vp_iter(i, niter);
        rho{i + 1} = dns_iter(i, niter);
    end
    for i = 1:nfreq
        freq{i + 1} = freq_iter(i);
        vr{i + 1} = vr_iter(i, niter);
    end
    for i = 1:m
        vs_i{1, i} = i;
    end
    for i = 1:n
        for j = 1:m
            vs_i{i + 1, j} = vs_iter(i, j);
        end
    end
 
    % Save data - sheet 1 (final solution)
    xlswrite(filename, vs, 1, 'B');
    xlswrite(filename, vp, 1, 'C');
    xlswrite(filename, rho, 1, 'D');
    xlswrite(filename, thk, 1, 'A');
 
    % Save data - sheet 2 (fr / vr)
    xlswrite(filename, vr, 2, 'B');
    xlswrite(filename, freq, 2, 'A');
 
    % Save data - sheed 3 (vs / iteration)
    xlswrite(filename, vs_i, 3, 'B');
    xlswrite(filename, itert, 3, 'A');
 
    % Set status
    set(handles.root, 'pointer', 'arrow');
    set_status(handles, lang{117});
    disp_info(handles, lang, lang{63}, {lang{117}});
 
catch Exception
 
    % Get Exception report
    msg_error = getReport(Exception, 'basic', 'hyperlinks', 'off');
    if getappdata(handles.root, 'gui_sound')
        beep();
    end
 
    % Display errors / set statuses
    set_status(handles, lang{109}, 'r');
    errordlg(msg_error, lang{61});
    set(handles.root, 'pointer', 'arrow');
    return
 
end

end