function status = close_app(handles, lang)
% CLOSE
% This function asks user when closing software.
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
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,
% USA.

% Set beep sound
if getappdata(handles.root, 'gui_sound')
    beep();
end
choice = questdlg(lang{95}, lang{22}, lang{74}, lang{75}, lang{74});
switch choice
    case lang{74}
        status = true;
    case lang{75} 
        status = false;
end

end