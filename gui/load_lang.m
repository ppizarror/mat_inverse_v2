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
lang_entries = 40;

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

list{4, 1} = 'Importar tabla desde Excel';
list{4, 2} = 'Import table from Excel';

list{5, 1} = 'Escoja un archivo desde Excel.';
list{5, 2} = 'Please select an Excel file.';

list{6, 1} = 'Info: Importación desde Excel cancelada.';
list{6, 2} = 'Info: Excel importing cancelled by user.';

list{7, 1} = 'Error: Archivo inválido, sólo deben existir 4 columnas (encontradas %d).';
list{7, 2} = 'Error: Invalid file, only 4 columns should exist (%d found).';

list{8, 1} = 'Cargando ...';
list{8, 2} = 'Loading ...';

list{9, 1} = 'Error: El último valor de H debe estar vacío o no ser un dígito (se encontró %s).';
list{9, 2} = 'Error: Last value from H row must be empty or be non numerical (%s found).';

list{10, 1} = 'Info: Importación desde Excel exitosa.';
list{10, 2} = 'Info: Successful importation from Excel file.';

list{11, 1} = 'Archivo';
list{11, 2} = 'File';

list{12, 1} = 'Nuevo...';
list{12, 2} = 'New...';

list{13, 1} = 'Cargar';
list{13, 2} = 'Load';

list{14, 1} = 'Limpiar tabla de solución inicial';
list{14, 2} = 'Clear initial solution table';

list{15, 1} = 'Solución inicial';
list{15, 2} = 'Initial solution';

list{16, 1} = 'Edición';
list{16, 2} = 'Edit';

list{17, 1} = 'Ayuda';
list{17, 2} = 'Help';

list{18, 1} = 'Ver la ayuda';
list{18, 2} = 'View Help';

list{19, 1} = 'Acerca de';
list{19, 2} = 'About';

list{20, 1} = 'Guardar';
list{20, 2} = 'Save';

list{21, 1} = 'Guardar como...';
list{21, 2} = 'Save as...';

list{22, 1} = 'Salir';
list{22, 2} = 'Exit';
% --------------------------------------------------------------------

% Create list of choise
langlist = cell(lang_entries, 1);
for j = 1:lang_entries
    langlist{j} = list{j, langid};
end
end