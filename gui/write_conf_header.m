function write_conf_header(file, title, description)
% WRITE CONF HEADER
% This function writes header on a file.
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

title = strcat('%', title);
description = strcat('%', description);

fprintf(file, '%s\n', title);
fprintf(file, '%s\n', description);
fprintf(file, '%s\n', '%');
fprintf(file, '%s\n', '% Author: Pablo Pizarro @ppizarror.com, 2017.');
fprintf(file, '%s\n', '%');
fprintf(file, '%s\n', '% This program is free software; you can redistribute it and/or');
fprintf(file, '%s\n', '% modify it under the terms of the GNU General Public License');
fprintf(file, '%s\n', '% as published by the Free Software Foundation; either version 2');
fprintf(file, '%s\n', '% of the License, or (at your option) any later version.');
fprintf(file, '%s\n', '%');
fprintf(file, '%s\n', '% This program is distributed in the hope that it will be useful,');
fprintf(file, '%s\n', '% but WITHOUT ANY WARRANTY; without even the implied warranty of');
fprintf(file, '%s\n', '% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the');
fprintf(file, '%s\n', '% GNU General Public License for more details.');
fprintf(file, '%s\n', '%');
fprintf(file, '%s\n', '% You should have received a copy of the GNU General Public License');
fprintf(file, '%s\n', '% along with this program; if not, write to the Free Software');
fprintf(file, '%s\n\n', '% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.');

end

