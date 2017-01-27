function set_status(handles, status, color)
% SET STATUS
% This function set GUI's status.
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

% Write message
set(handles.status_console, 'string', status);

% Change foreground color
if ~ exist('color', 'var')
    % Default color
    color = [0, 0, 0];
else
    switch(color)
        case 'k'
            color = [0, 0, 0]; % Black
        case 'r'
            color = [1, 0, 0]; % Red
        case 'g'
            color = [0, 1, 0]; % Green
        case 'b'
            color = [0, 0, 1]; % Blue
        case 'm'
            color = [1, 0, 1]; % Magenta
        case 'y'
            color = [1, 1, 0]; % Yellow
        case 'c'
            color = [0, 1, 1]; % Cyan
    end
end

% Change status
set(handles.status_console, 'ForegroundColor', color);

end