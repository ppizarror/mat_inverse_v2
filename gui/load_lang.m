function langlist = load_lang(langid)
% LOAD LANG
% Set lang list of string entries.
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
list{6, 2} = 'Info: Excel import cancelled by user.';

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

list{23, 1} = 'Error';
list{23, 2} = 'Error';

list{24, 1} = 'Ha ocurrido un error al cargar el archivo, compruebe que posee los privilegios de adminsitrador o el archivo no esté corrupto.';
list{24, 2} = 'An error has occurred while opening the file, check your administrator privileges or check if file is not corrupt.';

list{25, 1} = 'Error: No se pudo cargar el archivo';
list{25, 2} = 'Error: File could not be loaded';

list{26, 1} = 'Info: Ha sido borrada la tabla de solución inicial.';
list{26, 2} = 'Info: Initial table has been succesfully cleaned.';

list{27, 1} = 'Autor: Pablo Pizarro @ppizarror.com, 2017.';
list{27, 2} = 'Author: Pablo Pizarro @ppizarror.com, 2017.';

list{28, 1} = 'Agradecimientos a: Felipe Ochoa.';
list{28, 2} = 'Acknowledgments to: Felipe Ochoa.';

list{29, 1} = 'Código en Matlab para la inversión de la velocidad de fase de una onda Raylegh. Construido inicialmente a partir de las librerias mat_inverse y mat_disperse.';
list{29, 2} = 'Matlab code for inversion of Rayleigh phase velocity. Initially built from mat_inverse and mat_disperse matlab libraries.';

list{30, 1} = 'Sitio web: https://github.com/ppizarror/mat_inverse_v2';
list{30, 2} = 'Website: https://github.com/ppizarror/mat_inverse_v2';

list{31, 1} = 'Archivo de dispersión (Vr vs f)';
list{31, 2} = 'Dispertion file (Vr vs f)';

list{32, 1} = 'Abrir (Excel)';
list{32, 2} = 'Open (Excel)';

list{33, 1} = 'Info: Carga de la curva de dispersión desde Excel cancelada.';
list{33, 2} = 'Info: Excel dispertion curve data import cancelled by user.';

list{34, 1} = 'Error: El archivo de dispersión debe tener sólo 2 columnas (frecuencia y velocidad de fase).';
list{34, 2} = 'Error: Dispertion file must have only 2 columns (frecuency and phase velocity).';

list{35, 1} = 'Info: Curva de dispersión cargada de forma exitosa.';
list{35, 2} = 'Info: Dispertion curve loaded successfuly.';

list{36, 1} = 'Ampliar gráfico';
list{36, 2} = 'View bigger plot';

list{37, 1} = 'Frecuencia $(Hz)$';
list{37, 2} = 'Frequency $(Hz)$';

list{38, 1} = 'Curva de Dispersión Experimental';
list{38, 2} = 'Experimental Dipertion Curve';

list{39, 1} = 'Velocidad de Fase $(%s)$';
list{39, 2} = 'Phase Velocity $(%s)$';

list{40, 1} = 'Unidades';
list{40, 2} = 'Units';

list{41, 1} = 'Version del Software: %s';
list{41, 2} = 'Software version: %s';

list{42, 1} = 'Iniciar';
list{42, 2} = 'Start';

list{43, 1} = 'Ver gráficos';
list{43, 2} = 'See plots';

list{44, 1} = 'Exportar resultados';
list{44, 2} = 'Export results';

list{45, 1} = 'Parámetros para la inversión';
list{45, 2} = 'Inversion parameters';

list{46, 1} = '';
list{46, 2} = '';

list{47, 1} = '';
list{47, 2} = '';

list{48, 1} = '';
list{48, 2} = '';

list{49, 1} = '';
list{49, 2} = '';

list{50, 1} = '';
list{50, 2} = '';

list{51, 1} = '';
list{51, 2} = '';

list{52, 1} = '';
list{52, 2} = '';

list{53, 1} = '';
list{53, 2} = '';

list{54, 1} = '';
list{54, 2} = '';

list{55, 1} = '';
list{55, 2} = '';

list{56, 1} = '';
list{56, 2} = '';

list{57, 1} = '';
list{57, 2} = '';

list{58, 1} = '';
list{58, 2} = '';

list{59, 1} = '';
list{59, 2} = '';

list{60, 1} = '';
list{60, 2} = '';

% --------------------------------------------------------------------

% Create list of choise
langlist = cell(lang_entries, 1);
for j = 1:lang_entries
    langlist{j} = list{j, langid};
end
end