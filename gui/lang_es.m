function list = lang_es()
% LANG ES
% Spanish language strings.
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

% Create a list of data
list = cell(lang_entries, 1);

% --------------------------------------------------------------------
list{1} = 'Añadir nueva fila';
list{2} = 'Eliminar última fila';
list{3} = 'Error: No se puede eliminar la fila.';
list{4} = 'Importar tabla de estimación incial';
list{5} = 'Escoja un archivo Excel';
list{6} = 'Info: Importación desde Excel cancelada.';
list{7} = 'Error: Archivo inválido, sólo deben existir 4 columnas (encontradas %d).';
list{8} = 'Cargando ...';
list{9} = 'Error: El último valor de H debe estar vacío o no ser un dígito (se encontró %s).';
list{10} = 'Info: Importación desde Excel exitosa.';
list{11} = 'Archivo';
list{12} = 'Nuevo...';
list{13} = 'Cargar';
list{14} = 'Limpiar tabla de estimación inicial';
list{15} = 'Estimación inicial';
list{16} = 'Edición';
list{17} = 'Ayuda';
list{18} = 'Ver el Manual';
list{19} = 'Acerca de';
list{20} = 'Guardar';
list{21} = 'Guardar como...';
list{22} = 'Salir';
list{23} = 'Error';
list{24} = 'Ha ocurrido un error al cargar el archivo, compruebe que posee los privilegios de adminsitrador o el archivo no esté corrupto.';
list{25} = 'Error: No se pudo cargar el archivo.';
list{26} = 'Info: Ha sido borrada la tabla de estimación inicial.';
list{27} = 'Autor: Pablo Pizarro @ppizarror.com, 2017.';
list{28} = 'Agradecimientos a: Felipe Ochoa.';
list{29} = 'Código en Matlab para la inversión de la velocidad de fase de una onda Raylegh. Construido inicialmente a partir de las librerias mat_inverse y mat_disperse.';
list{30} = 'Sitio web: https://github.com/ppizarror/mat_inverse_v2';
list{31} = 'Archivo de dispersión (Vr vs f)';
list{32} = 'Abrir (Excel)';
list{33} = 'Info: Carga de la curva de dispersión desde Excel cancelada.';
list{34} = 'Error: El archivo de dispersión debe tener sólo 2 columnas (frecuencia y velocidad de fase).';
list{35} = 'Info: Curva de dispersión cargada de forma exitosa.';
list{36} = 'Ampliar gráfico';
list{37} = 'Frecuencia $(Hz)$';
list{38} = 'Curva de Dispersión Experimental';
list{39} = 'Velocidad de Fase $(%s)$';
list{40} = 'Unidades';
list{41} = 'Version del Software: %s';
list{42} = 'Iniciar';
list{43} = 'Ver gráficos';
list{44} = 'Exportar resultados';
list{45} = 'Parámetros para la inversión';
list{46} = 'Error: El parámetro %s no puede estar vacío.';
list{47} = 'Error: El parámetro %s debe ser un número.';
list{48} = 'Info: Iniciando inversión ...';
list{49} = 'Info: Comprobando validez del input.';
list{50} = 'Error: La curva de dispersión no ha sido cargada aún, imposible continuar.';
list{51} = 'Error: La tabla de estimación inicial no es válida, imposible continuar.';
list{52} = 'Error: La segunda, tercera y cuarta columna de la tabla de estimación inicial deben tener igual número de datos.';
list{53} = 'Error: ';
list{54} = 'Info: ';
list{55} = 'Error: La tabla de estimación inicial está vacía.';
list{56} = 'Error: La tabla de estimación inicial no puede tener sólo 1 fila.';
list{57} = 'Calculando ...';
list{58} = 'Iteración %d/%d';
list{59} = 'Info: Proceso terminado exitosamente, tiempo de ejecución: %.1fs.';
list{60} = 'Ocurrió una excepción al ejecutar mat_inverse';
list{61} = 'Error fatal!';
list{62} = 'Espere ...';
list{63} = 'Proceso terminado';
list{64} = 'El proceso de inversión ha sido completado de forma exitosa.';
list{65} = 'Error: Solución no calculada aún!';
list{66} = 'Curva de Dispersión Calculada v/s Experimental';
list{67} = 'Curva de dispersión experimental';
list{68} = 'Curva de dispersión inversa';
list{69} = 'Perfil de Velocidad de Corte';
list{70} = 'Velocidad de onda de corte $V_s$ $(%s)$';
list{71} = 'Profundidad $(%s)$';
list{72} = 'Valor inverso';
list{73} = 'Crear un nuevo proyecto?';
list{74} = 'Si';
list{75} = 'No';
list{76} = 'Crear un nuevo proyecto';
list{77} = 'Guardar proyecto como';
list{78} = 'Proyecto de mat_inverse (*.invprj)';
list{79} = 'Error: El proyecto no ha sido guardado.';
list{80} = 'Ingrese el nombre y la ubicación del nuevo proyecto';
list{81} = 'Escoja el archivo del proyecto a cargar';
list{82} = 'Cargar proyecto';
list{83} = 'Error: No se ha cargado el proyecto';
list{84} = 'Info: Ocurrió una excepción al cargar el proyecto.';
list{85} = 'Archivos Excel (*.xlsx, *.xls)';
list{86} = 'Cargando proyecto...';
list{87} = 'Info: El proyecto ha sido cargado exitosamente.';
list{88} = 'Info: Ocurrió una exepción al guardar el actual proyecto.';
list{89} = 'Info: Proyecto guardado exitosamente.';
list{90} = '%s - Mat inverse v2';
list{91} = 'proyecto1';
list{92} = 'Tiempo total de ejecución: %.1fs';
list{93} = 'No se encontró el archivo de dispersión ''%s''';
list{94} = 'Info: Proyecto cargado, errores: %d.';
list{95} = 'Desea salir?';
list{96} = 'Creando gráficos...';
list{97} = 'Info: Gráficos creados correctamente.';
list{98} = 'Error: Ocurrió un error al generar la curva de dispersión experimental.';
list{99} = 'Error: Ocurrió un error al generar el perfil de la velocidad de corte.';
list{100} = 'Desea borrar la tabla de estimación inicial?';
list{101} = 'Limpiar tabla';
list{102} = 'Variación de la curva de dispersión en función de las iteraciones';
list{103} = 'Error: Ocurrió un error al generar la curva de dispersión en función de las iteraciones.';
list{104} = 'Iteración %d';
list{105} = 'Exportando resultados...';
list{106} = 'Archivos Excel (*.xls)';
list{107} = 'Exportar proyecto como';
list{108} = 'Error: Los resultados no han sido exportados.';
list{109} = 'Info: Ocurrió una excepción al exportar los resultados.';
list{110} = 'H';
list{111} = 'VR';
list{112} = 'VS';
list{113} = 'VP';
list{114} = 'FREQ';
list{115} = 'RHO';
list{116} = 'ITERACIÓN';
list{117} = 'Info: Resultados exportados exitosamente.';
list{118} = 'Importar archivos';
list{119} = 'Importar archivo de dispersión';
list{120} = 'Limpiar parámetros de inversión';
list{121} = 'Preferencias';
list{122} = 'Configuración de la app';
list{123} = 'Idioma';
list{124} = 'Activar sonidos';
list{125} = 'Eliminar automáticamente datos incorrectos';
list{126} = 'Configuración guardada';
list{127} = 'Debe reiniciar la aplicación para que los cambios surtan efecto';
list{128} = 'Error: El directorio gui no existe, no se puede cargar la configuración.';
list{129} = '';
list{130} = '';
% --------------------------------------------------------------------

end

