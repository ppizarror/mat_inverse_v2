function set_app_title(handles, lang)
% SET APP TITLE
% This function set the app title with the actual project name
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

% If project not saved then default name is used
if strcmp(getappdata(handles.root, 'project_savefile_short'), '')
    appname = lang{91};
else
    appname = getappdata(handles.root, 'project_savefile_short');
end

% Removes extension from appname
appname = strrep(appname, savefile_extension, '');

set(handles.root, 'Name', sprintf(lang{90}, appname));

end

