function list = lang_en()
% LANG EN
% English language strings.
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
list{1} = 'Add new row';
list{2} = 'Delete last row';
list{3} = 'Error: Last row cant be deleted.';
list{4} = 'Import initial guess table';
list{5} = 'Please select an Excel file';
list{6} = 'Info: Excel import cancelled by user.';
list{7} = 'Error: Invalid file, only 4 columns should exist (%d found).';
list{8} = 'Loading ...';
list{9} = 'Error: Last value from H row must be empty or be non numerical (%s found).';
list{10} = 'Info: Successful importation from Excel file.';
list{11} = 'File';
list{12} = 'New...';
list{13} = 'Load';
list{14} = 'Clear initial guess table';
list{15} = 'Initial guess';
list{16} = 'Edit';
list{17} = 'Help';
list{18} = 'See Manual';
list{19} = 'About';
list{20} = 'Save';
list{21} = 'Save as...';
list{22} = 'Exit';
list{23} = 'Error';
list{24} = 'An error has occurred while opening the file, check your administrator privileges or check if file is not corrupt.';
list{25} = 'Error: File could not be loaded.';
list{26} = 'Info: Initial guess table has been successfully cleaned.';
list{27} = 'Author: Pablo Pizarro @ppizarror.com, 2017.';
list{28} = 'Acknowledgments to: Felipe Ochoa.';
list{29} = 'Matlab code for inversion of Rayleigh phase velocity. Initially built from mat_inverse and mat_disperse matlab libraries.';
list{30} = 'Website: https://github.com/ppizarror/mat_inverse_v2';
list{31} = 'Dispersion file (Vr vs f)';
list{32} = 'Open (Excel)';
list{33} = 'Info: Excel dispersion curve data import cancelled by user.';
list{34} = 'Error: Dispersion file must have only 2 columns (frequency and phase velocity).';
list{35} = 'Info: Dispersion curve loaded successfully.';
list{36} = 'View bigger plot';
list{37} = 'Frequency $(Hz)$';
list{38} = 'Experimental Dispersion Curve';
list{39} = 'Phase Velocity $(%s)$';
list{40} = 'Units';
list{41} = 'Software version: %s';
list{42} = 'Start';
list{43} = 'See plots';
list{44} = 'Export results';
list{45} = 'Inversion parameters';
list{46} = 'Error: Parameter %s cannot be empty.';
list{47} = 'Error: Parameter %s must be a number.';
list{48} = 'Info: Starting inversion ...';
list{49} = 'Info: Validating input.';
list{50} = 'Error: Dispersion curve has not been loaded yet, cannot continue.';
list{51} = 'Error: Initial guess table is not valid, cannot continue.';
list{52} = 'Error: Second, Third and Fourth columns from initial guess table must have same size.';
list{53} = 'Error: ';
list{54} = 'Info: ';
list{55} = 'Error: Initial guess table is empty.';
list{56} = 'Error: Initial guess table can have only 1 row.';
list{57} = 'Processing ...';
list{58} = 'Iteration %d/%d';
list{59} = 'Info: Process completed successfully, execution time: %.1fs.';
list{60} = 'An Exception has occurred while running mat_inverse';
list{61} = 'Fatal error!';
list{62} = 'Please wait';
list{63} = 'Process completed';
list{64} = 'Inversion process has been completed successfully.';
list{65} = 'Error: Solution not solved yet!';
list{66} = 'Calculated Dispersion v/s Experimental Curve';
list{67} = 'Experimental dispersion curve';
list{68} = 'Inverse dispersion curve';
list{69} = 'Shear Wave Velocity Profile';
list{70} = 'Shear Wave Velocity $V_s$ $(%s)$';
list{71} = 'Depth $(%s)$';
list{72} = 'Inverse value';
list{73} = 'Do create a new project?';
list{74} = 'Yes';
list{75} = 'No';
list{76} = 'Create a new project';
list{77} = 'Save project as';
list{78} = 'Mat_inverse project (*.invprj)';
list{79} = 'Error: Project have not been saved.';
list{80} = 'Choose name and disk location of the new project';
list{81} = 'Pick project file to load';
list{82} = 'Load project';
list{83} = 'Error: Project has not been loaded';
list{84} = 'Info: An Exception has occurred while loading the project.';
list{85} = 'Excel files (*.xlsx, *.xls)';
list{86} = 'Loading project...';
list{87} = 'Info: Project has been loaded successfully.';
list{88} = 'Info: An Exception has occurred while saving the actual project.';
list{89} = 'Info: Project saved successfully.';
list{90} = '%s - Mat inverse v2';
list{91} = 'project1';
list{92} = 'Total execution time: %.1fs';
list{93} = 'Dispersion file ''%s'' not found';
list{94} = 'Info: Project loaded, errors: %d.';
list{95} = 'Do you want to exit?';
list{96} = 'Creating plots...';
list{97} = 'Info: Plots created correctly.';
list{98} = 'Error: An exception occurred while generating the experimental scatter curve.';
list{99} = 'Error: An exception occurred while generating shear velocity profile.';
list{100} = 'Do you want to clean initial guess table?';
list{101} = 'Clean table';
list{102} = 'Variation of the dispersion curve as a function of the iterations';
list{103} = 'Error: There was an error in generating the scatter curve based on the iterations.';
list{104} = 'Iteration %d';
list{105} = 'Exporting results...';
list{106} = 'Excel file (*.xls)';
list{107} = 'Export project as';
list{108} = 'Error: Results have not been exported.';
list{109} = 'Info: An exception occurred while exporting results.';
list{110} = 'H';
list{111} = 'VR';
list{112} = 'VS';
list{113} = 'VP';
list{114} = 'FREQ';
list{115} = 'RHO';
list{116} = 'ITERATION';
list{117} = 'Info: Results successfully exported.';
list{118} = 'Import files';
list{119} = 'Import dispersion file';
list{120} = 'Clean inversion parameters';
list{121} = 'Settings';
list{122} = 'App configuration';
list{123} = 'Language';
list{124} = 'Enable sounds';
list{125} = 'Automatically delete incorrect data';
list{126} = 'Saved configuration';
list{127} = 'You must restart the application for the changes to take effect';
list{128} = 'Error: Gui directory does not exist, configuration can not be loaded.';
list{129} = 'Solution configuration';
list{130} = 'Inversion settings';
list{131} = 'Graph settings';
list{132} = 'Calculated dispersive curve vs experimental';
list{133} = 'Shear velocity profile vs depth';
list{134} = 'Phase velocity vs. iterations curve';
list{135} = 'Initial parameters';
list{136} = 'Coefficient mu';
list{137} = 'Coefficient sigma';
list{138} = 'Maximum number of iterations max_iter';
list{139} = 'Tolerance of vs, tol_vs';
list{140} = 'Shear velocity profile vs initial guess';
list{141} = 'Error: An error occurred while generating the comparison of the cutting speed.';
list{142} = 'Comparison of shear velocity vs initial estimation';
list{143} = 'Shear velocity';
list{144} = '_results.xls';
list{145} = 'View dispersion table';
list{146} = 'Dispersion table';
list{147} = '';
list{148} = '';
list{149} = '';
list{150} = '';
% --------------------------------------------------------------------

end

