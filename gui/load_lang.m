% LOAD LANG
% Set lang list of string entries
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

function langlist = load_lang(langid)
% Return lang list related to an id of choise

% Total of entries in list
lang_entries = 20;

% Total of avaiable languages
%   1:  Spanish (Español)
%   2:  English (United States)
lang_avaiable_languages = 2;

% Check if langid is valid
if ~ (1 <= langid && langid <= lang_avaiable_languages)
    error('Invalid langid');
end

% Create a list of data
list = cell(lang_entries, 1);
for j = 1:lang_entries
    list{j} = cell(1, lang_avaiable_languages);
end

% ----Add lang strings
%
list{1, 1} = 'Añadir nueva fila';
list{1, 2} = 'Add new row';

list{2, 1} = 'Eliminar última fila';
list{2, 2} = 'Delete last row';

list{3, 1} = 'Error: No se puede eliminar la fila.';
list{3, 2} = 'Error: Last row cant be deleted.';
% --------------------------------------------------------------------

% Create list of choise
langlist = cell(lang_entries, 1);
for j = 1:lang_entries
    langlist{j} = list{j, langid};
end
end