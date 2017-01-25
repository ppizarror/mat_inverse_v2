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
list{1, 3} = 'Ajouter nouvelle ligne';

list{2, 1} = 'Eliminar última fila';
list{2, 2} = 'Delete last row';
list{2, 3} = 'Supprimer la ligne';

list{3, 1} = 'Error: No se puede eliminar la fila.';
list{3, 2} = 'Error: Last row cant be deleted.';
list{3, 3} = 'Erreur: Impossible de supprimer la ligne.';

list{4, 1} = 'Importar tabla desde Excel';
list{4, 2} = 'Import table from Excel';
list{4, 3} = 'Importer le tableau à partir d''Excel';

list{5, 1} = 'Escoja un archivo Excel';
list{5, 2} = 'Please select an Excel file';
list{5, 3} = 'Veuillez sélectionner un fichier Excel';

list{6, 1} = 'Info: Importación desde Excel cancelada.';
list{6, 2} = 'Info: Excel import cancelled by user.';
list{6, 3} = 'Info: Importation Excel annulée par l''utilisateur.';

list{7, 1} = 'Error: Archivo inválido, sólo deben existir 4 columnas (encontradas %d).';
list{7, 2} = 'Error: Invalid file, only 4 columns should exist (%d found).';
list{7, 3} = 'Erreur: fichier non valide doit exister seulement 4 colonnes (il a trouvé %d).';

list{8, 1} = 'Cargando ...';
list{8, 2} = 'Loading ...';
list{8, 3} = 'Chargement en cours ...';

list{9, 1} = 'Error: El último valor de H debe estar vacío o no ser un dígito (se encontró %s).';
list{9, 2} = 'Error: Last value from H row must be empty or be non numerical (%s found).';
list{9, 3} = 'Erreur: La dernière valeur de H doit être vide ou ne peut pas être un chiffre (il a trouvé %s).';

list{10, 1} = 'Info: Importación desde Excel exitosa.';
list{10, 2} = 'Info: Successful importation from Excel file.';
list{10, 3} = 'Info: Importer à partir d''Excel réussie.';

list{11, 1} = 'Archivo';
list{11, 2} = 'File';
list{11, 3} = 'Fichier';

list{12, 1} = 'Nuevo...';
list{12, 2} = 'New...';
list{12, 3} = 'Nouveau...';

list{13, 1} = 'Cargar';
list{13, 2} = 'Load';
list{13, 3} = 'Charge';

list{14, 1} = 'Limpiar tabla de estimación inicial';
list{14, 2} = 'Clear initial guess table';
list{14, 3} = 'Effacer la table initiale';

list{15, 1} = 'Estimación inicial';
list{15, 2} = 'Initial guess';
list{15, 3} = 'Estimation initiale';

list{16, 1} = 'Edición';
list{16, 2} = 'Edit';
list{16, 3} = 'Édition';

list{17, 1} = 'Ayuda';
list{17, 2} = 'Help';
list{17, 3} = 'Aider';

list{18, 1} = 'Ver la ayuda';
list{18, 2} = 'View Help';
list{18, 3} = 'Voir Aide';

list{19, 1} = 'Acerca de';
list{19, 2} = 'About';
list{19, 3} = 'À propos de';

list{20, 1} = 'Guardar';
list{20, 2} = 'Save';
list{20, 3} = 'Garder';

list{21, 1} = 'Guardar como...';
list{21, 2} = 'Save as...';
list{21, 3} = 'Enregistrer sous...';

list{22, 1} = 'Salir';
list{22, 2} = 'Exit';
list{22, 3} = 'Sortir';

list{23, 1} = 'Error';
list{23, 2} = 'Error';
list{23, 3} = 'Erreur';

list{24, 1} = 'Ha ocurrido un error al cargar el archivo, compruebe que posee los privilegios de adminsitrador o el archivo no esté corrupto.';
list{24, 2} = 'An error has occurred while opening the file, check your administrator privileges or check if file is not corrupt.';
list{24, 3} = 'Une erreur du chargement du fichier a eu lieu, vérifiez que possède les privilèges d''administrateur du conseil d''administration ou le fichier est pas corrompu.';

list{25, 1} = 'Error: No se pudo cargar el archivo.';
list{25, 2} = 'Error: File could not be loaded.';
list{25, 3} = 'Erreur: Impossible de charger le fichier.';

list{26, 1} = 'Info: Ha sido borrada la tabla de estimación inicial.';
list{26, 2} = 'Info: Initial guess table has been successfully cleaned.';
list{26, 3} = 'Info: La table de prévision initiale a été correctement nettoyée.';

list{27, 1} = 'Autor: Pablo Pizarro @ppizarror.com, 2017.';
list{27, 2} = 'Author: Pablo Pizarro @ppizarror.com, 2017.';
list{27, 3} = 'Auteur: Pablo Pizarro @ ppizarror.com, 2017.';

list{28, 1} = 'Agradecimientos a: Felipe Ochoa.';
list{28, 2} = 'Acknowledgments to: Felipe Ochoa.';
list{28, 3} = 'Merci à: Felipe Ochoa.';

list{29, 1} = 'Código en Matlab para la inversión de la velocidad de fase de una onda Raylegh. Construido inicialmente a partir de las librerias mat_inverse y mat_disperse.';
list{29, 2} = 'Matlab code for inversion of Rayleigh phase velocity. Initially built from mat_inverse and mat_disperse matlab libraries.';
list{29, 3} = 'Code Matlab pour inverser la vitesse de phase de l''onde Raylegh. initialement construit à partir de bibliothèques mat_inverse et mat_disperse.';

list{30, 1} = 'Sitio web: https://github.com/ppizarror/mat_inverse_v2';
list{30, 2} = 'Website: https://github.com/ppizarror/mat_inverse_v2';
list{30, 3} = 'Website: https://github.com/ppizarror/mat_inverse_v2';

list{31, 1} = 'Archivo de dispersión (Vr vs f)';
list{31, 2} = 'Dispersion file (Vr vs f)';
list{31, 3} = 'Fichier de dispersion (Vr vs f)';

list{32, 1} = 'Abrir (Excel)';
list{32, 2} = 'Open (Excel)';
list{32, 3} = 'Ouvrir (Excel)';

list{33, 1} = 'Info: Carga de la curva de dispersión desde Excel cancelada.';
list{33, 2} = 'Info: Excel dispersion curve data import cancelled by user.';
list{33, 3} = 'Info: l''importation des données de la courbe de dispersion Excel est annulée par l''utilisateur.';

list{34, 1} = 'Error: El archivo de dispersión debe tener sólo 2 columnas (frecuencia y velocidad de fase).';
list{34, 2} = 'Error: Dispersion file must have only 2 columns (frequency and phase velocity).';
list{34, 3} = 'Erreur: Le fichier de dispersion doit avoir seulement 2 colonnes (fréquence et vitesse de phase).';

list{35, 1} = 'Info: Curva de dispersión cargada de forma exitosa.';
list{35, 2} = 'Info: Dispersion curve loaded successfully.';
list{35, 3} = 'Info: Courbe de dispersion chargée avec succès.';

list{36, 1} = 'Ampliar gráfico';
list{36, 2} = 'View bigger plot';
list{36, 3} = 'grandir le plan';

list{37, 1} = 'Frecuencia $(Hz)$';
list{37, 2} = 'Frequency $(Hz)$';
list{37, 3} = 'Fréquence $(Hz)$';

list{38, 1} = 'Curva de Dispersión Experimental';
list{38, 2} = 'Experimental Dispersion Curve';
list{38, 3} = 'Courbe expérimentale de dispersion';

list{39, 1} = 'Velocidad de Fase $(%s)$';
list{39, 2} = 'Phase Velocity $(%s)$';
list{39, 3} = 'Vitesse de phase $(%s)$';

list{40, 1} = 'Unidades';
list{40, 2} = 'Units';
list{40, 3} = 'Unités';

list{41, 1} = 'Version del Software: %s';
list{41, 2} = 'Software version: %s';
list{41, 3} = 'Version du logiciel: %s';

list{42, 1} = 'Iniciar';
list{42, 2} = 'Start';
list{42, 3} = 'Démarrer';

list{43, 1} = 'Ver gráficos';
list{43, 2} = 'See plots';
list{43, 3} = 'Voir parcelles';

list{44, 1} = 'Exportar resultados';
list{44, 2} = 'Export results';
list{44, 3} = 'Exporter les résultats';

list{45, 1} = 'Parámetros para la inversión';
list{45, 2} = 'Inversion parameters';
list{45, 3} = 'Paramètres d''inversion';

list{46, 1} = 'Error: El parámetro %s no puede estar vacío.';
list{46, 2} = 'Error: Parameter %s cannot be empty.';
list{46, 3} = 'Erreur: Le paramètre %s ne peut pas être vide.';

list{47, 1} = 'Error: El parámetro %s debe ser un número.';
list{47, 2} = 'Error: Parameter %s must be a number.';
list{47, 3} = 'Erreur: Le paramètre %s doit être un nombre.';

list{48, 1} = 'Info: Iniciando inversión ...';
list{48, 2} = 'Info: Starting inversion ...';
list{48, 3} = 'Info: Starting inversion ...';

list{49, 1} = 'Info: Comprobando validez del input.';
list{49, 2} = 'Info: Validating input.';
list{49, 3} = 'Info: Validation de l''entrée.';

list{50, 1} = 'Error: La curva de dispersión no ha sido cargada aún, imposible continuar.';
list{50, 2} = 'Error: Dispersion curve has not been loaded yet, cannot continue.';
list{50, 3} = 'Erreur: la courbe de dispersion n''a pas encore été chargée, ne peut pas continuer.';

list{51, 1} = 'Error: La tabla de estimación inicial no es válida, imposible continuar.';
list{51, 2} = 'Error: Initial guess table is not valid, cannot continue.';
list{51, 3} = 'Erreur: la table de prévision initiale n''est pas valide, ne peut pas continuer.';

list{52, 1} = 'Error: La segunda, tercera y cuarta columna de la tabla de estimación inicial deben tener igual número de datos.';
list{52, 2} = 'Error: Second, Third and Fourth columns from initial guess table must have same size.';
list{52, 3} = 'Erreur: Les deuxième, troisième et quatrième colonnes de la table de prévision initiale doivent avoir la même taille.';

% This entry contains head of error messages, used to replace most of error
% string to be displayed on pop-ups
list{53, 1} = 'Error: ';
list{53, 2} = 'Error: ';
list{53, 3} = 'Erreur: ';

% This entry contains head of info messages, used to replace most of info
% string to be displayed on pop-ups
list{54, 1} = 'Info: ';
list{54, 2} = 'Info: ';
list{54, 3} = 'Info: ';

list{55, 1} = 'Error: La tabla de estimación inicial está vacía.';
list{55, 2} = 'Error: Initial guess table is empty.';
list{55, 3} = 'Erreur: la table de prévision initiale est vide.';

list{56, 1} = 'Error: La tabla de estimación inicial no puede tener sólo 1 fila.';
list{56, 2} = 'Error: Initial guess table can have only 1 row.';
list{56, 3} = 'Erreur: la table de prévision initiale ne peut avoir qu''une ligne.';

list{57, 1} = 'Calculando ...';
list{57, 2} = 'Processing ...';
list{57, 3} = 'En traitement ...';

list{58, 1} = 'Iteración %d/%d';
list{58, 2} = 'Iteration %d/%d';
list{58, 3} = 'Itération %d/%d';

list{59, 1} = 'Info: Proceso terminado exitosamente, tiempo de ejecución: %.1fs.';
list{59, 2} = 'Info: Process completed successfully, execution time: %.1fs.';
list{59, 3} = 'Info: Processus terminé avec succès, temps d''exécution: %.1fs.';

list{60, 1} = 'Ocurrió una excepción al ejecutar mat_inverse';
list{60, 2} = 'An Exception has occurred while running mat_inverse';
list{60, 3} = 'Une exception s''est produite lors de l''exécution de mat_inverse';

list{61, 1} = 'Error fatal!';
list{61, 2} = 'Fatal error!';
list{61, 3} = 'Erreur fatale!';

% String on start button
list{62, 1} = 'Espere ...';
list{62, 2} = 'Please wait';
list{62, 3} = 'Attente';

list{63, 1} = 'Proceso terminado';
list{63, 2} = 'Process completed';
list{63, 3} = 'Processus achevé';

list{64, 1} = 'El proceso de inversión ha sido completado de forma exitosa.';
list{64, 2} = 'Inversion process has been completed successfully.';
list{64, 3} = 'Le processus d''inversion a été mené à bien.';

list{65, 1} = 'Error: Solución no calculada aún!';
list{65, 2} = 'Error: Solution not solved yet!';
list{65, 3} = 'Erreur: Solution non résolue!';

list{66, 1} = 'Curva de Dispersión Calculada v/s Experimental';
list{66, 2} = 'Calculated Dispersion v/s Experimental Curve';
list{66, 3} = 'Dispersion Calculée v/s Courbe Expérimentale';

list{67, 1} = 'Curva de dispersión experimental';
list{67, 2} = 'Experimental dispersion curve';
list{67, 3} = 'Courbe expérimentale de dispersion';

list{68, 1} = 'Curva de dispersión inversa';
list{68, 2} = 'Inverse dispersion curve';
list{68, 3} = 'Courbe de dispersion inverse';

list{69, 1} = 'Perfil de Velocidad de Corte';
list{69, 2} = 'Shear Wave Velocity Profile';
list{69, 3} = 'Profil de vitesse de vague de cisaillement';

list{70, 1} = 'Velocidad de onda de corte $V_s$ $(%s)$';
list{70, 2} = 'Shear Wave Velocity $V_s$ $(%s)$';
list{70, 3} = 'Vélocité de la vague de cisaillement $V_s$ $(%s)$';

list{71, 1} = 'Profundidad $(%s)$';
list{71, 2} = 'Depth $(%s)$';
list{71, 3} = 'Profondeur $(%s)$';

list{72, 1} = 'Valor inverso';
list{72, 2} = 'Inverse value';
list{72, 3} = 'Valeur inverse';

list{73, 1} = 'Crear un nuevo proyecto?';
list{73, 2} = 'Do create a new project?';
list{73, 3} = 'Créez-vous un nouveau projet?';

list{74, 1} = 'Si';
list{74, 2} = 'Yes';
list{74, 3} = 'Oui';

list{75, 1} = 'No';
list{75, 2} = 'No';
list{75, 3} = 'Non';

list{76, 1} = 'Crear un nuevo proyecto';
list{76, 2} = 'Create a new project';
list{76, 3} = 'Créer un nouveau projet';

list{77, 1} = 'Guardar proyecto como';
list{77, 2} = 'Save project as';
list{77, 3} = 'Enregistrer le projet en tant que';

list{78, 1} = 'Proyecto de mat_inverse (*.invprj)';
list{78, 2} = 'Mat_inverse project (*.invprj)';
list{78, 3} = 'Projet mat_inverse (*.invprj)';

list{79, 1} = 'Error: El proyecto no ha sido guardado.';
list{79, 2} = 'Error: Project has not been saved.';
list{79, 3} = 'Erreur: Le projet n''a pas été enregistré.';

list{80, 1} = 'Ingrese el nombre y la ubicación del nuevo proyecto';
list{80, 2} = 'Choose name and disk location of the new project';
list{80, 3} = 'Choisir le nom et l''emplacement du disque du nouveau projet';

list{81, 1} = 'Escoja el archivo del proyecto a cargar';
list{81, 2} = 'Pick project file to load';
list{81, 3} = 'Sélectionner le fichier projet à charger';

list{82, 1} = 'Cargar proyecto';
list{82, 2} = 'Load project';
list{82, 3} = 'Charger le projet';

list{83, 1} = 'Error: No se ha cargado el proyecto';
list{83, 2} = 'Error: Project has not been loaded';
list{83, 3} = 'Erreur: le projet n''a pas été chargé';

list{84, 1} = 'Info: Ocurrió una excepción al cargar el proyecto.';
list{84, 2} = 'Info: An Exception has occurred while loading the project.';
list{84, 3} = 'Info: Une exception s''est produite lors du chargement du projet.';

list{85, 1} = 'Archivos Excel (*.xlsx, *.xls)';
list{85, 2} = 'Excel files (*.xlsx, *.xls)';
list{85, 3} = 'Fichiers Excel (*.xlsx, *.xls)';

list{86, 1} = 'Cargando proyecto...';
list{86, 2} = 'Loading project...';
list{86, 3} = 'Chargement du projet...';

list{87, 1} = 'Info: El proyecto ha sido cargado exitosamente.';
list{87, 2} = 'Info: Project has been loaded successfully.';
list{87, 3} = 'Info: Le projet a été chargé avec succès.';

list{88, 1} = 'Info: Ocurrió una exepción al guardar el actual proyecto.';
list{88, 2} = 'Info: An Exception has occurred while saving the actual project.';
list{88, 3} = 'Info: Une exception s''est produite lors de l''enregistrement du projet.';

list{89, 1} = 'Info: Proyecto guardado exitosamente.';
list{89, 2} = 'Info: Project saved successfully.';
list{89, 3} = 'Info: Projet enregistré avec succès.';

% Title of app
list{90, 1} = '%s - Mat inverse v2';
list{90, 2} = '%s - Mat inverse v2';
list{90, 3} = '%s - Mat inverse v2';

% Default name of project files
list{91, 1} = 'proyecto1';
list{91, 2} = 'project1';
list{91, 3} = 'projet1';

list{92, 1} = 'Tiempo total de ejecución: %.1fs';
list{92, 2} = 'Total execution time: %.1fs';
list{92, 3} = 'Temps d''exécution total: %.1fs';

list{93, 1} = 'No se encontró el archivo de dispersión ''%s''';
list{93, 2} = 'Dispersion file ''%s'' not found';
list{93, 3} = 'Fichier de dispersion ''%s'' introuvable';

list{94, 1} = 'Info: Proyecto cargado, errores: %d.';
list{94, 2} = 'Info: Project loaded, errors: %d.';
list{94, 3} = 'Info: Projet chargé, erreurs: %d.';

list{95, 1} = '';
list{95, 2} = '';
list{95, 3} = '';

list{96, 1} = '';
list{96, 2} = '';
list{96, 3} = '';

list{97, 1} = '';
list{97, 2} = '';
list{97, 3} = '';

list{98, 1} = '';
list{98, 2} = '';
list{98, 3} = '';

list{99, 1} = '';
list{99, 2} = '';
list{99, 3} = '';

list{100, 1} = '';
list{100, 2} = '';
list{100, 3} = '';

% --------------------------------------------------------------------

% Create list of choise
langlist = cell(lang_entries, 1);
for j = 1:lang_entries
    langlist{j} = list{j, langid};
end
end