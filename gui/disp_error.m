function disp_error(handles, lang, errnumber, repl)
% DISP ERROR
% This function displays an error on a pop-up.
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

% Message error on status bar
msg_err = lang{errnumber};

% Message error on pop-up
msg_ppup = strrep(msg_err, lang{53}, ''); % Error
msg_ppup = strrep(msg_ppup, lang{54}, ''); % Info

% Trigger error sound if enabled by app configuration
if getappdata(handles.root, 'gui_sound')
    beep();
end

% No sprintf method
if ~exist('repl', 'var')
    set_status(handles, msg_err, 'r');
    errordlg(msg_ppup, lang{23});
    
    % Sprintf method
else
    set_status(handles, sprintf(msg_err, repl), 'r');
    errordlg(sprintf(msg_ppup, repl), lang{23});
end

% Normal cursor
set(handles.root, 'pointer', 'arrow');

end

