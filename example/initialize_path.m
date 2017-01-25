function initialize_path
% INITIALIZE PATH
% This function initialize path, adding the following folders:
%   (1) Parent folder
%   (2) bin: It contains principal functions of mat_inverse (except GUI
%   related files
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

% Add bin, and gui to path from folder (recursive)
PATH_DEPTH = 3;

for i=1:PATH_DEPTH

    try
        path_str = '';
        if i~=1
            for j=1:i-1
                path_str = strcat(path_str, '../');
            end
        end
        path_bin = cd(cd(strcat(path_str, 'bin')));
        addpath(path_bin);
        return
        
    catch Exception
        
        % Folders could not be found
        if i==PATH_DEPTH
            fprintf(getReport(Exception));
            error('Error while setting software path.');
        end
        
    end
end

end