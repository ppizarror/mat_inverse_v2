function disp_info(handles, lang, title, message)
% DISP INFO
% This function displays an info on a pop-up.
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

% Removes info from message
n = length(message);
for i=1:n
    message{i}=strrep(message{i}, lang{54}, '');
end

% Create messagebox
msgbox(message, title, 'help');

% Trigger error sound if enabled by app configuration
if getappdata(handles.root, 'gui_sound')
    beep();
end

end

